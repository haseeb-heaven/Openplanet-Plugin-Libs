#name "Logger-Demo"
#author "Heaven@HM"
#category "Utilities"

#include "Logger.as"//Include Logger library.
auto Log = Logger::g_Logger;//Typedef logger for ease.

void Main()
{
    Log.SetPluginName("Logger-Demo");//Setting Plugin name.
    //Adding logs to console.
    Log.AddLogInfo("This is my info");
    Log.AddLogTrace("This is my trace");
    Log.AddLogWarning("This is my warning");
    Log.AddLogError("This is my error");
}
