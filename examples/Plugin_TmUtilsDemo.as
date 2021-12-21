#include "TmUtils.as" //Include Trackmania Utils.

void Main()
{
    // Get the Main app.
    auto app = TmUtils::Trackmania::GetTmApp();

    // Get Server info.
    auto serverInfo = TmUtils::Trackmania::GetServerInfo();

    // Get Client info.
    auto clientInfo = TmUtils::Net::GetConnectionInfo();

    // Get Current Playground.
    auto currentPlayground = TmUtils::ShootMania::GetCurrentPlayground();

    // Get Viewport.
    auto viewport = TmUtils::Hms::GetViewport();

    while (true)
    {
        yield();
        // Check If Game scene loaded.
        auto gameScene = TmUtils::MetaNotPersistent::GetScene();
        bool isGameSceneLoaded = gameScene !is null;
        bool isInGame = TmUtils::ShootMania::IsPlayerInGame();
        print("isGameSceneLoaded=" + isGameSceneLoaded);
        print("IsPlayerInGame=" + isInGame);

        if (isInGame)
        {
            sleep(1000);
            // Chec if Map is playable.
            bool isMapPlayable = TmUtils::Game::IsMapPlayable();

            print("isMapPlayable=" + isMapPlayable);
            //Get Active player.
            auto player = TmUtils::ShootMania::GetActivePlayer();
            
            // Check Race status.
            string gameMode = TmUtils::Game::GetGameModeStatus();
            print("GameMode=" + gameMode);
        }
    }
}