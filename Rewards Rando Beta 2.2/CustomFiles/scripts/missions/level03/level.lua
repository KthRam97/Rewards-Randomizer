Game.AddMission("m1");
Game.AddMission("m2");
Game.AddMission("m3");
Game.AddMission("m4");
Game.AddMission("m5");
Game.AddMission("m6");
Game.AddMission("m7");
Game.AddBonusMission("sr1"); -- street race 1 - a time trial
Game.AddBonusMission("sr2"); -- street race 2 - circuit race
Game.AddBonusMission("sr3"); -- street race 3 - waypoint race
Game.AddBonusMission("gr1"); -- street race 4 - wager race
Game.AddBonusMission("bm1"); -- bonus mission 1
Game.AddBonusMission("ismovie"); -- itchy and scratchy movie

Game.AddTeleportDest("Android's Dungeon", 28.7, 6.9, -1.2, "l3z1.p3d;l3r1.p3d;l3r5.p3d;");
Game.AddTeleportDest("Aztec Theatre", -130, -32.2, -120.2, "l3z2.p3d;l3r1.p3d;l3r2.p3d;");
Game.AddTeleportDest("Casino", -354.7, -52.5, -200.4, "l3r2.p3d;l3z2.p3d;l3z3.p3d;");
Game.AddTeleportDest("Planet Hype", -512.9, -68.4, -84.8, "l3z3.p3d;l3r2.p3d;l3r3.p3d;");
Game.AddTeleportDest("Docks", -371.8, -68.5, 37.9, "l3z3.p3d;l3r3.p3d;l3z4.p3d;");
Game.AddTeleportDest("Krustylu Studios", -325.4, -53, 237.6, "l3r3.p3d;l3z4.p3d;l3r4.p3d;");
Game.AddTeleportDest("Observatory", 185, 3.9, 476.5, "l3z5.p3d;l3r5.p3d;l3r4.p3d;");

Game.LoadP3DFile("art\\phonecamera.p3d");
Game.LoadP3DFile("art\\cards.p3d");
Game.LoadP3DFile("art\\wrench.p3d");
Game.LoadP3DFile("art\\missions\\generic\\missgen.p3d");
Game.LoadP3DFile("art\\missions\\generic\\ad_door.p3d");
Game.LoadP3DFile("art\\l03_fx.p3d","GMA_LEVEL_OTHER");
Game.LoadP3DFile("art\\chars\\lisa_kickwave.p3d");
Game.LoadP3DFile("art\\chars\\lisa_electrocuted.p3d");
Game.LoadP3DFile("art\\missions\\level03\\l3_doors.p3d");

--Wasps
Game.LoadP3DFile("art\\missions\\level03\\wasps.p3d");

--This is the level WB data that is persistent.
Game.LoadP3DFile("art\\missions\\level03\\level.p3d");

--This is the level "jump boost zones"
Game.LoadP3DFile("art\\missions\\level03\\jumps.p3d");

-- This is the level vehicle, always present
dcar = level_rewards[7][7]
Game.LoadDisposableCar("art\\cars\\"..dcar..".p3d",dcar,"DEFAULT");

--Adding Harass Vehicles to the second half of Mission 1
Game.LoadP3DFile( "art\\cars\\cPolice.p3d" );


-- Traffic vehicle models
--
Game.LoadP3DFile( "art\\cars\\huskA.p3d" );
Game.LoadP3DFile( "art\\cars\\compactA.p3d" ); -- compactA
Game.LoadP3DFile( "art\\cars\\pickupA.p3d" );  -- pickupA
Game.LoadP3DFile( "art\\cars\\sportsA.p3d" );  -- sportsA
Game.LoadP3DFile( "art\\cars\\fishtruc.p3d" ); -- SUVA


Game.AddVehicleSelectInfo( "ART\\CARS\\snake_v.p3d", "snake_v", "snake" );
Game.AddVehicleSelectInfo( "ART\\CARS\\wiggu_v.p3d", "wiggu_v", "wiggum" );
--AddVehicleSelectInfo( "ART\CARS\gramp_v.p3d", "gramp_v", "grampa" );
Game.AddVehicleSelectInfo( "ART\\CARS\\cletu_v.p3d", "cletu_v", "cletus" );

Game.AddGagBinding( "Android", "gag0600.p3d", "cycle", 1, "AD_gag_otto_playing_slot_cars" );
-- GagSetSound("OTT0801b.wav");AD_gag_otto_playing_slot_cars.mb
-- T:\Simpsons2\Sound\WAVE FILES\SOUND_FOR_GAGS\Androids_Dungeion_sound

Game.GagBegin("gag0601.p3d");
Game.GagSetInterior("Android");
Game.GagSetCycle("single");
Game.GagSetSound("DMV_gag_willie_chaes_afterpig");
Game.GagSetTrigger("touch", -1, -20, -352, 3.5);
Game.GagEnd();

--
--OBSERVATORY TOUCH GAGS
--

--gag_will
Game.GagBegin("gag_will.p3d");
Game.GagSetInterior("Observatory");
Game.GagSetCycle("single");
Game.GagSetPosition(158.831  ,-19.97  ,-328.777 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_will");
Game.GagSetSoundLoadDistances(25, 30);
Game.GagSetTrigger("touch", 153.049  , -20 , -339.926  ,  2.5 );
Game.GagEnd();

--gag_ralf
Game.GagBegin("gag_ralf.p3d");
Game.GagSetInterior("Observatory");
Game.GagSetCycle("single");
Game.GagSetPosition(153.733  ,-19.335   ,-338.94   );
Game.GagSetRandom(1);
Game.GagSetSound("gag_sc_2");
Game.GagSetTrigger("touch", 153.049  , -20 , -339.926  ,  3.5 );
Game.GagEnd();

--gag_beem
Game.GagBegin("gag_beem.p3d");
Game.GagSetInterior("Observatory");
Game.GagSetCycle("single");
Game.GagSetPosition(154.264  ,-20 ,-338.86   );
Game.GagSetRandom(1);
Game.GagSetSound("gag_beem");
Game.GagSetTrigger("touch", 153.049  , -20 , -339.926  ,  1.4 );
Game.GagEnd();

--gag_buly
Game.GagBegin("gag_buly.p3d");
Game.GagSetInterior("Observatory");
Game.GagSetCycle("single");
Game.GagSetPosition(160.514 ,-18.594 ,-331.329 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_buly");
Game.GagSetTrigger("touch", 153.049  , -20 , -339.926  ,  2.5 );
Game.GagEnd();



--
--ADDING INTERACTIVE GAGS FOR LEVEL 01
--

--Radioactiveman gag
Game.GagBegin("gag_racm.p3d");
Game.GagSetInterior("Android");
Game.GagSetCycle("reset");
Game.GagSetPosition("Radio");
Game.GagSetRandom(0);
Game.GagSetSound("gag_racm");
Game.GagSetTrigger("action", "RadioTrig", 1.5);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Clank Clank robot gag
Game.GagBegin("gag_clnk.p3d");
Game.GagSetInterior("Android");
Game.GagSetCycle("single");
Game.GagSetPosition("Robot");
Game.GagSetRandom(0);
Game.GagSetSound("gag_clnk");
Game.GagSetTrigger("action", "RobotTrig", 1.2);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

-- I&S movie ticket.
Game.GagBegin("gag_ismv.p3d");
Game.GagSetInterior("Android");
Game.GagSetPosition(0.8, -19.1, -346.55);
Game.GagSetRandom(0);
Game.GagSetCycle("reset");
Game.GagCheckCollCards("cbg", "lisa", "rewardsuccess", "rewardintro", "rewardfail"); -- char1, char2, accept, instruct, reject.
Game.GagSetTrigger("action", 0.8, -19, -347, 1.5);
Game.GagSetSparkle(1);
Game.GagEnd();

-- I&S movie.
Game.GagBegin("gag_ismv.p3d");
Game.GagSetPosition(-140, -33, -121);
Game.GagSetRandom(0);
Game.GagSetCycle("reset");
Game.GagCheckMovie("teen", "lisa", "fmv8.rmv", "aztec"); -- char1, char2, fmv, reject.
Game.GagSetTrigger("action", -140, -31, -121, 2.0);
Game.GagEnd();

--Blowup Doll gag
--GagBegin("gag_blow.p3d");
--GagSetInterior("Android");
--GagSetCycle("single");
--GagSetPosition(Doll);
--GagSetRandom(0);
--GagSetSound("gag_blow");
--GagSetTrigger("action", DollTrig, 1);
--GagEnd();

--kamp krusty flag
Game.GagBegin("gag_flag.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(61.628, -20.112, 315.541);
Game.GagSetSparkle(1);
Game.GagSetIntro(80);
Game.GagSetOutro(80);
Game.GagSetRandom(0);
Game.GagSetSound("gag_flag");
Game.GagSetTrigger("action", 62.417, -20.147, 315.512, 2.1);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--kamp krusty pig on a stick
Game.GagBegin("gag_pig.p3d");
Game.GagSetCycle("cycle");
Game.GagSetPosition(70.375, -20.133, 335.162);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_pig");
Game.GagSetTrigger("action", 70.428, -19.504, 335.216, 3.625);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--silent alarm in observ
Game.GagBegin("gag_alrm.p3d");
Game.GagSetInterior("Observatory");
Game.GagSetCycle("single");
Game.GagSetPosition("SAlarm");
Game.GagSetRandom(0);
Game.GagSetSound("gag_alrm");
Game.GagSetTrigger("action", 149.979, -20, -358.705, 2);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Matter transporter
Game.GagBegin("gag_matt.p3d");
Game.GagSetInterior("Observatory");
Game.GagSetCycle("reset");
Game.GagSetPosition("Tele");
Game.GagSetRandom(0);
Game.GagSetSound("gag_matt");
Game.GagSetTrigger("action", "TeleTrig", 2.503);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--perpetual motion machine
Game.GagBegin("gag_perp.p3d");
Game.GagSetInterior("Observatory");
Game.GagSetCycle("cycle");
Game.GagSetPosition("Perp");
Game.GagSetRandom(0);
Game.GagSetSound("gag_perp");
Game.GagSetTrigger("action", "PerpTrig", 1.308);
Game.GagSetPersist(1);
Game.GagSetCoins(1, 1);
Game.GagEnd();

--moleman in cadillac
--GagBegin("gag_mole.p3d");
--GagSetCycle("single");
--GagSetPosition(-495.76, -62.487, -75.88);
--GagSetRandom(0);
--GasSound("gag_")
--GagSetTrigger("touch", 2.163, -6.047, 16.343, 26.57);
--GagEnd();


--Crane That Spills HotPants
Game.GagBegin("gag_pant.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(-417.344, -58.909, 59.234);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_pant");
Game.GagSetTrigger("action", -421.022, -59.036, 60.075, 2.6);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagSetAnimCollision(1);
Game.GagEnd();

--Kids in the Wally Weazles Ball Room
Game.GagBegin("gag_kids.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(45.808, .521, -22.388);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_kids");
Game.GagSetTrigger("action", 46.243, -1.302, -25.587, 2.58);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Observatory Video in telescope
Game.GagBegin("gag_tele.p3d");
Game.GagSetInterior("Observatory");
Game.GagPlayFMV("tele.rmv");
Game.GagSetCycle("reset");
Game.GagSetPosition(151.225, -25.789, -352.077);
Game.GagSetRandom(0);
Game.GagSetSound("gag_tele");
Game.GagSetTrigger("action", 151.225, -19.789, -352.077, .907);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Level 3 Dumpster Gag
Game.GagBegin("l3_dump.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(62.401, 7.037, 39.72);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_lvl6_dumpster");
Game.GagSetTrigger("action", 63.11, 7.026, 38.072, 2.4);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();


--Suppress Characters from being Drivers
--
Game.SuppressDriver("lisa");
Game.SuppressDriver("bart");
Game.SuppressDriver("apu");
Game.SuppressDriver("cletus");
--SuppressDriver("skinner");
Game.SuppressDriver("frink");
Game.SuppressDriver("grandpa");
Game.SuppressDriver("wiggum");
Game.SuppressDriver("captain");
Game.SuppressDriver("otto");
Game.SuppressDriver("apu");
Game.SuppressDriver("milhouse");
Game.SuppressDriver("gil");
Game.SuppressDriver("ralph");
Game.SuppressDriver("nelson");
Game.SuppressDriver("cbg");
Game.SuppressDriver("louie");
--SuppressDriver("teen");
Game.SuppressDriver("barney");
Game.SuppressDriver("captain");
Game.SuppressDriver("smithers");
Game.SuppressDriver("dolph");
Game.SuppressDriver("marge");
