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

Game.AddTeleportDest("Simpsons' House", 220, 3.5, -172, "l7z1.p3d;l7r1.p3d;l7r7.p3d;");
Game.AddTeleportDest("Kwik E Mart", 209, 3.6, -285, "l7z2.p3d;l7r1.p3d;l7r2.p3d;");
Game.AddTeleportDest("Church", 193.8, -0.9, -570, "l7r2.p3d;l7z2.p3d;l7z3.p3d;");
Game.AddTeleportDest("Springfield Elementary", -11, 0.7, -586, "l7z3.p3d;l7r2.p3d;l7r3.p3d;");
Game.AddTeleportDest("Tomacco", 190, -0.7, 425, "l7r6.p3d;l7z6.p3d;l7z7.p3d;");
Game.AddTeleportDest("Trailer Park", 391, -2.2, 494, "l7z7.p3d;l7r6.p3d;l7r7.p3d;");
Game.AddTeleportDest("Cletus' House", 333.5, -1.8, 356, "l7z7.p3d;l7r6.p3d;l7r7.p3d;");
Game.AddTeleportDest("Graveyard", 368, 5.1, 5.4, "l7z1.p3d;l7r1.p3d;l7r7.p3d;");

Game.LoadP3DFile("art\\phonecamera.p3d");
Game.LoadP3DFile("art\\cards.p3d");
Game.LoadP3DFile("art\\wrench.p3d");
Game.LoadP3DFile("art\\missions\\generic\\missgen.p3d");
Game.LoadP3DFile("art\\l07_fx.p3d","GMA_LEVEL_OTHER");
Game.LoadP3DFile("art\\chars\\homer_kickwave.p3d");
Game.LoadP3DFile("art\\chars\\homer_electrocuted.p3d");
Game.LoadP3DFile("art\\missions\\level04\\l4_doors.p3d");

Game.LoadP3DFile("art\\missions\\level07\\ufo.p3d");
Game.LoadP3DFile("art\\missions\\level07\\ufobeam.p3d");
Game.LoadP3DFile("art\\missions\\level07\\bombbarrel.p3d");

--This is the level WB data that is persistent.
Game.LoadP3DFile("art\\missions\\level07\\level.p3d");

--This is the level "jump boost zones"
Game.LoadP3DFile("art\\missions\\level01\\jumps.p3d");

--load wasps
Game.LoadP3DFile("art\\missions\\level07\\wasps.p3d");

-- New way to load Level Cars
dcar = level_rewards[7][7]
Game.LoadDisposableCar("art\\cars\\"..dcar..".p3d",dcar,"DEFAULT");

-- chase/harass vehicle
Game.LoadP3DFile( "art\\cars\\cHears.p3d" );

-- Traffic vehicle models
--
Game.LoadP3DFile( "art\\cars\\huskA.p3d" );
Game.LoadP3DFile( "art\\cars\\coffin.p3d" );
Game.LoadP3DFile( "art\\cars\\ship.p3d" );
Game.LoadP3DFile( "art\\cars\\hallo.p3d" );
Game.LoadP3DFile( "art\\cars\\witchcar.p3d" );
--LoadP3DFile( "art\cars\CompactA.p3d" );
--LoadP3DFile( "art\cars\pickupA.p3d" );
--LoadP3DFile( "art\cars\sportsA.p3d" );
--LoadP3DFile( "art\cars\witchcar.p3d" );


-- MS10: Only because we can't unload vehicles yet
--
--LoadP3DFile("art\cars\homer_v.p3d");

Game.AddVehicleSelectInfo( "ART\\CARS\\snake_v.p3d", "snake_v", "snake" );
Game.AddVehicleSelectInfo( "ART\\CARS\\wiggu_v.p3d", "wiggu_v", "wiggum" );
--AddVehicleSelectInfo( "ART\CARS\gramp_v.p3d", "gramp_v", "grampa" );
Game.AddVehicleSelectInfo( "ART\\CARS\\cletu_v.p3d", "cletu_v", "cletus" );

--Suppressing Level Characters from being Drivers
--
Game.SuppressDriver("homer");
Game.SuppressDriver("lisa");
Game.SuppressDriver("ned");
Game.SuppressDriver("grandpa");
Game.SuppressDriver("cbg");
Game.SuppressDriver("frink");
Game.SuppressDriver("burns");
Game.SuppressDriver("snake");
--SuppressDriver("smithers"); // screwing up the Limo when you finish the bonus mission and call Smithers
Game.SuppressDriver("milhouse");
Game.SuppressDriver("nelson");
Game.SuppressDriver("ralph");
--SuppressDriver("apu");
Game.SuppressDriver("skinner");
Game.SuppressDriver("gil");
Game.SuppressDriver("cletus");
Game.SuppressDriver("zombie");
Game.SuppressDriver("carl");
Game.SuppressDriver("wiggum");
Game.SuppressDriver("beeman");
Game.SuppressDriver("teen");
Game.SuppressDriver("louie");
Game.SuppressDriver("zmale1");


-- Bind gag NISes to the interiors they can be used in.
--
Game.ClearGagBindings();

--
--ADDING SIMPSONS HOUSE TOUCH GAGS FOR LEVEL 01//
--


--SH_grandpa bumps head
Game.GagBegin("gag_s5.p3d");
Game.GagSetInterior("SimpsonsHouse");
Game.GagSetCycle("cycle");
Game.GagSetPosition(500.196  ,-20 ,-400.579 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_s5");
Game.GagSetTrigger("touch", 496.942 , -19.341 , -394 ,  6.0 );
Game.GagEnd();


--SH_gag_flanders_beer_can  *PUT IN LEVEL 4 ONLY
--GagBegin("gag_s_f1.p3d");
--GagSetInterior("SimpsonsHouse");
--GagSetCycle("single");
--GagSetPosition(500.196  ,-20 ,-400.579 );
--GagSetRandom(1);
--GagSetSound("gag_s_f1");  found in T:\Simpsons2\Sound\WAVE FILES\SOUND_FOR_GAGS\Simpsons_house_sound
--GagSetTrigger("touch", 496.942 , -19.341 , -394 ,  2.0 );
--GagEnd();

--SH_gag_grandpa_talks_2_bowl
Game.GagBegin("gag_s1.p3d");
Game.GagSetInterior("SimpsonsHouse");
Game.GagSetCycle("single");
Game.GagSetPosition(500.196  ,-20 ,-400.579 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_s1");
Game.GagSetTrigger("touch", 496.942 , -19.341 , -394 ,  2.0 );
Game.GagEnd();


--sh_gag_grampa_sleeps
Game.GagBegin("gag_s2.p3d");
Game.GagSetInterior("SimpsonsHouse");
Game.GagSetCycle("single");
Game.GagSetPosition(500.196  ,-20 ,-400.579 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_s2");
Game.GagSetTrigger("touch", 496.942 , -19.341 , -394 ,  2.0 );
Game.GagEnd();


--SH_gag_grandpa_lost
Game.GagBegin("gag_s3.p3d");
Game.GagSetInterior("SimpsonsHouse");
Game.GagSetCycle("single");
Game.GagSetPosition(500.196  ,-20 ,-400.579 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_s3");
Game.GagSetTrigger("touch", 496.942 , -19.341 , -394 ,  2.0 );
Game.GagEnd();

--SH_gag_grampa_talks_2_maggie
Game.GagBegin("gag_s4.p3d");
Game.GagSetInterior("SimpsonsHouse");
Game.GagSetCycle("single");
Game.GagSetPosition(500.196  ,-20 ,-400.579 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_s4");
Game.GagSetTrigger("touch", 496.942 , -19.341 , -394 ,  2.0 );
Game.GagEnd();


--SH_gag_maggie_drinks
Game.GagBegin("gag_s_m1.p3d");
Game.GagSetInterior("SimpsonsHouse");
Game.GagSetCycle("single");
Game.GagSetPosition(500.292  ,-20 ,-400.751 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_s_m1");
Game.GagSetTrigger("touch", 496.942 , -19.341 , -394 ,  2.0 );
Game.GagEnd();

--SH_gag_maggie_swings
Game.GagBegin("gag_s_m2.p3d");
Game.GagSetInterior("SimpsonsHouse");
Game.GagSetCycle("cycle");
Game.GagSetPosition(500.292  ,-20.2 ,-400.751 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_s_m2");
Game.GagSetTrigger("touch", 496.942 , -19.341 , -394 ,  2.0 );
Game.GagEnd();

--
--ADDING KWIKI MART TOUCH GAGS FOR LEVEL 01//
--


--KM_gag_krusty_porn
Game.GagBegin("gag_k_k1.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagSetCycle("single");
Game.GagSetPosition(499  ,-20 ,-300 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_k_k1");
Game.GagSetTrigger("touch", 505  , -20 , -292 ,  7.0 );
Game.GagEnd();

--KM_gag_hans_football
Game.GagBegin("gag_k_h1.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagSetCycle("single");
Game.GagSetPosition(499.457  ,-20 ,-285.458  );
Game.GagSetRandom(1);
Game.GagSetSound("gag_k_h1");
Game.GagSetTrigger("touch", 504.052    , -20 , -295.18   , 1.1  );
Game.GagEnd();

--KM_gag_millhouse_pee
Game.GagBegin("gag_k_m1.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagSetCycle("cycle");
Game.GagSetPosition(500 ,-20 ,-299.886 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_k_m1");
Game.GagSetTrigger("touch", 505  , -20 , -292 ,  15 );
Game.GagEnd();

--KM_gag_robmoleman_pain
Game.GagBegin("gag_k_sr.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagSetCycle("single");
Game.GagSetPosition(499.156  ,-20 ,-297.801  );
Game.GagSetRandom(1);
Game.GagSetSound("gag_k_sr");
Game.GagSetTrigger("touch", 505  , -20 , -288.223 ,  12 );
Game.GagEnd();

--KM_gag_nelson_millhouse_beating1
Game.GagBegin("gag_k_n1.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagSetCycle("single");
Game.GagSetPosition(500.745 ,-20 ,-288.223 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_k_n1");
Game.GagSetTrigger("touch", 505  , -20 , -292 ,  6.8 );
Game.GagEnd();

--KM_gag_jimbo_kearney_steal
Game.GagBegin("gag_k_js.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagSetCycle("single");
Game.GagSetPosition(500 ,-20 ,-300 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_k_js");
Game.GagSetTrigger("touch", 505  , -20 , -292 ,  6.8 );
Game.GagEnd();


--
--ADDING SCHOOL TOUCH GAGS FOR LEVEL 01//
--

--SC_gag_burns_toxic
Game.GagBegin("gag_sc_1.p3d");
Game.GagSetInterior("SpringfieldElementary");
Game.GagSetCycle("single");
Game.GagSetPosition(495.79   ,-20 ,-349.513  );
Game.GagSetRandom(1);
Game.GagSetSound("gag_sc_1");
Game.GagSetTrigger("touch", 502  , -18 , -355 ,  3.3 );
Game.GagEnd();

--SC_gag_ralph eating paste
Game.GagBegin("gag_sc_2.p3d");
Game.GagSetInterior("SpringfieldElementary");
Game.GagSetCycle("single");
Game.GagSetPosition(500.185  ,-20 ,-349.966   );
Game.GagSetRandom(1);
Game.GagSetSound("gag_sc_2");
Game.GagSetTrigger("touch", 502  , -18 , -355 ,  3.3 );
Game.GagEnd();

--SC_gag_ralph_sharpener
Game.GagBegin("gag_sc_3.p3d");
Game.GagSetInterior("SpringfieldElementary");
Game.GagSetCycle("cycle");
Game.GagSetPosition(499.752  ,-20 ,-350.21 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_sc_3");
Game.GagSetTrigger("touch", 502  , -18 , -355 ,  3.3 );
Game.GagEnd();

--sc_gag_willie_rake
Game.GagBegin("gag_sc_4.p3d");
Game.GagSetInterior("SpringfieldElementary");
Game.GagSetCycle("single");
Game.GagSetPosition(495.79   ,-20 ,-350.224   );
Game.GagSetRandom(1);
Game.GagSetSound("gag_sc_4");
Game.GagSetTrigger("touch", 502  , -18 , -355 ,  3.3 );
Game.GagEnd();

--SC_gag_willie_holding_pig
Game.GagBegin("gag_sc_5.p3d");
Game.GagSetInterior("SpringfieldElementary");
Game.GagSetCycle("single");
Game.GagSetPosition(500.328  ,-20 ,-350.121 );
Game.GagSetRandom(1);
Game.GagSetSound("gag_sc_5");
Game.GagSetTrigger("touch", 502  , -18 , -349 ,  4.5 );
Game.GagEnd();

--Gag Willie Burning
Game.GagBegin("gag_burn.p3d");
Game.GagSetInterior("SpringfieldElementary");
Game.GagSetCycle("single");
Game.GagSetPosition(500, -20, -350.496);
Game.GagSetRandom(1);
Game.GagSetSound("gag_burn");
Game.GagSetTrigger("touch", 502  , -18 , -349 ,  3 );
Game.GagEnd();

--
--ADDING INTERACTIVE GAGS FOR LEVEL 07//
--

--poison gas gag
Game.GagBegin("l07_gas.p3d");
Game.GagSetCycle("reset");
Game.GagSetPosition(11, .998, 337);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_gas");
Game.GagSetTrigger("action", 12.35, .998, 337, 1.5);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--SwingSet in Homer's Yard
Game.GagBegin("l07_swng.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(221.179, 3.766, -204.937);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_swng");
Game.GagSetTrigger("action", 219.314, 3.957, -206.512, 3.5);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--SwingSet in Park
Game.GagBegin("l07_swg2.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(152.941, 6.365, -200.761);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_swng");
Game.GagSetTrigger("action", 150.821, 6.337, -202.115, 3.5);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Squishee Machine in KwikEMart
Game.GagBegin("gag_sqsh.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagSetCycle("single");
Game.GagSetPosition("Squish");
Game.GagSetRandom(0);
Game.GagSetSound("gag_sqsh");
Game.GagSetTrigger("action", "SquishTrig", .66);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Jasper in the Freezer Gag
Game.GagBegin("gag_jasp.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagSetCycle("single");
Game.GagSetPosition("Jasper");
Game.GagSetRandom(0);
Game.GagSetSound("gag_jasp");
Game.GagSetTrigger("action", "JasperTrig", 2);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--ATM bank machine Gag
Game.GagBegin("gag_atm.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagSetCycle("reset");
Game.GagSetPosition("ATM");
Game.GagSetRandom(0);
Game.GagSetSound("gag_atm");
Game.GagSetTrigger("action", "ATMTrig", 1);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--TV in Simpsons House
Game.GagBegin("gag_tv.p3d");
Game.GagSetInterior("SimpsonsHouse");
Game.GagSetCycle("single");
Game.GagSetPosition(499.785, -18.953, -399.965);
Game.GagSetRandom(0);
Game.GagSetSound("gag_tv");
Game.GagSetTrigger("action", 499.821, -19.994, -399.536, 1.35);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Aztec fire
Game.GagBegin("l07_azte.p3d");
Game.GagSetCycle("reset");
Game.GagSetPosition(241.347, 3.345, -201.126);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_azte");
Game.GagSetTrigger("action", 240.699, 3.366, -201.166, 2.82);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Dead fire extinguisher gag
Game.GagBegin("gag_fire.p3d");
Game.GagSetInterior("SpringfieldElementary");
Game.GagSetCycle("single");
Game.GagSetPosition("Fire");
Game.GagSetRandom(0);
Game.GagSetSound("gag_fire");
Game.GagSetTrigger("action", "FireTrig", 2.057);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Fire Alarm Gag
Game.GagBegin("gag_sknr.p3d");
Game.GagSetInterior("SpringfieldElementary");
Game.GagSetCycle("reset");
Game.GagSetPosition("Alarm");
Game.GagSetRandom(0);
Game.GagSetSound("gag_sknr");
Game.GagSetTrigger("action", "AlarmTrig", 1.835);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Gag Willie Burning
Game.GagBegin("gag_burn.p3d");
Game.GagSetInterior("SpringfieldElementary");
Game.GagSetCycle("single");
Game.GagSetPosition(500, -20, -350.496);
Game.GagSetRandom(1);
Game.GagSetSound("gag_willieburn");
Game.GagEnd();

--Larry The Looter FMV gag
Game.GagBegin("gag_tele.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagPlayFMV("loot.rmv");
Game.GagSetCycle("reset");
Game.GagSetPosition(505.452, -19.91, -303.307);
Game.GagSetRandom(0);
Game.GagSetSound("gag_loot");
Game.GagSetTrigger("action", 506.452, -19.91, -303.307, .864);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Silent Alarm in the Kwik E Mart
Game.GagBegin("gag_alm2.p3d");
Game.GagSetInterior("KwikEMart");
Game.GagSetCycle("reset");
Game.GagSetPosition(504.31, -19.0961, -297.76);
Game.GagSetRandom(0);
Game.GagSetSound("gag_alm2");
Game.GagSetTrigger("action", 503.872, -20, -297.024, 0.961);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Exploding Lamp in Barts Room
Game.GagBegin("gag_lamp.p3d");
Game.GagSetInterior("bartroom");
Game.GagSetCycle("single");
Game.GagSetPosition(502.446, -19.433, -448.945);
Game.GagSetRandom(0);
Game.GagSetSound("gag_lamp");
Game.GagSetTrigger("action", 502.524, -20.003, -449.042, 1.27);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Scarry Clown Bed in Barts Room
Game.GagBegin("gag_bed.p3d");
Game.GagSetInterior("bartroom");
Game.GagSetCycle("reset");
Game.GagSetPosition(501.37, -19.885, -450.326);
Game.GagSetRandom(0);
Game.GagSetSound("gag_bed");
Game.GagSetTrigger("action", 501.25, -19.995, -451.401, 1.08);
Game.GagSetPersist(1);
Game.GagSetCoins(1,1);
Game.GagEnd();

--Bats in the Park
Game.GagBegin("gag_bat2.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(130.608, 5.095, -207.392);
Game.GagSetRandom(0);
Game.GagSetSound("gag_bat2");
Game.GagSetTrigger("touch", 130.772, 5.716, -199.124, 9);
Game.GagEnd();

--Flander's bomb shelter gag
Game.GagBegin("l07_shel.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(262.601, 2.149, -208.027);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_shel");
Game.GagSetTrigger("action", 261.874, 2.515, -206.561, 1.5);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();


--Load DemoCams
Game.LoadP3DFile("art\\missions\\level01\\democams.p3d");
