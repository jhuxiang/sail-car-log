#define TWO_CAM
#define DISPLAY

#include <fstream>
#include "CameraLogger.h"
#include "GPSLogger.h"

#define ZMQ_CAMERALOGGER_BIND_PORT 5001 // this app will listen on this port
#define ZMQ_MASTER_SEND_PORT 5000 // this app will send to master on this port

#define CAMERA_DISPLAY_SKIP 3
#define NUMTHREAD_PER_BUFFER 10

SyncBuffer cam1_buff[NUMTHREAD_PER_BUFFER];
SyncBuffer cam2_buff[NUMTHREAD_PER_BUFFER];

zmq::context_t context(1);
zmq::socket_t my_commands(context, ZMQ_REQ);
zmq::socket_t send_response(context, ZMQ_REQ);

bool is_done_working = false; 
bool quit_via_user_input = false;

inline void ImageCallback(Image* pImage, const void* pCallbackData, 
    SyncBuffer* w_buff) { 
  if (!is_done_working) {
    Image* im = new Image();
    pImage->Convert(PIXEL_FORMAT_BGR, im);
    if (!w_buff->getBuffer()->pushBack(im)) {
      boost::mutex::scoped_lock io_lock ( *(w_buff->getMutex()) );
      cerr << "Warning! Buffer full, overwriting data!" << endl; 
    }
  }
}

void ctrlC (int)
{
#ifndef DISPLAY
  printf("\nCtrl-C detected, exit condition set to true.\n");
  is_done_working = true;
#endif
#ifdef DISPLAY
  printf("\nCtrl-C Disabled! Use 'q' to quit instead\n");
#endif
}

int main(int argc, char** argv)
{
  using namespace boost::program_options;
  options_description desc("Allowed options");
  desc.add_options()
    ("help", "produce help message")
    ("serial,s", value<string>(), "the serial location for the gps unit")
    ("maxframes,m", value<uint64_t>(), "maximum number of frames to capture")
    ("output,o", value<string>(), "the filename for data logging");

  signal (SIGINT, ctrlC);

  variables_map vm;
  store(parse_command_line(argc, argv, desc), vm);
  notify(vm);
  if (vm.count("help")) { 
    cout << desc << endl;
    return 1;
  }
  string fname1 = "";
  string fname2 = "";
  string fnamegps = "";
  if (vm.count("output")) { 
    fname1 = vm["output"].as<string>() + "1.avi";
    fname2 = vm["output"].as<string>() + "2.avi";
    fnamegps = vm["output"].as<string>() + "_gps.out";
  }
  else {
    cout << desc << endl;
    return 1;
  };

  uint64_t maxframes = -1; 
  if (vm.count("maxframes")) {
    maxframes = vm["maxframes"].as<uint64_t>(); 
  }

  bool useGPS = true;
  GPSLogger gpsLogger;
  ofstream gps_output;
  if (useGPS) {
    gps_output.open(fnamegps.c_str());
    gpsLogger.Connect(vm["serial"].as<string>());
  }

  cout << "Capturing for maximum of " << maxframes << " frames" << endl; 
  cout  << "Filenames: " << fname1 << " " << fname2 << endl; 

  for (int thread_num = 0; thread_num < NUMTHREAD_PER_BUFFER; thread_num++)
  {
    cam1_buff[thread_num].getBuffer()->setCapacity(1000);
    cam2_buff[thread_num].getBuffer()->setCapacity(1000);
  }

  int imageWidth = 1280;
  int imageHeight = 960;

  Camera* cam1 = ConnectCamera(0); // 0 indexing
  assert(cam1 != NULL);
  RunCamera(cam1);

  Consumer<Image>* cam1_consumer[NUMTHREAD_PER_BUFFER];
  for (int thread_num = 0; thread_num < NUMTHREAD_PER_BUFFER; thread_num++) {
    stringstream sstm;
    sstm << "split_" << thread_num << "_" << fname1; 
    string thread_fname = sstm.str();
    cam1_consumer[thread_num] = new Consumer<Image>(
        cam1_buff[thread_num].getBuffer(),
        thread_fname, cam1_buff[thread_num].getMutex(), 50.0f,
        imageWidth, imageHeight);
  }

#ifdef DISPLAY
  cvNamedWindow("cam1", CV_WINDOW_AUTOSIZE);
#endif

#ifdef TWO_CAM
  Camera* cam2 = ConnectCamera(1); // 0 indexing 
  assert(cam2 != NULL);
  RunCamera(cam2); 
  Consumer<Image>* cam2_consumer[NUMTHREAD_PER_BUFFER];
  for (int thread_num = 0; thread_num < NUMTHREAD_PER_BUFFER; thread_num++) {
    stringstream sstm;
    sstm << "split_" << thread_num << "_" << fname2; 
    string thread_fname = sstm.str();
    cam2_consumer[thread_num] = new Consumer<Image>(
        cam2_buff[thread_num].getBuffer(),
        thread_fname, cam2_buff[thread_num].getMutex(), 50.0f,
        imageWidth, imageHeight);
  }
#ifdef DISPLAY
  cvNamedWindow("cam2", CV_WINDOW_AUTOSIZE);
#endif
#endif

#ifdef DISPLAY
  IplImage* img = cvCreateImage(cvSize(imageWidth, imageHeight), IPL_DEPTH_8U, 3);
  int counter = 0;
#endif

  //// setup ZMQ communication
  my_commands.bind("tcp://localhost:"+ZMQ_CAMERALOGGER_BIND_PORT);
  zmq::message_t command_msg; 
  
  // start GPS Trigger
  if (useGPS) gpsLogger.Run();
  
  uint64_t numframes = 0; 
  ///////// main loop
  while (!is_done_working) {
    numframes++;
    if (numframes > maxframes) { 
      is_done_working = true;
    }
    if(my_commands.recv(&command_msg, ZMQ_NOBLOCK) == true) {
      //do stuff
    }

    Image image; 
    cam1->RetrieveBuffer(&image);
    ImageCallback(&image, NULL, &cam1_buff[numframes % NUMTHREAD_PER_BUFFER]);

#ifdef DISPLAY
    counter = (counter + 1) % CAMERA_DISPLAY_SKIP;
    Image cimage; 
    if (counter == 0) {
      image.Convert(PIXEL_FORMAT_BGR, &cimage);
      show(&cimage, img, "cam1");
    }
#endif
#ifdef TWO_CAM
    cam2->RetrieveBuffer(&image);
    ImageCallback(&image, NULL, &cam2_buff[numframes % NUMTHREAD_PER_BUFFER]);
#ifdef DISPLAY
    if (counter == 0) {
      image.Convert(PIXEL_FORMAT_BGR, &cimage);
      show(&cimage, img, "cam2");
    }
    char r = cvWaitKey(1);
    if (r == 'q') {
      is_done_working = true;
      quit_via_user_input = true;
    }
#endif // DISPLAY
#endif // TWO_CAM

    if (useGPS) {
      GPSLogger::GPSPacketType packet = gpsLogger.getPacket();
      string packet_contents = boost::get<1>(packet);
      gps_output << packet_contents << endl;
    }
  }  
  cout << "numframes = " << numframes << endl;


  /////// cleanup
  if (useGPS) gpsLogger.Close();
#ifdef DISPLAY
  cvDestroyWindow("cam1");
  cvDestroyWindow("cam2");
#endif
  for (int thread_num = 0; thread_num < NUMTHREAD_PER_BUFFER; thread_num++) {
    cam1_consumer[thread_num]->stop();
    delete cam1_consumer[thread_num];
  }
  CloseCamera(cam1);
  delete cam1; 
#ifdef TWO_CAM
  for (int thread_num = 0; thread_num < NUMTHREAD_PER_BUFFER; thread_num++) {
    cam2_consumer[thread_num]->stop();
    delete cam2_consumer[thread_num];
  }
  CloseCamera(cam2);
  delete cam2;
#endif
  if (quit_via_user_input) return 1;
  return 0;
}
