Game.AddMission("m1");
Game.AddMission("m2");
Game.AddMission("m3");
Game.AddMission("m4");
Game.AddMission("m5");
Game.AddMission("m6");
Game.AddMission("m7");
Game.AddMission("m8");
Game.AddBonusMission("sr1"); -- street race 1 - a time trial
Game.AddBonusMission("sr2"); -- street race 2 - circuit race
Game.AddBonusMission("sr3"); -- street race 3 - waypoint race
Game.AddBonusMission("gr1"); -- street race 4 - wager race
Game.AddBonusMission("bm1"); -- bonus mission 1

Game.AddTeleportDest("Android's Dungeon", 28.7, 6.9, -1.2, "l6z1.p3d;l6r1.p3d;l6r5.p3d;");
Game.AddTeleportDest("Aztec Theatre", -130, -32.2, -120.2, "l6z2.p3d;l6r1.p3d;l6r2.p3d;");
Game.AddTeleportDest("Casino", -354.7, -52.5, -200.4, "l6r2.p3d;l6z2.p3d;l6z3.p3d;");
Game.AddTeleportDest("Planet Hype", -512.9, -68.4, -84.8, "l6z3.p3d;l6r2.p3d;l6r3.p3d;");
Game.AddTeleportDest("Docks", -371.8, -68.5, 37.9, "l6z3.p3d;l6r3.p3d;l6z4.p3d;");
Game.AddTeleportDest("Krustylu Studios", -325.4, -53, 237.6, "l6r3.p3d;l6z4.p3d;l6r4.p3d;");
Game.AddTeleportDest("Observatory", 185, 3.9, 476.5, "l6z5.p3d;l6r5.p3d;l6r4.p3d;");

Game.LoadP3DFile("art\\phonecamera.p3d");
Game.LoadP3DFile("art\\cards.p3d");
Game.LoadP3DFile("art\\wrench.p3d");
Game.LoadP3DFile("art\\missions\\generic\\missgen.p3d");
Game.LoadP3DFile("art\\missions\\generic\\obs_door.p3d");
Game.LoadP3DFile("art\\l06_fx.p3d","GMA_LEVEL_OTHER");
Game.LoadP3DFile("art\\chars\\bart_kickwave.p3d");
Game.LoadP3DFile("art\\chars\\bart_electrocuted.p3d");
Game.LoadP3DFile("art\\missions\\level03\\l3_doors.p3d");


--This is the level WB data that is persistent.
Game.LoadP3DFile("art\\missions\\level06\\level.p3d");

--This is the level "jump boost zones"
Game.LoadP3DFile("art\\missions\\level03\\jumps.p3d");

--wasps
Game.LoadP3DFile("art\\missions\\level06\\wasps.p3d");

-- This is the level vehicle, always present
--
dcar = level_rewards[7][7]
Game.LoadDisposableCar("art\\cars\\"..dcar..".p3d",dcar,"DEFAULT");

-- chase/harass vehicle
Game.LoadP3DFile( "art\\cars\\cPolice.p3d" );

-- Traffic vehicle models
--
Game.LoadP3DFile( "art\\cars\\huskA.p3d" );
Game.LoadP3DFile( "art\\cars\\compactA.p3d" ); -- compactA
Game.LoadP3DFile( "art\\cars\\pickupA.p3d" ); -- pickupA
Game.LoadP3DFile( "art\\cars\\burnsarm.p3d" ); -- was sportsA
Game.LoadP3DFile( "art\\cars\\IStruck.p3d" ); -- IStruck


--
--ADDING INTERACTIVE GAGS FOR LEVEL 06
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
Game.GagBegin("l06_flag.p3d");
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
Game.GagBegin("l06_pig.p3d");
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

--OB_gag_willie_climbs_cliff
Game.GagBegin("gag_will.p3d");
Game.GagSetInterior("Observatory");
Game.GagSetCycle("single");
Game.GagSetPosition("Willie");
Game.GagSetRandom(1);
Game.GagSetSound("gag_will");
Game.GagSetSoundLoadDistances(25, 30);
Game.GagSetTrigger("action", "WillieTrig", 2.0);
Game.GagEnd();

--OB_gag_ralph_eats_paste
--GagBegin("gag_ralf.p3d");
--GagSetInterior("Observatory");
--GagSetCycle("cycle");
--GagSetPosition(Ralph);
--GagSetRandom(1);
--GasSound("gag_ralf");
--GagSetTrigger("action", RalphTrig, 2.0);
--GagEnd();

--OB_gag_bumblebee_fish
--GagBegin("gag_beem.p3d");
--GagSetInterior("Observatory");
--GagSetCycle("cycle");
--GagSetPosition(Bumble);
--GagSetRandom(1);
--GasSound("")
--GagSetTrigger("action", BumbleTrig, 2.0);
--GagEnd();

--OB_gag_bullies_millhouse
Game.GagBegin("gag_buly.p3d");
Game.GagSetInterior("Observatory");
Game.GagSetCycle("single");
Game.GagSetPosition("Nelson");
Game.GagSetRandom(1);
Game.GagSetSound("gag_buly");
Game.GagSetTrigger("action", "NelsonTrig", 2.0);
Game.GagEnd();

--Crane That Spills HotPants
Game.GagBegin("l06_pant.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(-417.344, -58.909, 59.234);
Game.GagSetSparkle(1);
Game.GagSetCoins(5, 4.3);
Game.GagSetRandom(0);
Game.GagSetSound("gag_pant");
Game.GagSetTrigger("action", -421.022, -59.036, 60.075, 2.6);
Game.GagSetAnimCollision(1);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
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
Game.GagSetPosition(151.225, -19.789, -352.077);
Game.GagSetRandom(0);
Game.GagSetSound("gag_tele");
Game.GagSetTrigger("action", 151.225, -19.789, -352.077, .907);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Level 6 Dumpster Gag
Game.GagBegin("l6_dump.p3d");
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
Game.SuppressDriver("bart");
Game.SuppressDriver("apu");
Game.SuppressDriver("otto"); --Otto is driving in mission 1
Game.SuppressDriver("barney");
Game.SuppressDriver("homer");
Game.SuppressDriver("krusty");
Game.SuppressDriver("wiggum");
--SuppressDriver("snake"); //bonus mission character
Game.SuppressDriver("skinner");
Game.SuppressDriver("frink");
Game.SuppressDriver("milhouse");
Game.SuppressDriver("gil");
Game.SuppressDriver("ralph");
Game.SuppressDriver("nelson");
Game.SuppressDriver("louie");
Game.SuppressDriver("cbg");
Game.SuppressDriver("captain");
Game.SuppressDriver("burns");
Game.SuppressDriver("teen");
Game.SuppressDriver("carl");
Game.SuppressDriver("jimbo");
Game.SuppressDriver("lou");


--Load DemoCams
Game.LoadP3DFile("art\\missions\\level03\\democams.p3d");
