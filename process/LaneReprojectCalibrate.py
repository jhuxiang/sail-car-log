#usage
# python LidarReprojectCalibrate.py <dir-to-data> <basename> <start frame> 

from Q50_config import *
import sys, os
from GPSReader import *
from GPSTransforms import *
from VideoReader import *
from LidarTransforms import *
from ColorMap import *
from transformations import euler_matrix
import numpy as np
import cv2
import socket
import time
from ArgParser import *
import SocketServer
import threading
import random
import string
from scipy.spatial import cKDTree
import bisect
import os.path
global rx, ry, rz, crx, crz, R, cR, paramInit, port

paramInit = False
port = 3000 + int(random.random()*10000)

def ParametersToString(rx,ry,rz,crx,cry,crz):
    return "%f,%f,%f,%f,%f,%f\n" % (rx,ry,rz,crx,cry,crz)

class RequestHandler(SocketServer.BaseRequestHandler):
    def handle(self):
        global rx, ry, rz, crx, cry, crz, R, cR, paramInit 

        data = self.request[0].strip()
        print data
        (rx,ry,rz,crx,cry,crz) = map(lambda x: float(x), data.split(','))
        
        R = euler_matrix(rx,ry,rz)[0:3,0:3].transpose()
        #cR = euler_matrix(crx, cry, crz)[0:3,0:3]
        cR = euler_matrix(crx, cry, crz)[0:3,0:3]
        paramInit = True


class ThreadedServer(threading.Thread):
    def __init__(self, port):
        self.server = None
        self.port = port
        threading.Thread.__init__(self)
    def run(self):
        if self.server == None:
            address = ('localhost', self.port)
            self.server = SocketServer.UDPServer(address, RequestHandler)
        print 'starting server'
        self.server.serve_forever()


def zDistances(self, distances, global_frame, starting_point, meters_per_point, points_fwd):
    output = []
    point_num = 1
    dist = 0
    for pt in xrange(points_fwd):
      dist = pt * meters_per_point+starting_point
      output.append((np.abs(distances-dist)).argmin()+global_frame)


def lanePos(map_pos, imu_transforms_t, cam, T_from_i_to_l):
    # load nearby map frames
    pts_wrt_imu_0 = array(map_pos).transpose()
    pts_wrt_imu_0 = np.vstack((pts_wrt_imu_0, np.ones((1,pts_wrt_imu_0.shape[1]))))
    # transform points from imu_0 to imu_t
    pts_wrt_imu_t = np.dot( np.linalg.inv(imu_transforms_t), pts_wrt_imu_0)
    # transform points from imu_t to lidar_t
    pts_wrt_lidar_t = np.dot(T_from_i_to_l, pts_wrt_imu_t);
    # transform points from lidar_t to camera_t
    pts_wrt_camera_t = pts_wrt_lidar_t.transpose()[:, 0:3] + cam['displacement_from_l_to_c_in_lidar_frame']
    pts_wrt_camera_t = np.dot(cR, np.dot(R_to_c_from_l_old(0),
            pts_wrt_camera_t.transpose()))    
    pts_wrt_camera_t = np.vstack((pts_wrt_camera_t,
        np.ones((1,pts_wrt_camera_t.shape[1]))))
    pts_wrt_camera_t = dot(cam['E'], pts_wrt_camera_t)
    pts_wrt_camera_t = pts_wrt_camera_t[0:3,:]
    return pts_wrt_camera_t

def cloudToPixels(cam, pts_wrt_cam): 

    width = 4
    (pix, J)  = cv2.projectPoints(pts_wrt_cam.transpose(), np.array([0.0,0.0,0.0]), np.array([0.0,0.0,0.0]), cam['KK'], cam['distort'])
    pix = pix.transpose()
    pix = np.around(pix[:, 0, :])
    pix = pix.astype(np.int32)
    mask = np.logical_and(True, pix[0,:] > 0 + width/2)
    mask = np.logical_and(mask, pix[1,:] > 0 + width/2)
    mask = np.logical_and(mask, pix[0,:] < 1279 - width/2)
    mask = np.logical_and(mask, pix[1,:] < 959 - width/2)
    #mask = np.logical_and(mask, pix[1,:] < 1039 - width/2)
    #mask = np.logical_and(mask, pix[0,:] < 2079 - width/2)
    mask = np.logical_and(mask, pts_wrt_cam[2,:] > 0)
    dist_sqr = np.sum( pts_wrt_cam[0:3, :] ** 2, axis = 0)
    mask = np.logical_and(mask, dist_sqr > 3)

    return (pix, mask)

def lidarPtsToPixels(pts_wrt_imu_0, imu_transforms_t, T_from_i_to_l, cam):
    # Transform points back to imu_t
    pts_wrt_imu_t = np.dot(np.linalg.inv(imu_transforms_t), pts_wrt_imu_0)
    #pts_wrt_imu_t = pts_wrt_imu_0

    # transform points from imu_t to lidar_t
    pts_wrt_lidar_t = np.dot(T_from_i_to_l, pts_wrt_imu_t)

    # transform points from lidar_t to camera_t
    pts_wrt_camera_t = pts_wrt_lidar_t.transpose()[:, 0:3] + cam['displacement_from_l_to_c_in_lidar_frame']
    pts_wrt_camera_t = np.dot(cR, np.dot(R_to_c_from_l_old(0), 
            pts_wrt_camera_t.transpose()))

    pts_wrt_camera_t = np.vstack((pts_wrt_camera_t,
        np.ones((1, pts_wrt_camera_t.shape[1]))))
    pts_wrt_camera_t = dot(cam['E'], pts_wrt_camera_t)
    pts_wrt_camera_t = pts_wrt_camera_t[0:3,:]

    # reproject camera_t points in camera frame
    (pix, mask) = cloudToPixels(cam, pts_wrt_camera_t)

    return (pix, mask)

def lidarPtsToPixels_old(pts_wrt_lidar_t, imu_transforms_t, cam):
    # transform points from lidar_t to camera_t
    pts_wrt_camera_t = pts_wrt_lidar_t.transpose()[:, 0:3] + cam['displacement_from_l_to_c_in_lidar_frame']
    pts_wrt_camera_t = np.dot(cR, np.dot(R_to_c_from_l_old(0), 
            pts_wrt_camera_t.transpose()))

    pts_wrt_camera_t = np.vstack((pts_wrt_camera_t,
        np.ones((1,pts_wrt_camera_t.shape[1]))))
    pts_wrt_camera_t = dot(cam['E'], pts_wrt_camera_t)
    pts_wrt_camera_t = pts_wrt_camera_t[0:3,:]

    # reproject camera_t points in camera frame
    (pix, mask) = cloudToPixels(cam, pts_wrt_camera_t)

    return (pix, mask)

if __name__ == '__main__':
    showLidar=False
    # current status of rotation
    crx=0.042000
    cry=0.022000
    crz=0.015000
    cR = euler_matrix(crx, cry, crz)[0:3,0:3]
    # stardard arg parsing
    args = parse_args(sys.argv[1], sys.argv[2])
    cam_num = int(sys.argv[2][-5])
    video_file = args['video']
    video_reader = VideoReader(video_file)
    params = args['params'] 
    cam = params['cam'][cam_num-1]
    if os.path.isfile(args['gps_mark2']):
      gps_key1='gps_mark1'
      gps_key2='gps_mark2'
      postfix_len = 13
    else:
      gps_key1='gps'
      gps_key2='gps'
      postfix_len=8
      
    #gps_filename= args['gps']
    gps_filename= args[gps_key2]
    gps_reader = GPSReader(gps_filename)
    prefix = gps_filename[0:-postfix_len]
    gps_data = gps_reader.getNumericData()
    lidar_loader = LDRLoader(args['frames'])
    imu_transforms = IMUTransforms(gps_data)
    gps_times = utc_from_gps_log_all(gps_data)
    

    gps_filename1= args[gps_key1]
    gps_reader1 = GPSReader(gps_filename1)
    gps_data1 = gps_reader1.getNumericData()
    imu_transforms1 = IMUTransforms(gps_data1)
    gps_times1 = utc_from_gps_log_all(gps_data1)
    lane_filename = string.replace(prefix+'_multilane_points_done.npz', 'q50_data', '640x480_Q50')
    lanes = np.load(lane_filename)

    # parameter server
    thr = ThreadedServer(port)
    thr.setDaemon(True)
    thr.start()
    time.sleep(1)
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.sendto('PARAMETER_REQUEST:'+str(port)+'\n', ('localhost', 2929))
    while not paramInit:
        time.sleep(1)

    T_from_l_to_i = params['lidar']['T_from_l_to_i']
    T_from_i_to_l = np.linalg.inv(T_from_l_to_i)
    fwd_range=100
    colors = [(255,0,0),(0,255,0),(0,0,255),(255,255,0),(255,0,255),(0,255,255),(128,128,255),(128,255,128),(255,128,128),(128,128,0),(128,0,128),(0,128,128),(0,128,255),(0,255,128),(128,0,255),(128,255,0),(255,0,128),(255,128,0)]
    counter = int(sys.argv[3])
    bg_filename = string.replace(prefix+'2_bg.npz', 'q50_data', '640x480_Q50')
    while success and t+seconds_ahead*1000000<gps_times[-1]:
      #cR = R[counter,:,:]
      video_reader.setFrame(counter)
      (success, orig) = video_reader.getNextFrame()
      if not success:
        continue
      I = orig.copy()
      #fnum = video_reader.framenum
      if cam_num<=2:
        fnum = counter
      else:
        fnum = counter*2      
      t = gps_times[fnum]
      fnum1 = Idfromt(gps_times1,t)
      
      if showLidar:
        data, data_times = lidar_loader.loadLDRWindow(t-50000, 0.1)
        bg_data = np.load(bg_filename)['data']
        tree = cKDTree(bg_data[:,:3])
        nearby_idx = np.array(tree.query_ball_point(imu_transforms[fnum,0:3,3], r=100.0))
        bg_pts=bg_data[nearby_idx,:3].transpose()
        bg_pts = np.vstack((bg_pts, np.ones((1, bg_pts.shape[1]))))
        (pix, mask) = lidarPtsToPixels(bg_pts, imu_transforms1[fnum1,:,:], T_from_i_to_l,cam); 
        if pix is not None:
          for p in range(4):
            I[pix[1,mask]+p, pix[0,mask], :] = [255,255,255]#heat_colors[0,:,:]
            I[pix[1,mask], pix[0,mask]+p, :] = [255,255,255]#heat_colors[0,:,:]
            I[pix[1,mask]+p, pix[0,mask], :] = [255,255,255]#heat_colors[0,:,:]
            I[pix[1,mask], pix[0,mask]+p, :] = [255,255,255]#heat_colors[0,:,:]
      
      # now draw interpolated lanes
      #ids = range(fnum, fnum+frames_ahead)
      ids = np.where(np.logical_and(gps_times1>t-seconds_ahead*1000000, gps_times1<t+seconds_ahead*1000000))[0]
      for l in range(lanes['num_lanes']):
        lane_key = 'lane'+str(l)
        lane = lanes[lane_key]
        # find the appropriate portion on the lane (close to the position of car, in front of camera, etc)
        # find the closest point on the lane to the two end-points on the trajectory of car. ideally this should be done before-hand to increase efficiency.
        dist_near = np.sum((lane-imu_transforms1[ids[0],0:3,3])**2, axis=1) # find distances of lane to current 'near' position.
        dist_far = np.sum((lane-imu_transforms1[ids[-1],0:3,3])**2, axis=1) # find distances of lane to current 'far' position.
        dist_self = np.sum((lane-imu_transforms1[fnum1,0:3,3])**2, axis=1) # find distances of lane to current 'far' position.
        dist_mask = np.where(dist_self<=(fwd_range**2))[0]# only consider points to be valid within fwd_range from the self position
        if len(dist_mask)==0:
          continue
        nearid = np.argmin(dist_near[dist_mask]) # for those valid points, find the one closet to 'near' position.
        farid = np.argmin(dist_far[dist_mask]) #and far position
        lids = range(dist_mask[nearid], dist_mask[farid]+1) # convert back to global id and make it into a consecutive list. 
        
        #lane3d = lanePos(lane[lids,:], imu_transforms[fnum,:,:], cam,T_from_i_to_l) # lane markings in current camera frame
        #if np.all(lane3d[2,:]<=0):
        #  continue
        #lane3d = lane3d[:,lane3d[2,:]>0] # make sure in front of camera
        #(pix, mask) = cloudToPixels(cam, lane3d)
        pts = lane[lids, :].transpose()
        #pts = lane.transpose()
        pts = np.vstack((pts, np.ones((1, pts.shape[1]))))
        (pix, mask) = lidarPtsToPixels(pts, imu_transforms1[fnum1,:,:], T_from_i_to_l,cam);
        if pix is not None:
          for p in range(4):
            I[pix[1,mask]+p, pix[0,mask], :] = colors[(l)%18]
            I[pix[1,mask], pix[0,mask]+p, :] = colors[(l)%18]
            I[pix[1,mask]+p, pix[0,mask], :] = colors[(l)%18]
            I[pix[1,mask], pix[0,mask]+p, :] = colors[(l)%18]

      cv2.imshow('vid', I)
      key = cv2.waitKey(10)
      if key == -1:
        counter+=1
        continue
      key = chr(key & 255)
      if key == 'd':
        cry += 0.001
      elif key == 'a':
        cry -= 0.001
      elif key == 'w':
        crx += 0.001
      elif key == 's':
        crx -= 0.001
      elif key == '+':
        crz += 0.001
      elif key == '_' or key == '-':
        crz -= 0.001
      else:
        counter+=1
        continue
    
      #print (crx, cry, crz)
      cR = euler_matrix(crx, cry, crz)[0:3,0:3]
      sock.sendto('PARAMETER_UPDATE:'+str(port)+':'+ParametersToString(rx,ry,rz,crx,cry,crz), ('localhost', 2929))
      counter+=1
