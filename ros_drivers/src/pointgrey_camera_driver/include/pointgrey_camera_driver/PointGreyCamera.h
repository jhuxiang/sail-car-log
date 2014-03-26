#ifndef _POINTGREYCAMERA_H_
#define _POINTGREYCAMERA_H_

#include <driver_base/SensorLevels.h> // Dynamic_reconfigure change levels
#include <sensor_msgs/Image.h> // ROS message header for Image
#include <sensor_msgs/image_encodings.h> // ROS header for the different supported image encoding types
#include <sensor_msgs/fill_image.h>
#include <pointgrey_camera_driver/camera_exceptions.h>

#include <sstream>

// Header generated by dynamic_reconfigure
#include <pointgrey_camera_driver/PointGreyConfig.h> 

// FlyCapture SDK from Point Grey
#include "flycapture/FlyCapture2.h"


class PointGreyCamera {
    
  public:
    PointGreyCamera();
    ~PointGreyCamera();
    
    /*!
    * \brief Function that connects to a specified camera.
    *
    * Will connect to the camera specified in the setDesiredCamera(std::string id) call.  If setDesiredCamera is not called first
    * this will connect to the first camera.  Connecting to the first camera is not recommended for multi-camera or production systems.
    * This function must be called before setNewConfiguration() or start()!
    */
    void connect();
    
    /*!
    * \brief Disconnects from the camera.
    *
    * Disconnects the camera and frees it.
    */
    void disconnect();
    
    /*!
    * \brief Starts the camera loading data into its buffer.
    *
    * This function will start the camera capturing images and loading them into the buffer.  To retrieve images, grabImage must be called.
    */
    void start();
    
    /*!
    * \brief Stops the camera loading data into its buffer.
    *
    * This function will stop the camera capturing images and loading them into the buffer.
    *
    * \return Returns true if the camera was started when called.  Useful for knowing if the camera needs restarted in certain instances.
    */
    bool stop();
    
    /*!
    * \brief Loads the raw data from the cameras buffer.
    *
    * This function will load the raw data from the buffer and place it into a sensor_msgs::Image.
    * \param image sensor_msgs::Image that will be filled with the image currently in the buffer.
    * \param frame_id The name of the optical frame of the camera.
    */
    void grabImage(sensor_msgs::Image &image, const std::string &frame_id);
    
    /*!
    * \brief Will set grabImage timeout for the camera.
    *
    * This function will set the time required for grabCamera to throw a timeout exception.  Must be called after connect().
    * \param timeout The desired timeout value (in seconds)
    *
    */
    void setTimeout(const double &timeout);
    
    /*!
    * \brief Used to set the serial number for the camera you wish to connect to.
    *
    * Sets the desired serial number.  If this value is not set, the driver will try to connect to the first camera on the bus.
    * This function should be called before connect().
    * \param id serial number for the camera.  Should be something like 10491081.
    */
    void setDesiredCamera(const uint32_t &id);
    
    std::vector<uint32_t> getAttachedCameras();
    
    /*!
    * \brief Gets the current operating temperature.
    *
    * Gets the camera's current reported operating temperature.
    *
    * \return The reported temperature in Celsius.
    */
    float getCameraTemperature();
    
    uint getGain();
    
    uint getShutter();
    
    uint getBrightness();
    
    uint getExposure();
    
    uint getWhiteBalance();
    
    uint getROIPosition();

    uint32_t readRegister(uint32_t address);
    void writeRegister(uint32_t address, uint32_t value);
    void setWhiteBalance(int red, int blue); 
    
  private:
    
    uint32_t serial_; ///< A variable to hold the serial number of the desired camera.
    FlyCapture2::BusManager busMgr_; ///< A FlyCapture2::BusManager that is responsible for finding the appropriate camera.
    FlyCapture2::Camera cam_; ///<  A FlyCapture2::Camera set by the bus manager.
    FlyCapture2::ImageMetadata metadata_; ///< Metadata from the last image, stores useful information such as timestamp, gain, shutter, brightness, exposure.
    
    boost::mutex mutex_; ///< A mutex to make sure that we don't try to grabImages while reconfiguring or vice versa.  Implemented with boost::mutex::scoped_lock.
    volatile bool captureRunning_; ///< A status boolean that checks if the camera has been started and is loading images into its buffer.

    float getCameraFrameRate();
    
    /*!
    * \brief Handles errors returned by FlyCapture2.
    *
    * Checks the status of a FlyCapture2::Error and if there is an error, will throw a runtime_error
    * \param prefix Message that will prefix the obscure FlyCapture2 error and provide context on the problem.
    * \param error FlyCapture2::Error that is returned from many FlyCapture functions.
    */
    void handleError(const std::string &prefix, FlyCapture2::Error &error) const;

};

#endif