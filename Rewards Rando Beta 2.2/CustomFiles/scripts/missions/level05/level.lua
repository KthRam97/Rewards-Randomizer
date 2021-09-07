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
Game.AddBonusMission("gr1"); -- street race 4 - waypoint race
Game.AddBonusMission("bm1"); -- bonus mission 1

Game.AddTeleportDest("Town Square", 135.3, 8.0, 44.8, "l5z1.p3d;l5r1.p3d;l5r4.p3d;");
Game.AddTeleportDest("Moe's", -166, 7.3, 22.7, "l5z2.p3d;l5r1.p3d;l5r2.p3d;");
Game.AddTeleportDest("Railyard", -379.3, 6.6, 129, "l5r2.p3d;l5z2.p3d;l5z3.p3d;");
Game.AddTeleportDest("Try 'n Save / DMV", -265.8, 6.9, 370.2, "l5z3.p3d;l5r2.p3d;l5r3.p3d;");
Game.AddTeleportDest("Matlock Expy - East Side", -439.8, 20.6, 554.4, "l5r3.p3d;l5z4.p3d;l5z3.p3d;");
Game.AddTeleportDest("Matlock Expy - Downtown", -403.1, 20.6, 616.8, "l5r3.p3d;l5z4.p3d;l5z3.p3d;");
Game.AddTeleportDest("Monorail", -224.4, 28.8, 464.3, "l5z4.p3d;l5r3.p3d;l5r4.p3d;");
Game.AddTeleportDest("Stadium", 137.2, 10.8, 314.5, "l5r4.p3d;l5z1.p3d;l5r1.p3d;");

Game.LoadP3DFile("art\\phonecamera.p3d");
Game.LoadP3DFile("art\\cards.p3d");
Game.LoadP3DFile("art\\wrench.p3d");
Game.LoadP3DFile("art\\missions\\generic\\missgen.p3d");
Game.LoadP3DFile("art\\missions\\generic\\dmv_door.p3d");
Game.LoadP3DFile("art\\l05_fx.p3d","GMA_LEVEL_OTHER");
Game.LoadP3DFile("art\\chars\\apu_kickwave.p3d");
Game.LoadP3DFile("art\\chars\\apu_electrocuted.p3d");
Game.LoadP3DFile("art\\missions\\level02\\l2_doors.p3d");

-- chase/harass vehicle
Game.LoadP3DFile( "art\\cars\\cPolice.p3d" );


--This is the level WB data that is persistent.
Game.LoadP3DFile("art\\missions\\level05\\level.p3d");

--This is the level "jump boost zones"
Game.LoadP3DFile("art\\missions\\level02\\jumps.p3d");

--load wasps
Game.LoadP3DFile("art\\missions\\level05\\wasps.p3d");

-- This is the level vehicle, always present
--
dcar = level_rewards[7][7]
Game.LoadDisposableCar("art\\cars\\"..dcar..".p3d",dcar,"DEFAULT");

-- Traffic vehicle models
--
Game.LoadP3DFile( "art\\cars\\huskA.p3d" );
Game.LoadP3DFile( "art\\cars\\sportsB.p3d" ); -- sportsA
Game.LoadP3DFile( "art\\cars\\SUVA.p3d" ); -- SUVA
Game.LoadP3DFile( "art\\cars\\ambul.p3d" );
Game.LoadP3DFile( "art\\cars\\votetruc.p3d" ); -- pickupA

Game.AddVehicleSelectInfo( "ART\\CARS\\snake_v.p3d", "snake_v", "snake" );
Game.AddVehicleSelectInfo( "ART\\CARS\\wiggu_v.p3d", "wiggu_v", "wiggum" );
Game.AddVehicleSelectInfo( "ART\\CARS\\cletu_v.p3d", "cletu_v", "cletus" );

Game.SetStatepropShadow( "l5_streetlampbanner", "l5_streetlamp_lightpoolShape" );
Game.SetStatepropShadow( "l5_streetlamp", "l5_streetlamp_lightpoolShape" );
Game.SetStatepropShadow( "l5_oldstreetlamp", "l5_streetlamp_lightpoolShape" );
Game.SetStatepropShadow( "l5_streetlampold", "l5_streetlamp_lightpoolShape" );
Game.SetStatepropShadow( "l5_streetlampsquare", "l5_streetlamp_lightpoolShape" );
Game.SetStatepropShadow( "l5_parkinglight", "l5_streetlamp_lightpoolShape" );


--
--ADDING INTERACTIVE GAGS FOR LEVEL 01
--

--Pickle Jar gag
Game.GagBegin("gag_jar.p3d");
Game.GagSetInterior("moe1");
Game.GagSetCycle("reset");
Game.GagSetPosition("Pickle");
Game.GagSetRandom(0);
Game.GagSetSound("gag_picklejar");
Game.GagSetTrigger("action", "PickleTrig", 1.5);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Flaming Moe gag
Game.GagBegin("gag_flm.p3d");
Game.GagSetInterior("moe1");
Game.GagSetCycle("single");
Game.GagSetPosition("FlaMoe");
Game.GagSetRandom(0);
Game.GagSetSound("gag_flm");
Game.GagSetTrigger("action", "FlaMoeTrig", 1);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Duff poster gag
Game.GagBegin("gag_duff.p3d");
Game.GagSetInterior("moe1");
Game.GagSetCycle("cycle");
Game.GagSetPosition("Duff");
Game.GagSetRandom(0);
--GagSetSound("gag_???");
Game.GagSetTrigger("touch", "DuffTrig", 2);
Game.GagEnd();

--Love tester Gag
Game.GagBegin("gag_love.p3d");
Game.GagSetInterior("moe1");
Game.GagSetCycle("reset");
Game.GagSetPosition("Love");
Game.GagSetRandom(0);
Game.GagSetSound("gag_love");
Game.GagSetTrigger("action", "LoveTrig", .75);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Slot Machine Gag
Game.GagBegin("gag_slot.p3d");
Game.GagSetInterior("moe1");
Game.GagSetCycle("reset");
Game.GagSetPosition("Slots");
Game.GagSetRandom(0);
Game.GagSetSound("gag_slot");
Game.GagSetTrigger("action", "SlotsTrig", .75);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Catapult Launching gag
--GagBegin("l05_cata.p3d");
--GagSetCycle("single");
--GagSetPosition(119.535, 7.196, 52.412);
--GagSetSparkle(1);
--GagSetRandom(0);
--GagSetSound("gag_cata");
--GagSetTrigger("action", 124.495, 7.725, 52.543, 5.026);
--GagSetAnimCollision(1);
--GagEnd();

--Fat Tony's Construction gag
--GagBegin("l05_tony.p3d");
--GagSetCycle("single");
--GagSetPosition(-6.87, 7.444, -40.132);
--GagSetSparkle(1);
--GagSetRandom(0);
--GagSetSound("gag_tony");
--GagSetTrigger("action", -8.436, 5.401, -42.758, 4.5);
--GagEnd();

--Herman's bomb gag
--GagBegin("l05_bomb.p3d");
--GagSetCycle("single");
--GagSetPosition(-327.546, 7.384, 370.651);
--GagSetSparkle(1);
--GagSetRandom(0);
--GasSound("gag_bomb")
--GagSetTrigger("action", -325.029, 7.384, 372.853, 2.5);
--GagEnd();

--Rat Milker Machine gag
--GagBegin("l05_milk.p3d");
--GagSetCycle("single");
--GagSetPosition(-209.835, 23.284, 44.135);
--GagSetSparkle(1);
--GagSetRandom(0);
--GagSetSound("gag_milk");
--GagSetTrigger("action", -210.282, 23.132, 46.604, 4);
--GagEnd();

--Exploding Car outside Try 'n Save gag
--GagBegin("l05_car.p3d");
--GagSetCycle("single");
--GagSetPosition(-304.935, 7.826, 406.144);
--GagSetSparkle(1);
--GagSetCoins(5, 5);
--GagSetRandom(0);
--GagSetSound("gag_car");
--GagSetTrigger("action", -305.108, 8.016, 405.407, 1.8);
--GagSetAnimCollision(1);
--GagEnd();

--Moleman Get picture taken in DMV
Game.GagBegin("gag_mol2.p3d");
Game.GagSetInterior("dmv");
Game.GagSetCycle("single");
Game.GagSetPosition(0.218, -20.009, -199.939);
Game.GagSetRandom(0);
Game.GagSetSound("gag_mol2");
Game.GagSetTrigger("action", 4.349, -19.994, -208.487, 1.43);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();


--Effects in the DMV gag
Game.GagBegin("gag_smk.p3d");
Game.GagSetInterior("dmv");
Game.GagSetCycle("cycle");
Game.GagSetPosition(-5.688, -17.091, -201.131);
Game.GagSetRandom(0);
Game.GagSetSound("gag_smk");
Game.GagSetTrigger("touch", -6.001, -19.997, -206.173, 2);
Game.GagEnd();

--Level 5 Dumpster Gag
Game.GagBegin("l5_dump.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(-47.669, 28.76, 393.687);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_lvl2_dumpster");
Game.GagSetTrigger("action", -47.123, 28.76, 395.356, 2.4);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();


--Suppress Characters from being Drivers
--
Game.SuppressDriver("apu");
Game.SuppressDriver("louie");
Game.SuppressDriver("hibbert");
Game.SuppressDriver("homer");
Game.SuppressDriver("krusty");
Game.SuppressDriver("wiggum");
Game.SuppressDriver("snake");
Game.SuppressDriver("bart");
--SuppressDriver("frink"); //bonus mission character
Game.SuppressDriver("milhouse");
Game.SuppressDriver("gil");
Game.SuppressDriver("ralph");
Game.SuppressDriver("nelson");
Game.SuppressDriver("patty");
Game.SuppressDriver("selma");
Game.SuppressDriver("barney");
Game.SuppressDriver("moe");
Game.SuppressDriver("jasper");
Game.SuppressDriver("lenny");
Game.SuppressDriver("grandpa");
Game.SuppressDriver("otto");


--Load DemoCams
Game.LoadP3DFile("art\\missions\\level02\\democams.p3d");
