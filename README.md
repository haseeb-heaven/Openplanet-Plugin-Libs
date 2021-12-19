# Openplanet-Plugin-Libs
This repo consists list of Helper libraries for Openplanet plugins written in AngelScripts, it contains mostly Utilities,UI,Time libraries which you can include in your Scripts and write plugins easily.

### Fles information.

## Logger.
Library `Logger.as` is the logger library with **trace,warn,err** debuuging levels.

List of Public Methods.

- `SetPluginName()/GetPluginName()` - Set or gets your plugin name.
- `EnableLogs()` - Enable or disable logs. _This property set to True by default=Enabled_
- `AddLogInfo()` - Adds log message as information on console.
- `AddLogTrace()` - Adds log message as trace on console.
- `AddLogWarning()` - Adds log message as warning on console.
- `AddLogError()` - Adds log message as error on console.

### Features.
- Time stamp - Ability to add time stamps on logs.
- Toggle Logs - Ability to toggle logs on/off at any given point.
- Plugin Name - Ability to add Plugin name on console to distinguish from other logs easily.

## Utils. [BETA]
Utils `Utils.as` is utilities for different types UI,Time,Clock etc.

List of Public Methods.

- `GetSystemTime()` - Get current system time, Utc also supported.
- `GetGameTime()` - Get game time running Utc also supported.

### Logger-Demo.
File `Plugin_LoggerDemo.as` contains demo plugin to show demo of Logger.

`Logger Demo output.`
![Logger_Demo](https://i.ibb.co/k121BbC/Open-Logger.png)
