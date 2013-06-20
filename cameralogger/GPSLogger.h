#include <boost/function.hpp>
#include <boost/thread.hpp>
#include <boost/bind.hpp>
#include <serial/serial.h>
//#include "fps_calc.h"

using namespace std;
using namespace serial;

class GPSLogger {
    public:
        void safeWrite(string cmd);
        string safeRead();
        string getPacket();

        void Connect(string port);
        void Run();
        void Close();

    private:
        Serial* _port; 
};