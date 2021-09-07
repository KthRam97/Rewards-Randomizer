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
Game.AddBonusMission("sr3"); -- street race 2 - waypoint race
Game.AddBonusMission("gr1"); -- street race 4 - wager race
Game.AddBonusMission("bm1"); -- bonus mission 1

Game.AddTeleportDest("Town Square", 135.3, 8.0, 44.8, "l2z1.p3d;l2r1.p3d;l2r4.p3d;");
Game.AddTeleportDest("Moe's", -166, 7.3, 22.7, "l2z2.p3d;l2r1.p3d;l2r2.p3d;");
Game.AddTeleportDest("Railyard", -379.3, 6.6, 129, "l2r2.p3d;l2z2.p3d;l2z3.p3d;");
Game.AddTeleportDest("Try 'n Save / DMV", -265.8, 6.9, 370.2, "l2z3.p3d;l2r2.p3d;l2r3.p3d;");
Game.AddTeleportDest("Matlock Expy - East Side", -439.8, 20.6, 554.4, "l2r3.p3d;l2z4.p3d;l2z3.p3d;");
Game.AddTeleportDest("Matlock Expy - Downtown", -403.1, 20.6, 616.8, "l2r3.p3d;l2z4.p3d;l2z3.p3d;");
Game.AddTeleportDest("Monorail", -224.4, 28.8, 464.3, "l2z4.p3d;l2r3.p3d;l2r4.p3d;");
Game.AddTeleportDest("Stadium", 137.2, 10.8, 314.5, "l2r4.p3d;l2z1.p3d;l2r1.p3d;");

Game.LoadP3DFile("art\\phonecamera.p3d");
Game.LoadP3DFile("art\\cards.p3d");
Game.LoadP3DFile("art\\wrench.p3d");
Game.LoadP3DFile("art\\missions\\generic\\missgen.p3d");
Game.LoadP3DFile("art\\l02_fx.p3d","GMA_LEVEL_OTHER");
Game.LoadP3DFile("art\\chars\\bart_kickwave.p3d");
Game.LoadP3DFile("art\\chars\\bart_electrocuted.p3d");
Game.LoadP3DFile("art\\missions\\level02\\l2_doors.p3d");

--load wasps
Game.LoadP3DFile("art\\missions\\level02\\wasps.p3d");

--This is the level WB data that is persistent.
Game.LoadP3DFile("art\\missions\\level02\\level.p3d");

--This is the level "jump boost zones"
Game.LoadP3DFile("art\\missions\\level02\\jumps.p3d");

--This is the level vehicle, always present
--
--LoadDisposableCar( "art\cars\bart_v.p3d","bart_v","DEFAULT" );
dcar = level_rewards[7][7]
Game.LoadDisposableCar("art\\cars\\"..dcar..".p3d",dcar,"DEFAULT");

--LoadP3DFile( "art\cars\famil_v.p3d" );

-- chase/harass vehicle
Game.LoadP3DFile( "art\\cars\\cPolice.p3d" );

-- Traffic vehicle models
--
Game.LoadP3DFile( "art\\cars\\huskA.p3d" );
Game.LoadP3DFile( "art\\cars\\taxiA.p3d" );
Game.LoadP3DFile( "art\\cars\\sedanB.p3d" );
--LoadP3DFile( "art\cars\compactA.p3d" );
--LoadP3DFile( "art\cars\pickupA.p3d" );
Game.LoadP3DFile( "art\\cars\\sportsA.p3d" );
Game.LoadP3DFile( "art\\cars\\pizza.p3d" ); --was pizza

Game.AddVehicleSelectInfo( "ART\\CARS\\snake_v.p3d", "snake_v", "snake" );
Game.AddVehicleSelectInfo( "ART\\CARS\\wiggu_v.p3d", "wiggu_v", "wiggum" );
Game.AddVehicleSelectInfo( "ART\\CARS\\cletu_v.p3d", "cletu_v", "cletus" );

Game.AddGagBinding( "moe1", "gag0400.p3d", "cycle", 1, "" );
Game.AddGagBinding( "moe1", "gag0401.p3d", "cycle", 1, "" );
Game.AddGagBinding( "moe1", "gag0402.p3d", "cycle", 1, "" );
Game.AddGagBinding( "moe1", "gag0403.p3d", "cycle", 1, "" );

Game.AddGagBinding( "dmv", "gag0300.p3d", "cycle", 1, "DMV_gag_people_inline.p3d" );
Game.AddGagBinding( "dmv", "gag0301.p3d", "cycle", 1, "DMV_gag_willie_friends.p3d" );



--
--ADDING INTERACTIVE GAGS FOR LEVEL 01
--

--Pickle Jar gag
Game.GagBegin("gag_jar.p3d");
Game.GagSetInterior("moe1");
Game.GagSetCycle("reset");
Game.GagSetPosition("Pickle");
Game.GagSetRandom(0);
Game.GagSetSound("gag_jar");
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
Game.GagBegin("gag_cata.p3d");
Game.GagSetCycle("reset");
Game.GagSetPosition(119.535, 7.196, 52.412);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_cata");
Game.GagSetTrigger("action", 122.543, 7.725, 50.876, 1.6);
Game.GagSetAnimCollision(1);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Fat Tony's Construction gag
Game.GagBegin("gag_tony.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(-6.87, 7.444, -40.132);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_tony");
Game.GagSetTrigger("action", -8.436, 5.401, -42.758, 4.5);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Herman's bomb gag
Game.GagBegin("gag_bomb.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(-327.546, 7.384, 370.651);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_bomb");
Game.GagSetTrigger("action", -325.029, 7.384, 372.853, 2.5);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Rat Milker Machine gag
Game.GagBegin("gag_milk.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(-209.835, 23.284, 44.135);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_milk");
Game.GagSetTrigger("action", -210.282, 23.132, 46.604, 4);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Exploding Car outside Try 'n Save gag
Game.GagBegin("gag_car.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(-304.935, 8.133, 406.144);
Game.GagSetSparkle(1);
Game.GagSetCoins(5, -1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_car");
Game.GagSetTrigger("action", -305.108, 8.016, 405.407, 1.8);
Game.GagSetAnimCollision(1);
Game.GagSetPersist(1);
Game.GagEnd();

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

--Level 2 Dumpster Gag
Game.GagBegin("l2_dump.p3d");
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
Game.SuppressDriver("bart");
Game.SuppressDriver("wiggum");
Game.SuppressDriver("snake");
Game.SuppressDriver("milhouse");
Game.SuppressDriver("skinner");  --needs to appear in mission 1
Game.SuppressDriver("jimbo");
Game.SuppressDriver("kearney");
Game.SuppressDriver("moe");
Game.SuppressDriver("beeman");
Game.SuppressDriver("otto");
Game.SuppressDriver("ralph");
Game.SuppressDriver("cbg");
Game.SuppressDriver("frink");
Game.SuppressDriver("nelson");
Game.SuppressDriver("cletus");
Game.SuppressDriver("apu");
Game.SuppressDriver("nriviera");
Game.SuppressDriver("gil");
Game.SuppressDriver("homer");
--SuppressDriver("grandpa");  //bonus mission character
Game.SuppressDriver("teen");
Game.SuppressDriver("louie");
Game.SuppressDriver("patty");
Game.SuppressDriver("lenny");
Game.SuppressDriver("lou");
Game.SuppressDriver("moleman");
Game.SuppressDriver("jasper");
Game.SuppressDriver("barneyr");
Game.SuppressDriver("lisa");
