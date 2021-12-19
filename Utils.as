namespace Utils{
enum TIME_TYPE
{ 
    GAME_TIME,//Game running time
    MACHINE_TIME//System Clock Time
}

class Utils {

     // Private Properties and methods.
    private Time::Info GetTimeInfo(TIME_TYPE timeType){
        uint64  timeStamp = (timeType == TIME_TYPE::GAME_TIME) ? Time::get_Now() : Time::get_Stamp();
        Time::Info timeInfo = Time::Parse(timeStamp);
        return timeInfo;
    }

    private string GetTimeFormatted(TIME_TYPE timeType,bool utcTime=false) {
        uint64  timeStamp = (timeType == TIME_TYPE::GAME_TIME) ? Time::get_Now() : Time::get_Stamp();
        string timeFormatted = Time::FormatString("%H:%M:%S", timeStamp);
        return timeFormatted;
    }

     // Public Properties and methods.
    string GetSystemTime(bool utcTime=false){
        return GetTimeFormatted(TIME_TYPE::MACHINE_TIME,utcTime);
    }

    string GetGameTime(bool utcTime=false){
        return GetTimeFormatted(TIME_TYPE::GAME_TIME,utcTime);
    }
}
    Utils g_Utils;
}