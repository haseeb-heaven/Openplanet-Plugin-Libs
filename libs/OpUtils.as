namespace OpUtils
{
    // Public Properties and methods for Openplanet [Time API]. - Docs: https://openplanet.nl/docs/group/Time
    namespace Time
    {
        enum TIME_TYPE
        {
            TIME,
            MACHINE_TIME
        };

        Time::Info GetTimeInfo(TIME_TYPE timeType)
        {
            uint64 timeStamp = (timeType == TIME_TYPE::TIME) ? Time::get_Now() : Time::get_Stamp();
            Time::Info timeInfo = Time::Parse(timeStamp);
            return timeInfo;
        }

        string GetTimeFormatted(TIME_TYPE timeType, bool utcTime = false)
        {
            uint64 timeStamp = (timeType == TIME_TYPE::TIME) ? Time::get_Now() : Time::get_Stamp();
            string timeFormatted = Time::FormatString("%H:%M:%S", timeStamp);
            return timeFormatted;
        }

        string GetSystemTime(bool utcTime = false)
        {
            return GetTimeFormatted(TIME_TYPE::MACHINE_TIME, utcTime);
        }

        string GetGameTime(bool utcTime = false)
        {
            return GetTimeFormatted(TIME_TYPE::TIME, utcTime);
        }
    }

    // Public Properties and methods for Openplanet [Json API]. - Docs: https://openplanet.nl/docs/group/Json
    namespace Json
    {

    }

    // Public Properties and methods for Openplanet [Net API]. - Docs: https://openplanet.nl/docs/group/Net
    namespace Net
    {
        string SendApiRequest(string url)
        {
            Net::HttpRequest request;
            request.Method = Net::HttpMethod::Get;
            request.Url = url;
            request.Start();

            while (!request.Finished())
            {
                yield();
            }
            string response = req.String();
            return response;
        }
    }

    // Public Properties and methods for Openplanet [UI API]. - Docs: https://openplanet.nl/docs/group/UI
    namespace UI
    {
        void ShowCheckedNotification(string notificationMsg, bool &out checked)
        {
            string pluginTitle = Meta::GetPluginTitle();
            if (checked)
            {
                UI::ShowNotification(pluginTitle, notificationMsg);
                checked = false;
            }
        }
    }

    // Public Properties and methods for Openplanet [Meta API]. - Docs: https://openplanet.nl/docs/group/Meta
    namespace Meta
    {
        string GetPluginTitle(string icon = "")
        {
            string title = Meta::ExecutingPlugin().Name.Length == 0 ? "UNKNOWN-PLUGIN" : Meta::ExecutingPlugin().Name;
            string titleIcon = "\\$c6f" + icon + "\\$z " + title;
            return titleIcon;
        }

        Meta::PluginSetting@[]@ GetPluginSettings()
        {
            auto settings = Meta::ExecutingPlugin().GetSettings();
            return settings;
        }

        string GetPluginType()
        {
            auto pluginType = Meta::ExecutingPlugin().Type;
            string pluginTypeStr = "Unknown";

            if (pluginType == Meta::PluginType::Unknown)
                pluginTypeStr = "Unknown";
            else if (pluginType == Meta::PluginType::Legacy)
                pluginTypeStr = "Legacy";
            else if (pluginType == Meta::PluginType::Folder)
                pluginTypeStr = "Folder";
            else if (pluginType == Meta::PluginType::Zip)
                pluginTypeStr = "Zip";
            return pluginTypeStr;
        }

        Meta::Plugin@ GetPluginFromName(string pluginName)
        {
            auto allPlugins = Meta::AllPlugins();

            for (uint idx = 0; idx < allPlugins.Length; idx++)
            {
                if (allPlugins[idx].Name == pluginName)
                    return allPlugins[idx];
            }
            return Meta::ExecutingPlugin();
        }

    }
}