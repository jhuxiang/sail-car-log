from Q50_config import *
import sys, os
from GPSReader import *
from GPSReprojection import *
from GPSTransforms import *
from VideoReader import *
from LidarTransforms import *
from ColorMap import *
from transformations import euler_matrix
import numpy as np
import cv2
from ArgParser import *
from matplotlib import pyplot as plt
import pylab as pl
import pickle
WINDOW = 50*5

def cloudToPixels(cam, pts_wrt_cam): 
    width = 4
    pix = np.around(np.dot(cam['KK'], np.divide(pts_wrt_cam[0:3,:], pts_wrt_cam[2, :])))
    pix = pix.astype(np.int32)
    mask = np.logical_and(True, pix[0,:] > 0 + width/2)
    mask = np.logical_and(mask, pix[1,:] > 0 + width/2)
    mask = np.logical_and(mask, pix[0,:] < 1279 - width/2)
    mask = np.logical_and(mask, pix[1,:] < 959 - width/2)
    mask = np.logical_and(mask, pts_wrt_cam[2,:] > 0)
    dist_sqr = np.sum( pts_wrt_cam[0:3, :] ** 2, axis = 0)
    mask = np.logical_and(mask, dist_sqr > 3)

    return (pix, mask)

def localMapToPixels(map_data, imu_transforms_t, T_from_i_to_l, cam):
    # load nearby map frames
    pts_wrt_imu_0 = array(map_data[:,0:3]).transpose()
    pts_wrt_imu_0 = np.vstack((pts_wrt_imu_0, 
        np.ones((1,pts_wrt_imu_0.shape[1]))))
    # transform points from imu_0 to imu_t
    pts_wrt_imu_t = np.dot( np.linalg.inv(imu_transforms_t), pts_wrt_imu_0)
    # transform points from imu_t to lidar_t
    pts_wrt_lidar_t = np.dot(T_from_i_to_l, pts_wrt_imu_t);
    # transform points from lidar_t to camera_t
    pts_wrt_camera_t = pts_wrt_lidar_t.transpose()[:, 0:3] + cam['displacement_from_l_to_c_in_lidar_frame']
    pts_wrt_camera_t = dot(R_to_c_from_l(cam), 
            pts_wrt_camera_t.transpose())
    # reproject camera_t points in camera frame
    (pix, mask) = cloudToPixels(cam, pts_wrt_camera_t)

    return (pix, mask)

def localMapToPixelsTrajectory(imu_data, imu_transforms_t, T_from_i_to_l, cam, height=0):
    # load nearby map frames
    height_array = np.zeros([3,3])
    height_array[2,0]=-height
    aa = np.dot(imu_data[:,0:3,0:3], height_array)[:,:,0] # shift down in the self frame
    pts_wrt_imu_0 = (array(imu_data[:,0:3,3])+aa).transpose()
    pts_wrt_imu_0 = np.vstack((pts_wrt_imu_0, np.ones((1,pts_wrt_imu_0.shape[1]))))
    # transform points from imu_0 to imu_t
    pts_wrt_imu_t = np.dot( np.linalg.inv(imu_transforms_t), pts_wrt_imu_0)
    # transform points from imu_t to lidar_t
    pts_wrt_lidar_t = np.dot(T_from_i_to_l, pts_wrt_imu_t);
    # transform points from lidar_t to camera_t
    pts_wrt_camera_t = pts_wrt_lidar_t.transpose()[:, 0:3] + cam['displacement_from_l_to_c_in_lidar_frame']
    pts_wrt_camera_t = dot(R_to_c_from_l(cam), pts_wrt_camera_t.transpose())
    # reproject camera_t points in camera frame
    (pix, mask) = cloudToPixels(cam, pts_wrt_camera_t)

    return (pix, mask)

if __name__ == '__main__':
    args = parse_args(sys.argv[1], sys.argv[2])
    cam_num = int(sys.argv[2][-5])

    cam = GetQ50CameraParams()[cam_num - 1] 
    video_reader = VideoReader(args['video'])
    gps_reader = GPSReader(args['gps'])
    GPSData = gps_reader.getNumericData()
    imu_transforms = IMUTransforms(GPSData)
    
    T_from_i_to_l = np.linalg.inv(T_from_l_to_i)

    all_data = np.load(sys.argv[3])
    map_data = all_data['data']
    map_data = map_data[map_data[:,3] > 60, :] # intensity filter
    # map points are defined w.r.t the IMU position at time 0
    # each entry in map_data is (x,y,z,intensity,framenum). 
    all_data = pickle.load(open(sys.argv[4],'r'))
    left_data = all_data['left']
    right_data = all_data['right']
    print left_data.shape
    print right_data.shape
    # map points are defined w.r.t the IMU position at time 0
    # each entry in map_data is (x,y,z,intensity,framenum). 

    blue = [255,0,0] 
    green = [0,255,0] 
    red = [0,0,255]
    cnt=1 
    while True:
        #while video_reader.framenum<2000:
        #  (success, I) = video_reader.getNextFrame()
        for count in range(5):
            (success, I) = video_reader.getNextFrame()
        t = video_reader.framenum - 1
        mask_window = (map_data[:,4] < t + WINDOW) & (map_data[:,4] > t );
        map_data_copy = array(map_data[mask_window, :]);

        # reproject
        (pix, mask) = localMapToPixels(map_data_copy, imu_transforms[t,:,:], T_from_i_to_l, cam); 

        # draw 
        intensity = map_data_copy[mask, 3]
        heat_colors = heatColorMapFast(intensity, 0, 100)
        for p in range(4):
            I[pix[1,mask]+p, pix[0,mask], :] = heat_colors[0,:,:]
            I[pix[1,mask], pix[0,mask]+p, :] = heat_colors[0,:,:]
            I[pix[1,mask]+p, pix[0,mask], :] = heat_colors[0,:,:]
            I[pix[1,mask], pix[0,mask]+p, :] = heat_colors[0,:,:]
        # center trajectory
        (pix, mask) = localMapToPixelsTrajectory(imu_transforms[t+1:t+WINDOW+1, :, :], imu_transforms[t,:,:], T_from_i_to_l, cam, height=lidar_height); 
        # draw
        for p in range(4):
            I[pix[1,mask]+p, pix[0,mask], :] = red
            I[pix[1,mask], pix[0,mask]+p, :] = red
            I[pix[1,mask]+p, pix[0,mask], :] = red
            I[pix[1,mask], pix[0,mask]+p, :] = red


        # left lane
        # reproject
        (pix, mask) = localMapToPixels(left_data[t+1:t+WINDOW+1,:], imu_transforms[t,:,:], T_from_i_to_l, cam); 
        # draw
        for p in range(4):
            I[pix[1,mask]+p, pix[0,mask], :] = red
            I[pix[1,mask], pix[0,mask]+p, :] = red
            I[pix[1,mask]+p, pix[0,mask], :] = red
            I[pix[1,mask], pix[0,mask]+p, :] = red
        # right lane
        # reproject
        (pix, mask) = localMapToPixels(right_data[t+1:t+WINDOW+1,:], imu_transforms[t,:,:], T_from_i_to_l, cam); 
        # draw
        for p in range(4):
            I[pix[1,mask]+p, pix[0,mask], :] = red
            I[pix[1,mask], pix[0,mask]+p, :] = red
            I[pix[1,mask]+p, pix[0,mask], :] = red
            I[pix[1,mask], pix[0,mask]+p, :] = red
        I = cv2.resize(I, (640, 480))
        #cv2.imshow('vid', cv2.pyrDown(I))
        #cv2.waitKey(1)
        #cv2.imwrite('/scail/group/deeplearning/driving_data/twangcat/280N_New_vis/'+str(cnt)+'.png',I)
        #cnt +=1
        #cv2.imshow('vid', cv2.pyrDown(I))
        #cv2.waitKey(1)
        I = I[:,:,[2,1,0]]
        pl.ion()
        pl.imshow(I)
        #pl.pause(.1)
        pl.draw()
        pl.clf()
        pl.ioff()