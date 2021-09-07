# Rewards-Randomizer
A Simpsons: Hit &amp; Run Rewards Randomizer inspired by KH2 Rando.

## Goal
- Complete 7-7 and win the game (Standard Rules)
- Complete All Story Missions, Bonus Missions and Street Races (All Tasks Rules)

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

## Current Settings
- Seed (Default: 123): Lets you set the current seed for the rando. Match this with opponents if you are racing them
- Price Multiplier (Default: 3): Multiplies all prices of NPC and Gil Cars by whatever the number is, ranging from 0.1 (1 tenth of the price) to 10
  - Recommended setting: 2 or 3 times. This ensures that you'll want/need roughly 1500-2000 coins on average to complete a seed, which is about half the coins of a regular ASM speedrun
- Disable Reward Popups (Default: Ticked): Turns off additional window popups when you unlock an item. This saves you having to check the shops after every mission but can become quite annoying. These are tested and will work.
- Disable In-game Reward Popups (Default: Unticked): Turns off in-game popups when you unlock an item. These are less intrusive than the regular Reward Popups but are not fully tested yet and may contain errors.
- Ban OP Cars (Default: Unticked): Removes Open Wheel Racecar, Mr Burns' Limo, and the Chase Hearse from the pool of randomized items. This can help prevent the staleness of a seed by getting one of these cars and exclusively using them for the rest of a seed (and hence imitating an NG+ speedrun)
  - Recommended setting: Ticked

## Current Problems/Errors: 
- If you swap to a costume that you would not normally get in the level, you will softlock the game upon trying to start a mission. For most missions this can be fixed with a MMW but in a few exceptions you will have to quit the game, losing all progress no matter when you saved. __DO NOT DO THIS!!!__
- If you cancel a mission and warp to the next mission you will still get the reward and be able to start the next mission. This will also happen if a street race or bonus mission is cancelled.

## Plans for the future
- A setting that allows mission orders within a level to be reversed within each level (with only the first 4 missions of Homer 2 being reversible)
- A setting to randomize mission order within each level
- A tracker program that tells you what items you collected/unlocked in each level
- A hint system linked to the ingame cards, where every 7 cards collected will reveal the level in which one forced purchase item is randomized to

## Credits
- KthRam for making the mod
- Proddy for fixing/remaking so many broken/scuffed things about the mod
- Bamford for helping KthRam actually understand half of what was happening in the SHAR code
- Appel for creating the hook that allows the future tracker to read where each item was bound
- Weasel, Maz, UnknownSteel and many others in the DonutTeam community for helping come up with many feature implementations, such as mission orders and unused cars
- Timbs and Gibstack for teaching KthRam how to actually make a mod instead of blindly editing things and breaking his game 4 times before making the mod
- Baconman12, Spruce37, Timbs, Gibstack, Greeny0359 and jpecimage for helping test the initial versions of the mod to ensure it's stability
