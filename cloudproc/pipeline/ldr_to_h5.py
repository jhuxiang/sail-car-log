import os
import argparse
import numpy as np
import h5py
from Q50_config import LoadParameters
from GPSReader import GPSReader
from GPSTransforms import IMUTransforms
from LidarTransforms import loadLDR, loadLDRCamMap
from pipeline_config import EXPORT_STEP, EXPORT_START, EXPORT_NUM

'''
Essentially just pieces from LidarIntegrator except avoids
storing the data for all time steps in memory

Writes full point clouds for scan matching later
'''


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Convert ldr files to h5 files containing points')
    parser.add_argument('gps', help='gps file')
    parser.add_argument('map', help='map file')
    parser.add_argument('h5_dir', help='directory to write h5 files to')
    parser.add_argument('--full', action='store_true')
    args = parser.parse_args()

    gps_reader = GPSReader(args.gps)
    GPSData = gps_reader.getNumericData()
    imu_transforms = IMUTransforms(GPSData)

    # Assuming want to just export from start to end
    step = EXPORT_STEP
    if args.full:
        start = 0
        num_fn = GPSData.shape[0] / step
    else:
        start = EXPORT_START
        num_fn = EXPORT_NUM
    end = start + num_fn * step

    trans_wrt_imu = imu_transforms[start:end, 0:3, 3]

    params = LoadParameters('q50_4_3_14_params')  # FIXME
    ldr_map = loadLDRCamMap(args.map)

    for t in range(num_fn):
        fnum = start + t * step
        print '%d / %d' % (fnum, end)

        data = loadLDR(ldr_map[fnum])
        if data.shape[0] == 0:
            print '%d data empty' % t
            raise

        # transform data into IMU frame at time t
        pts = data[:, 0:3].transpose()
        pts = np.vstack((pts, np.ones((1, pts.shape[1]))))
        T_from_l_to_i = params['lidar']['T_from_l_to_i']
        pts = np.dot(T_from_l_to_i, pts)
        # transform data into imu_0 frame
        pts = np.dot(imu_transforms[fnum, :, :], pts)
        pts = pts.transpose()

        # for exporting purposes
        pts_copy = np.array(pts[:, 0:3])
        pts_copy = np.column_stack((pts_copy, np.array(data[:, 3])))
        pts_copy = np.column_stack((pts_copy, fnum*np.ones((pts.shape[0], 1))))

        fname = os.path.join(args.h5_dir, '%d.h5' % t)
        h5f = h5py.File(fname, 'w')
        dset = h5f.create_dataset('points', pts_copy.shape, dtype='f')
        dset[...] = pts_copy
        h5f.close()
