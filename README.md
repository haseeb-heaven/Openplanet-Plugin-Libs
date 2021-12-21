# Openplanet-Plugin-Libs
This repo consists list of Helper libraries for [Openplanet](https://openplanet.nl) plugins written in [AngelScripts](https://www.angelcode.com/angelscript/), it contains  Utilities for both [OpenPlanet Api](https://openplanet.nl/docs) and [TrackMania Next Api](https://next.openplanet.nl/) which you can include in your Scripts and write plugins easily.

## [Openplanet](https://openplanet.nl) API Information.
Utils `OpUtils.as` is utilities for different Api like _Core,Time,Net,Meta,Json,Net_ and more this provide helper methods
to interact with Api's safe and easily.

### How to Access Api Helper methods.
To access Api's helper methods check [OpenPlanet Api Docs](https://openplanet.nl/docs) and see its file structure.<br/>
If you wish to access _Time Api_ helper methods then write<br/>
_OpUtils::_**Api-Name**_::HelperMethod()_<br/>
example : `auto sysTime = OpUtils::Time::GetSystemTime();`<br/>

List of Available Helper Api's.

- [Time Api](https://openplanet.nl/docs/group/Time) - Date and Time helper methods.
- [Net Api](https://openplanet.nl/docs/group/Net) - Network and Sockets helper methods.
- [UI Api](https://openplanet.nl/docs/group/UI) - ImGui helper methods.
- [Meta Api](https://openplanet.nl/docs/group/Meta) - Plugin Scripts helper methods.

## [Openplanet](https://openplanet.nl) API Examples.
File `examples\Plugin_OpUtilsDemo.as` contains examples of using this Api.

## [TrackManiaNext 2020](https://www.trackmania.com/) API Information.
Utils `TmUtils.as` is utilities for different Api like _Core,Time,Net,Meta,Json,Net_ and more this provide helper methods
to interact with Api's safe and easily.

### How to Access Api Helper methods.
To access Api's helper methods check [TrackMania Next Api Docs](https://next.openplanet.nl/) and see its file structure.
If you wish to access _Game Api_ helper methods then write<br/>
_TmUtils::_**Api-Name**_::HelperMethod()_ <br/>
example : `auto rootMap = TmUtils::Game::GetRootMap();`<br/>

And same goes with other Api's like if you wish to access Shootmania then write.<br/>
`auto player = TmUtils::ShootMania::GetActivePlayer();`<br/>

List of Available Helper Api's.

- [TrackMania Api](https://next.openplanet.nl/TrackMania) - TrackMania helper methods.
- [Net Api](https://next.openplanet.nl/Net) - Net,Socket,Client helper methods.
- [ShootMania Api](https://next.openplanet.nl/ShootMania) - ShootMania helper methods.
- [Hms Api](https://next.openplanet.nl/Hms) - Hms Viewport helper methods.
- [Game Api](https://next.openplanet.nl/Game) - Game Map/Challenge helper methods.
- [System Api](https://next.openplanet.nl/System) - System Display helper methods.
- [MetaNotPersistent Api](https://next.openplanet.nl/MetaNotPersistent) - Game Scene helper methods.

## [TrackManiaNext 2020](https://www.trackmania.com/) API Examples.
File `examples\Plugin_TmUtilsDemo.as` contains examples of using this Api.

## Logger library Information.
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
- Automatic detection - Ability to automatically detect Plugin name from **Meta**.
- Toggle Logs - Ability to toggle logs on/off at any given point.
- Plugin Name - Ability to add Plugin name on console to distinguish from other logs easily.

### Examples.
Folder `examples` contains various examples of TrackMania and OpenPlanet Utils.

`Logger Demo output.`
![Logger_Demo](https://i.ibb.co/k121BbC/Open-Logger.png)

### Contributing
If you wish to contribute to this project then please do **PR** request and maintain the same strucute of Api directories.

**VERSION INFO :**<br/>
Utilites Version 1.0      Dated : 12/22/2021.<br/>

**CHANGE LOGS FOR V 1.0** <br/>
**[+]** Added Utils for **Openplanet** and **TrackMania-Next 2020**.<br/>
**[+]** Added Examples for both Utils in `examples` folder.<br/>
**[+]** Updated **Logger** library. <br/>

written and maintained by _Haseeb_ _Heaven_ (haseebmir.hm@gmail.com)