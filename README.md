# Rewards-Randomizer
A Simpsons: Hit &amp; Run Rewards Randomizer inspired by KH2 Rando.

## Goal
- Complete 7-7 and win the game (Standard Rules)
- Complete All Story Missions, Bonus Missions and Street Races (All Tasks Rules)
- Complete a Bingo Square (Bingo Rules)

## Features
- Each car and costume has been placed in a randomized location
- These randomized locations include:
  - 49 Story Missions (7 per level, within each level they must be completed __in order__)
  - 7 Bonus Missions (1 per level, accessible at anytime)
  - 21 Street Races (3 per level, accessible at anytime)
  - 7 NPC Cars (1 per level, accessible anytime from any Zombie)
  - 14 Gil Cars (2 per level, accesible anytime from Gil)
  - 1 Default Car (available upon starting and carries across all levels)
- A Proof like system from the Kingdom Hearts 2 Randomizer where in order to start 7-5, 7-6 and 7-7 you will need:
  - Dirty Homer (Proof of Scuzzy)
  - Evil Homer (Proof of Hell)
  - Donut Homer (Proof of Gluttony)
- Upon gaining a __car__ from a mission or street race, you must "buy" it for 0 coins within the level you __unlocked__ it in
- Upon gaining a __costume__ from a mission or street race, you can "buy" it for 0 coins within the level it is __normally in__
- You can warp to any level at any point, but within each level the story missions can only be done in order
- All Forced Purchase Requirements remain, i.e. to start 1-3 you will need to find/unlock the Plow King

## Bonus Features
- A Hint System tied to the Collector Cards where every 3 cards collected gives a single hint saying which level contains 1 of the 13 forced purchasables
  - This hint will load in the console and as an ingame popup when you next start a mission (following a mission warp)
  - Note: This is still in testing and there have been reported issues with not all cards being tracked and the ingame popups being inaccurate. It is recommended that you use the Console to read hints as these are generally more accurate.
- A Reverse Mission Order Setting that reverses Mission Order within each level. This is designed to weaken levels that are usually considered strong in forward rando, while also giving later missions in each level more shine.
  - Levels 1-6 have mission orders completely reversed, e.g. the first mission of Homer 1 becomes The Fat and the Furious (normally the 7th Mission)
  - Level 7 only has the first 4 missions reversed. I.e. it begins with Mission 4, then 3, 2 and 1, before finishing with Missions 5, 6 and 7. This was done to preserve the same win condition as Forward Rando (requiring all 3 Proofs)
- A Forced Purchasables Tracker that automatically keeps track of what forced purchasables you have unlocked and in what levels. This is currently in testing and may be a bit buggy. The steps for setup are:
  1) Open RewardsRandoTracker.exe
  2) Start SHAR with the RewardsRando and Console enabled (Console should only have Mods checked in the Include section of its Mod Settings)
  3) Check that the box on the right hand side of the tracker has ouput, including ---END SEED SPOILER
  4) If it _doesn't_ have the output, close SHAR and repeat from step 2

## Current Settings
- Fixed Seeded (Default: Unticked): If ticked, it lets you type in a custom seed into the Seed Setting. Use this if you want to try a funny meme seed or race someone else. Leaving it unticked, randomizes your seed.
  - Seed (Default: 123): Lets you set the current seed for the rando. Match this with opponents if you are racing them
- Reverse Mission Order (Default: Unticked): If ticked, the missions within each level will be reversed. This is intended to give later missions in each level that would not normally be encountered an opportunity to shine. E.g. Fat and the Furious will become Mission 1 of Homer 1. 
  - Note: Due to the proof system in Homer 2, the order of missions in Homer 2 is only reversed for the first four missions. The 3 Alien Autotopsy Missions will still finish Homer 2 when this setting is on.
  - Hacky Music Fix (Default: Unticked): When Reverse Mission Order is on there have been issues with some music tracks not being reversed. Turning on this setting attempts to fix this but may not always work and is not fully tested. 
- Price Multiplier (Default: 3): Multiplies all prices of NPC and Gil Cars by whatever the number is, ranging from 0.1 (1 tenth of the price) to 10
  - Recommended setting: 2 or 3 times. This ensures that you'll want/need roughly 1500-2000 coins on average to complete a seed, which is about half the coins of a regular ASM speedrun
- Disable In-game Popups (Default: Unticked): Turns off in-game popups when you unlock an item or get a hint.
- Ban Cars (Default: Unticked): Removes certain cars from the pool of randomized rewards. Ticking it allows you to enter cars into the Banned Cars Setting
  - Banned Cars (Default: fone_v, smith_v, cHears): Specifies the cars to be removed from the pool when Ban Cars is ticked. Type the filenames of the cars you wish to remove separated by a comma. Filenames for all cars of interest are listed here: https://docs.google.com/document/d/12CfjZz_jJPPA1jTHEURepX-O2SyTu_7a34ZBJg5IrQ0/edit?usp=sharing

## Current Problems/Errors: 
- If you swap to a costume that you would not normally get in the level, you will softlock the game upon trying to start a mission. For most missions this can be fixed with a MMW but in a few exceptions you will have to quit the game, losing all progress no matter when you saved. __DO NOT DO THIS!!!__

## Plans for the future
- Adding a Card Counter to the Tracker. This will only count the ones that are actually registered to keep better track of your Hint despite the bugs with card counting
- A setting to randomize mission order within each level

## Credits
- KthRam for making the mod
- Proddy for fixing/remaking so many broken/scuffed things about the mod, designing and implementing Reverse Rando, the Hint System and the current Tracker
- Bamford for helping KthRam actually understand half of what was happening in the SHAR code
- Appel for creating the hook that allows the current tracker to read where each item was bound
- Weasel, Maz, UnknownSteel and many others in the DonutTeam community for helping come up with many feature implementations, such as mission orders and unused cars
- Timbs and Gibstack for teaching KthRam how to actually make a mod instead of blindly editing things and breaking his game 4 times before making the mod
- Baconman12, Spruce37, Timbs, Gibstack, GuffMcGufferson, TehSpearmeister, Greeny0359 and jpecimage for helping test the initial versions of the mod to ensure it's stability
- TheTicker and dtops24 for being legends :) 
