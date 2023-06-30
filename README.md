# Rewards-Randomizer
A Simpsons: Hit &amp; Run Rewards Randomizer inspired by KH2 Rando.

## Goal
- Complete 7-7 and win the game (Standard Rules)
- Complete All Story Missions, Bonus Missions and Street Races (All Tasks Rules)
- Complete a Bingo Square (Bingo Rules)
- Complete 4-7 (Marge Time Rules)

## Features
- Each car and costume has been placed in a randomized location
- These randomized locations include:
  - 49 Story Missions (7 per level, within each level they must be completed __in order__)
  - 7 Bonus Missions (1 per level, accessible at anytime)
  - 21 Street Races (3 per level, accessible at anytime)
  - 7 NPC Cars (1 per level, accessible anytime from any Zombie)
  - 14 Gil Cars (2 per level, accesible anytime from Gil)
  - 1 Default Car (available upon starting and carries across all levels)
- A Proof like system from the Kingdom Hearts 2 Randomizer where in order to start 7-7 you will need all of:
  - Dirty Homer (Proof of Scuzzy)
  - Evil Homer (Proof of Hell)
  - Donut Homer (Proof of Gluttony)
- Upon gaining a __car__ from a mission or street race, you must "buy" it for 0 coins within the level you __unlocked__ it in
- Upon gaining a __costume__ from a mission or street race, you can "buy" it for 0 coins within the level it is __normally in__
- You can warp to any level at any point, but within each level the story missions can only be done in order
- All Forced Purchase Requirements remain, i.e. to start 1-3 you will need to find/unlock the Plow King

## Bonus Features
- 2 options for hint systems explain in "Hint Settings" below
- 2 options for mission re-ordering explained in "Mission Order Settings" below. This is designed to weaken levels that are usually considered strong in forward rando, while also giving later missions in each level more shine.
- A Forced Purchasables Tracker that automatically keeps track of what forced purchasables you have unlocked and in what levels. The steps for setup are:
  1) Make sure the Console and Logging hack is enabled, with "Mods" being the only Include option ticked.
  2) Launch the Reward Randomiser with your chosen settings.
  3) Open RewardsRandoTracker.exe
  4) Click "Start Tracking Log File".
  5) (Optional) Click "Choose Tracker Rewards" and tick any items you'd like to be tracked when you collect them
  6) In the window that opens, browse and find the correct log file. Depending on your "Console and Logging" settings, it will either be a file called "Log.txt" in the directory that opens, or the latest file in the "Logs" directory.
  7) Click "Show Restrictions Tracker" to show the automated tracker window.

## Seed Settings
- Hide Seed (Default: Unticked): If ticked, the on-screen seed in both the main menu and pause menu will be hidden. Useful for streamers to avoid viewers spoiling the seed for you.
- Static Seed (Default: Unticked): If ticked, the randomisation will use the custom seed in the Seed textbox. Normally used for races. Leaving it unticked will randomise the seed.
  - Seed (Max Length: 11 characters): Lets you set the base seed for randomisation. Anyone using the same seed will get the same reward order (if all settings match).

## Mission Order Settings
(Note: L7M5, L7M6 and L7M7 will always be in that order, regardless of these settings.)
- Mission Order (Default: Normal): Lets you choose one of 3 options for the mission order:
  - Normal: The mission order will be the same the base game.
  - Reverse: Levels will be in the same order, but each level's missions will be reversed.
  - Random: Levels will be in the same order, but each level's mission will be in a random order.
- Disable Mission Music Fix (Default: Unticked): If ticked, the mission music will match the base game, not the changed mission order.

## Hint Settings
- Hints (Default: None): Lets you choose one of 3 options for hint types:
  - None: The game will contain no hints, and you will have to find all the required rewards on your own.
  - Collect X Cards: Every X cards you collect, you will get a hint that will give you the level one of the required rewards can be found in. X = Card Count (49) divided by Required Reward Count (13 by default), rounded down. Defaults to 3.
  - Randomly Dispersed: Each required reward will be randomly assigned to one of the available 49 collector cards. The hint will contain the level the reward is available in. You will have to check the card text to see the hint.
- Random Card Locations (Default: Unticked): If ticked, collector cards locations will be randomised within each level.
- Remove Unlucky Cards (Default: Unticked): If ticked, collector cards without a reward attached in "Randomly Dispersed" hint mode will be removed from the game.

## Car Modifier Settings
- Ban Cars (Default: Unticked): If ticked, the cars listed in "Banned Cars" will be removed from the reward pool.
- Banned Cars (Default: fone_v,smith_v,cHears,gramR_v): A list of banned car internal names, separated by commas. Names must be the in-game names for each vehicle, which are listed here 
https://docs.google.com/document/d/12CfjZz_jJPPA1jTHEURepX-O2SyTu_7a34ZBJg5IrQ0/edit?usp=sharing


## Shop Price Settings
- Price Multiplier (Default: 2.5): Sets the price multplier to the NPC and Gil car shops (Min: 0.1, Max: 10.0).
- Random Base Price (Default: Unticked): If ticked, this randomises the base price prior to the multiplier to a value between 100 and 1000.
- Pay for Unlocks (Default: Unticked): If ticked, unlocks will no longer be free in the shops, and instead be whatever is listed in following setting. If Random Base Price is enabled, the base will randomise from 100-250. The same value will be used for all unlocks.
- Pay for Unlocks Amount (Default: 100): Sets the amount that unlocks will cost in the shops. Requires Pay for Unlocks to be ticked.

## Miscellaneous Settings
- Disable In-game Popups (Default: Unticked): If ticked, the in-game popups for reward unlocks or hints will be removed. You will still be able to see the information in console.
- Random Settings (Default: Unticked): If ticked, certain settings will be randomised on game load.
- Bingo (Default: Unticked): If ticked, a few traffic cars will be removed from the rewards pool to ensure every item appears uniquely. This guarantees any Bingo Square to be completable.

## Custom Restrictions:
Lets you set your own forced purchaseables for each mission.
- Multiple forced purchasables can be added for a single mission provided they are separated by commas and no spaces.
- Each forced purchaseable must use the ingame code for the item. These are listed here:
https://docs.google.com/document/d/12CfjZz_jJPPA1jTHEURepX-O2SyTu_7a34ZBJg5IrQ0/edit?usp=sharing


## Reward Options
Lets you the ability to disable certain places from granting rewards.

## Setting Presets
Lets you load custom presets for settings generated from the Rewards Randomiser Preset Editor

## Current Problems/Errors
- When using "Hints: Collect X Cards", a collected card won't be tracked if the player character is already saying a dialogue line. If this happens, you may have to collect more cards than expected for a hint
- Some users have reported empty loading screens between levels (with no newspapers). If this happens, it should load but may take up to 1-2 mins.

## Credits

### Authors
- KthRam (https://www.twitch.tv/kthram)
- Proddy (https://zhbot.org)

### LuaP3DEditor
- Proddy (https://github.com/Hampo/LuaP3DEditor) (P3D Class System - P3D Functions)
- EnAppelsin (https://github.com/EnAppelsin) (Original P3D Lua idea - P3D Functions)
- Lucas Cardellini (https://lucasstuff.com/) (P3D Functions Performance Improvements)


### Additional Characters
- Donut Team (https://donut.team/r/additional-characters)
- Mike (Martin Prince)
- Loren Goodwin (Legs, Sideshow Bob)
- Borb (Fat Tony, Kirk Van Houten)
- Yzma (https://donut.team/u/MorganVain) (Crazy Cat Lady (Eleanor Abernathy), Jacqueline Bouvier)


### Everyone else who made this possible
- Lucas Cardellini (Massive help in RMS processing)
- TickerSR (https://www.twitch.tv/tickersr) (Created all locations in the Random Card Locations setting)
- Bamford (https://www.twitch/tv/bamford) (Assisted KthRam in understanding how SHAR works)
- GreenyPhD (https://www.twitch.tv/greenyphd) (Discussed the initial ideas that formed this mod)
- Timbs (https://www.twitch.tv/da_timbsII) (Taught KthRam how to create a mod instead of editing the raw files and breaking his game 4 times)
- Gibstack (https://www.twitch.tv/Gibstack) (Taught KthRam how to create a mod instead of editing the raw files and breaking his game 4 times)
- Weasel, Max, UnknownSteel and more in the Donut Team community (Helped come up with many feature implementations)
- Baconman12, Spruce37, Timbs, Gibstack, GuffMcGufferson, TehSpearmeister and jpecimage (Helped test the initial versions of the mod to ensure stability)
- Axey (Being an early nitpicker)
- dtops24 (Being a legend)
- Clifforus (Whinging about Wine support)