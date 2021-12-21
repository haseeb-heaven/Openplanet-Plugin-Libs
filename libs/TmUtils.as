#if TMNEXT
namespace TmUtils
{
    // Public Properties and methods for TrackmaniaNext [Trackmania API]. - Docs: https://next.openplanet.nl/TrackMania
    namespace Trackmania
    {
        CTrackMania@ GetTmApp()
        {
            return cast<CTrackMania>(GetApp());
        }

        CTrackManiaPlayerInfo@ GetPlayerInfo(uint idx)
        {
            auto network = Net::GetNetwork();
            auto playerInfoLen = network.PlayerInfos.Length;
            if (idx < 0 || idx > playerInfoLen)
                return null;

            auto playerInfo = cast<CTrackManiaPlayerInfo>(network.PlayerInfos[idx]);
            return playerInfo;
        }

        CGameCtnNetServerInfo@ GetServerInfo()
        {
            auto serverInfo = cast<CGameCtnNetServerInfo>(Net::GetNetwork().ServerInfo);
            if (serverInfo is null)
                return null;
            return serverInfo;
        }

        CTrackManiaPlayerInfo@ GetPlayerInfo()
        {
            auto playerInfo = cast<CTrackManiaPlayerInfo>(Net::GetNetwork().PlayerInfo);
            if (playerInfo is null)
                return null;
            return playerInfo;
        }

        CTrackManiaMenus@ GetMenuManager()
        {
            auto menuManager = cast<CTrackManiaMenus>(Trackmania::GetTmApp().MenuManager);
            if (menuManager is null)
                return null;
            return menuManager;
        }
    }

    // Public Properties and methods for TrackmaniaNext [Net API]. - Docs: https://next.openplanet.nl/Net
    namespace Net
    {
        CTrackManiaNetwork@ GetNetwork()
        {
            return cast<CTrackManiaNetwork>(Trackmania::GetTmApp().Network);
        }

        CNetClient@ GetClient()
        {
            auto network = GetNetwork();
            if (network is null)
                return null;
            return network.Client;
        }

        CNetConnection@ GetConnection()
        {
            auto client = GetClient();
            if (client.Connections.Length > 0)
            {
                auto connection = client.Connections[0];
                return connection;
            }
            else
                return null;
        }

        CNetServerInfo@ GetConnectionInfo()
        {
            auto client = GetClient();
            if (client is null || client.Connections.Length == 0)
                return null;
            auto connection = client.Connections[0];
            if (!connection.ClientToServer)
                return null;
            auto connectionInfo = cast<CNetServerInfo>(connection.Info);
            return connectionInfo;
        }

        CNetServer@ GetServer()
        {
            auto network = GetNetwork();
            if (network is null)
                return null;
            return network.Server;
        }
    }

    // Public Properties and methods for TrackmaniaNext [ShootMania API]. - Docs: https://next.openplanet.nl/ShootMania
    namespace ShootMania
    {
        CSmArenaClient@ GetCurrentPlayground()
        {
            auto playerPlayground = cast<CSmArenaClient>(Trackmania::GetTmApp().CurrentPlayground);
            if (playerPlayground is null)
                return null;
            return playerPlayground;
        }

        CSmPlayer@ GetActivePlayer()
        {
            auto app = Trackmania::GetTmApp();
            if (app.CurrentPlayground is null)
            {
                return null;
            }
            if (app.CurrentPlayground.GameTerminals.Length <= 0 || app.CurrentPlayground.GameTerminals[0].GUIPlayer is null)
            {
                return null;
            }
            return cast<CSmPlayer>(app.CurrentPlayground.GameTerminals[0].GUIPlayer);
        }

        bool IsPlayerInGame()
        {
            bool inGame = false;
            if (cast<CSmArenaClient>(GetApp().CurrentPlayground) !is null)
            {
                CSmArenaClient@ playground = cast<CSmArenaClient>(Trackmania::GetTmApp().CurrentPlayground);
                if (playground.GameTerminals.Length <= 0 || playground.GameTerminals[0].UISequence_Current != CGameTerminal::ESGamePlaygroundUIConfig__EUISequence::Playing || cast<CSmPlayer>(playground.GameTerminals[0].GUIPlayer) is null || playground.Arena is null || playground.Map is null)
                {
                    inGame = false;
                }
                else
                    inGame = true;
            }
            return inGame;
        }

    }

    // Public Properties and methods for TrackmaniaNext [Hms API]. - Docs: https://next.openplanet.nl/Hms
    namespace Hms
    {
        CHmsViewport@ GetViewport()
        {
            auto viewPort = Trackmania::GetTmApp().Viewport;
            if (viewPort is null)
                return null;
            return viewPort;
        }
        void SetViewport_TargetFps(uint targetFps)
        {
            auto viewPort = Hms::GetViewport();
            viewPort.TargetFps = targetFps;
        }
    }

    // Public Properties and methods for TrackmaniaNext [Game API]. - Docs: https://next.openplanet.nl/Game
    namespace Game
    {
        CGameCtnChallenge@ GetRootMap()
        {
            auto rootMap = Trackmania::GetTmApp().RootMap;
            if (rootMap is null)
                return null;
            return rootMap;
        }

        CGameCtnChallengeInfo@ GetMapInfo()
        {
            return GetRootMap().MapInfo;
        }

        bool IsMapPlayable()
        {
            auto mapInfo = GetMapInfo();
            return mapInfo.IsPlayable;
        }

        CGamePlayerProfile@ GetCurrentProfile()
        {
            auto playerProfile = Trackmania::GetTmApp().CurrentProfile;
            if (playerProfile is null)
                return null;
            return playerProfile;
        }

        CGameManiaAppTitle@ GetManiaAppTitle()
        {
            auto appMenus = Trackmania::GetMenuManager();
            if (appMenus !is null)
            {
                CGameManiaAppTitle@ maniaAppTitle = cast<CGameManiaAppTitle>(appMenus.MenuCustom_CurrentManiaApp);
                if (maniaAppTitle !is null)
                    return maniaAppTitle;
            }
            return null;
        }

        CGameTerminal@ GetGameTerminal()
        {
            auto playGround = ShootMania::GetCurrentPlayground();
            if (playGround.GameTerminals.Length == 0)
                return null;
            return playGround.GameTerminals[0];
        }

        MwFastBuffer<CGameTerminal@ > GetGameTerminals()
        {
            auto playGround = Trackmania::GetTmApp().CurrentPlayground;
            return playGround.GameTerminals;
        }

        CGameTerminal::ESGamePlaygroundUIConfig__EUISequence GetRaceStatus()
        {
            CGameTerminal::ESGamePlaygroundUIConfig__EUISequence UISequence_Current;
            auto terminal = GetGameTerminal();
            if (terminal is null)
                UISequence_Current;
            auto raceStatus = terminal.UISequence_Current;
            return raceStatus;
        }

        bool IsGameModeIntro()
        {
            auto raceStatus = GetRaceStatus();
            return raceStatus == CGameTerminal::ESGamePlaygroundUIConfig__EUISequence::Intro;
        }

        bool IsGameModePlaying()
        {
            auto raceStatus = GetRaceStatus();
            return raceStatus == CGameTerminal::ESGamePlaygroundUIConfig__EUISequence::Playing;
        }

        bool IsGameModeEndRound()
        {
            auto raceStatus = GetRaceStatus();
            return raceStatus == CGameTerminal::ESGamePlaygroundUIConfig__EUISequence::EndRound;
        }

        bool IsGameModeFinish()
        {
            auto raceStatus = GetRaceStatus();
            return raceStatus == CGameTerminal::ESGamePlaygroundUIConfig__EUISequence::Finish;
        }

        string GetGameModeStatus()
        {
            string gameModeStatus = "None";
            if (IsGameModeIntro())
                gameModeStatus = "Intro";
            else if (IsGameModePlaying())
                gameModeStatus = "Playing";
            else if (IsGameModeEndRound())
                gameModeStatus = "EndRound";
            else if (IsGameModeFinish())
                gameModeStatus = "Finish";
            return gameModeStatus;
        }

    }

    // Public Properties and methods for TrackmaniaNext [System API]. - Docs: https://next.openplanet.nl/System
    namespace System
    {
        CSystemConfig@ GetSystemConfig()
        {
            auto systemConfig = Trackmania::GetTmApp().Viewport.SystemConfig;
            if (systemConfig is null)
                return null;
            return systemConfig;
        }

        CSystemConfigDisplay@ GetSystemConfigDisplay()
        {
            auto systemConfig = GetSystemConfig();
            if (systemConfig is null)
                return null;
            return systemConfig.Display;
        }

        void SetSystemConfigDisplay_MaxFps(uint MaxFps)
        {
            auto display = GetSystemConfigDisplay();
            display.MaxFps = MaxFps;
        }

    }

    // Public Properties and methods for TrackmaniaNext [MetaNotPersistent API]. - Docs: https://next.openplanet.nl/MetaNotPersistent
    namespace MetaNotPersistent
    {
        ISceneVis@ GetScene()
        {
            auto gameScene = Trackmania::GetTmApp().GameScene;
            if (gameScene is null)
                return null;
            return gameScene;
        }
    }
}
#endif