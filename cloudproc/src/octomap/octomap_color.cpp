#include <string>

#include <boost/progress.hpp>

#include <pcl/common/transforms.h>

#include <octomap/octomap.h>

#include "parameters.h"
#include "cloud_server.h"
#include "../videoreader/VideoReader.h"
#include "utils/cv_utils.h"

int main(int argc, char** arv)
{
    params().initialize();
    int start = params().start;
    int count = params().count;
    int step = params().step;
    int end = params().end;

    // Load the octomap

    boost::shared_ptr<octomap::OcTree> octree((octomap::OcTree*)octomap::OcTree::read(params().octomap_file));
    std::cout << "Loaded octree of size " << octree->size() << std::endl;
    if (!octree->size())
        return 1;
    // TODO Figure out why these don't match parameters from octree written
    //std::cout << "Occupancy threshold: " << octree->getOccupancyThres() << std::endl;
    //std::cout << "Clamp [min, max]: " << "[" << octree->getClampingThresMin() << ", " << octree->getClampingThresMax() << "]" << std::endl;
    //std::cout << "Prob hit/miss: " << octree->getProbHit() << " / " << octree->getProbMiss() << std::endl;

    // Initialize cloud server

    server().initialize(params().pcd_downsampled_dir, params().color_dir,
            params().h5_dir, params().map_color_window, params().count);

    // Initialize reader

    VideoReader reader(params().dset_dir, params().dset_avi);
    reader.setFrame(start);
    cv::Mat frame;

    std::vector<cv::Point2f> pixels;
    std::vector<cv::Point2f> filtered_pixels;
    std::vector<cv::Vec3b> pixel_colors;

    boost::progress_display show_progress(count);
    for (int k = start; k < end; k += step)
    {
        int num_steps = (k - start) / step;

        // Read frame

        bool success = reader.getNextFrame(frame);
        if (!success)
        {
            std::cout << "Reached end of video before expected" << std::endl;
            return 1;
        }

        Eigen::Matrix4f transform = server().transforms[num_steps];

        std::vector<pcl::PointCloud<pcl::PointXYZ>::Ptr> current_clouds;
        std::vector<Eigen::MatrixXi*> current_colors;

        server().forward(num_steps);
        server().getCurrentWindow(current_clouds, current_colors);
        assert (current_clouds.size() == current_colors.size());

        for (int w = 0; w < current_clouds.size(); w++)
        {
            pcl::PointCloud<pcl::PointXYZ>::Ptr pcloud(new pcl::PointCloud<pcl::PointXYZ>());
            pcl::copyPointCloud(*(current_clouds[w]), *pcloud);

            // Transform point cloud
            // We start with the clouds wrt imu_0

            // TODO Could just do all of these transforms to all the clouds beforehand

            // Transform to imu_t
            pcl::transformPointCloud(*pcloud, *pcloud, transform.inverse().eval());
            // Transform to lidar_t
            pcl::transformPointCloud(*pcloud, *pcloud, params().T_from_i_to_l);
            // Transform to camera_t
            pcl::transformPointCloud(*pcloud, *pcloud, params().trans_from_l_to_c);
            pcl::transformPointCloud(*pcloud, *pcloud, params().rot_to_c_from_l);

            // Filter point cloud
            std::vector<int> filtered_indices;
            pcl::PointCloud<PointXYZ>::Ptr final_cloud(new pcl::PointCloud<PointXYZ>());
            filter_lidar_cloud(pcloud, final_cloud, filtered_indices);
            assert (final_cloud->size() == filtered_indices.size());

            Eigen::MatrixXi* color = current_colors[w];

            // Get colors by projecting the point cloud

            if (final_cloud->size() == 0)
                continue;
            project_cloud_eigen(final_cloud, Eigen::Vector3f::Zero(), Eigen::Matrix3f::Identity(),
                    params().intrinsics, params().distortions, pixels);

            // Filter pixels

            std::vector<int> filtered_indices_indices;
            filter_pixels(pixels, frame, filtered_pixels, filtered_indices_indices);

            std::vector<int> final_indices;
            BOOST_FOREACH(int ind, filtered_indices_indices)
            {
                final_indices.push_back(filtered_indices[ind]);
            }

            // Project each remaining point back and see if it hits anything

            // Get origin of camera in imu 0 frame
            Eigen::Vector4f imu_origin = transform.block<4, 1>(0, 3);
            Eigen::Vector4f lidar_origin = params().T_from_i_to_l * imu_origin;
            octomap::point3d lidar_pos(lidar_origin(0), lidar_origin(1), lidar_origin(2));

            std::vector<int> octomap_indices;
            std::vector<cv::Point2f> octomap_pixels;
            // Treat as free space or not
            bool ignore_unknown = true;  // PARAM
            float tol = params().raycast_tol;

            if (params().handle_occlusions)
            {
                for (int j = 0; j < final_indices.size(); j++)
                {
                    int ind = final_indices[j];

                    // Original point location in imu_0 frame
                    pcl::PointXYZ pt = current_clouds[w]->at(ind);
                    octomap::point3d pt_origin(pt.x, pt.y, pt.z);
                    octomap::point3d ray_end;
                    double max_range = (pt_origin - lidar_pos).norm() + tol;
                    bool cast_success = octree->castRay(lidar_pos, (pt_origin - lidar_pos), ray_end, ignore_unknown, max_range);

                    // Check that ray end didn't hit occluding object in front of the car
                    if (cast_success && (ray_end - pt_origin).norm() > tol)
                    {
                        //std::cout << "pt_origin: " << pt_origin << " ray_end: " << ray_end << " lidar_pos: " << lidar_pos << std::endl;
                        continue;
                    }

                    octomap_indices.push_back(ind);
                    octomap_pixels.push_back(filtered_pixels[j]);
                }
            }
            else
            {
                octomap_indices = final_indices;
                octomap_pixels = filtered_pixels;
            }

            // Finally set some colors

            //get_pixel_colors(filtered_pixels, frame, pixel_colors);
            //assert (pixel_colors.size() == final_indices.size());
            get_pixel_colors(octomap_pixels, frame, pixel_colors);
            assert (pixel_colors.size() == octomap_pixels.size());

            std::cout << "coloring " << pixel_colors.size() << "/" << final_indices.size() << " points" << std::endl;

            //for (int j = 0; j < pixel_colors.size(); j++)
            for (int j = 0; j < octomap_pixels.size(); j++)
            {
                // cv gives bgr so reverse
                (*color)(octomap_indices[j], 0) = pixel_colors[j][2];
                (*color)(octomap_indices[j], 1) = pixel_colors[j][1];
                (*color)(octomap_indices[j], 2) = pixel_colors[j][0];
            }

            //cv::Mat new_frame = frame;
            //set_pixel_colors(filtered_pixels, cv::Vec3b(0, 255, 0), new_frame, 4);
            //set_pixel_colors(octomap_pixels, cv::Vec3b(0, 0, 255), new_frame, 4);
            //cv::imshow("video", new_frame);
            //char k = 0;
            //while (k != 113)
            //{
                //k = cv::waitKey(0);
            //}
        }

        server().saveCurrentColorWindow();

        // Skip

        success = reader.skip(step - 1);
        if (!success)
        {
            std::cout << "Reached end of video before expected" << std::endl;
            return 1;
        }

        ++show_progress;
    }

    return 0;
}
