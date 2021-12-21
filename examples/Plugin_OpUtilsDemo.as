#include "OpUtils.as" //Include OpenPlanet Utils.

void Main()
{
    // Get the Time.
    auto sysTime = OpUtils::Time::GetSystemTime();
    auto gameTime = OpUtils::Time::GetGameTime();
    print("Time: " + sysTime + " Game: " + gameTime);

    //Get Plugin info
    string pluginName = OpUtils::Meta::GetPluginTitle();
    print("Plugin: " + pluginName + " Type: " + OpUtils::Meta::GetPluginType());

    while (true)
    {
        yield();
    }
}