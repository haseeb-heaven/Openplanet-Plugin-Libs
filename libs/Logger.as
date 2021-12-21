namespace Logger
{
    enum LOG_TYPE
    {
        INFO,
        TRACE,
        WARN,
        ERROR
    };

    class Logger
    {
        // Private Properties and methods.
    private string pluginName;
    private bool enableLogs;

        private string GetSystemTime(bool utcTime = false)
        {
            uint64 timeStamp = Time::get_Stamp();
            string timeFormatted = Time::FormatString("%H:%M:%S", timeStamp);
            return timeFormatted;
        }

        private void AddLog(string logMsg, LOG_TYPE logType)
        {
            if (logMsg.Length == 0 || !enableLogs)
                return; // AddLog nothing if message is empty.
            string sysTime = GetSystemTime();

            if (logType == LOG_TYPE::INFO)
                print("[" + sysTime + " " + pluginName + "] INFO : " + logMsg);

            else if (logType == LOG_TYPE::TRACE)
                trace("[" + sysTime + " " + pluginName + "] TRACE : " + logMsg);
            else if (logType == LOG_TYPE::WARN)
                warn("[" + sysTime + " " + pluginName + "] WARN : " + logMsg);

            else if (logType == LOG_TYPE::ERROR)
                error("[" + sysTime + " " + pluginName + "] ERR : " + logMsg);
        }

        // Public Setters/Getters for Logger.
        void SetPluginName(string pluginName) { this.pluginName = pluginName; }
        string GetPluginName() { return pluginName.Length == 0 ? "" : pluginName; }
        void EnableLogs(bool enableLogs) { this.enableLogs = enableLogs; }

        // Public Ctor/Dtor.
        Logger()
        {
            pluginName = Meta::ExecutingPlugin().Name.Length == 0 ? "UNKNOWN-PLUGIN" : Meta::ExecutingPlugin().Name;
            enableLogs = true; // Logs enabled by default.
        }
        ~Logger() {}

        // Public methods for Logger.
        void AddLogInfo(string logMsg)
        {
            AddLog(logMsg, LOG_TYPE::INFO);
        }

        void AddLogTrace(string logMsg)
        {
            AddLog(logMsg, LOG_TYPE::TRACE);
        }

        void AddLogWarning(string logMsg)
        {
            AddLog(logMsg, LOG_TYPE::WARN);
        }

        void AddLogError(string logMsg)
        {
            AddLog(logMsg, LOG_TYPE::ERROR);
        }
    };
    Logger g_Logger;
}