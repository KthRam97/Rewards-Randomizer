Game.AddMission("m0");
Game.AddMission("m1");
Game.AddMission("m2");
Game.AddMission("m3");
Game.AddMission("m4");
Game.AddMission("m5");
Game.AddMission("m6");
Game.AddMission("m7");
Game.AddBonusMission("sr1"); -- street race 1 - a time trial
Game.AddBonusMission("sr2"); -- street race 2 - circuit race
Game.AddBonusMission("sr3"); -- street race 2 - waypoint race
Game.AddBonusMission("gr1"); -- street race 2 - waypoint race
Game.AddBonusMission("bm1"); -- bonus mission 1

Game.AddTeleportDest("Simpsons' House", 220, 3.5, -172, "l1z1.p3d;l1r1.p3d;l1r7.p3d;");
Game.AddTeleportDest("Kwik E Mart", 209, 3.6, -285, "l1z2.p3d;l1r1.p3d;l1r2.p3d;");
Game.AddTeleportDest("Church", 193.8, -0.9, -570, "l1r2.p3d;l1z2.p3d;l1z3.p3d;");
Game.AddTeleportDest("Springfield Elementary", -11, 0.7, -586, "l1z3.p3d;l1r2.p3d;l1r3.p3d;");
Game.AddTeleportDest("Burns' Mansion", -186, 3.5, -96, "l1z4.p3d;l1r3.p3d;l1r4a.p3d;");
Game.AddTeleportDest("Stonecutters Tunnel", -405, 2, 60, "l1z4.p3d;l1r3.p3d;l1r4a.p3d;");
Game.AddTeleportDest("Power Plant Interior", -80, 0.8, 297 , "l1r4a.p3d;l1z6.p3d;l1r6.p3d;");
Game.AddTeleportDest("Power Plant Parking Lot", 40, 0, 296, "l1z6.p3d;l1r6.p3d;");
Game.AddTeleportDest("Tomacco", 190, -0.7, 425, "l1r6.p3d;l1z6.p3d;l1z7.p3d;");
Game.AddTeleportDest("Trailer Park", 391, -2.2, 494, "l1z7.p3d;l1r6.p3d;l1r7.p3d;");
Game.AddTeleportDest("Cletus' House", 333.5, -1.8, 356, "l1z7.p3d;l1r6.p3d;l1r7.p3d;");
Game.AddTeleportDest("Graveyard", 368, 5.1, 5.4, "l1z1.p3d;l1r1.p3d;l1r7.p3d;");

Game.LoadP3DFile("art\\phonecamera.p3d");
Game.LoadP3DFile("art\\cards.p3d");
Game.LoadP3DFile("art\\wrench.p3d");
Game.LoadP3DFile("art\\missions\\generic\\missgen.p3d");
Game.LoadP3DFile("art\\chars\\homer_kickwave.p3d");
Game.LoadP3DFile("art\\chars\\homer_electrocuted.p3d");
Game.LoadP3DFile("art\\missions\\level01\\l1_doors.p3d");


Game.LoadP3DFile("art\\l01_fx.p3d","GMA_LEVEL_OTHER");

--This is the level WB data that is persistent.
Game.LoadP3DFile("art\\missions\\level01\\level.p3d");

--This is the level "jump boost zones"
Game.LoadP3DFile("art\\missions\\level01\\jumps.p3d");

--load wasps
Game.LoadP3DFile("art\\missions\\level01\\wasps.p3d");

-- New way to load Level Cars
dcar = level_rewards[7][7]
Game.LoadDisposableCar("art\\cars\\"..dcar..".p3d",dcar,"DEFAULT");

-- chase/harass vehicle
Game.LoadP3DFile( "art\\cars\\cPolice.p3d" );


-- Traffic vehicle models
--
Game.LoadP3DFile( "art\\cars\\huskA.p3d" );
Game.LoadP3DFile( "art\\cars\\pickupA.p3d" );
Game.LoadP3DFile( "art\\cars\\glastruc.p3d" );
Game.LoadP3DFile( "art\\cars\\schoolbu.p3d" ); -- sedanA
Game.LoadP3DFile( "art\\cars\\minivanA.p3d" );
--LoadP3DFile( "art\cars\compactA.p3d" );
--LoadP3DFile( "art\cars\sportsA.p3d" );
--LoadP3DFile( "art\cars\SUVA.p3d" );

Game.LoadP3DFile("art\\missions\\generic\\sim_door.p3d");

-- MS10: Only because we can't unload vehicles yet
--
--LoadP3DFile("art\cars\homer_v.p3d");

Game.AddVehicleSelectInfo( "ART\\CARS\\snake_v.p3d", "snake_v", "snake" );
Game.AddVehicleSelectInfo( "ART\\CARS\\wiggu_v.p3d", "wiggu_v", "wiggum" );
--AddVehicleSelectInfo( "ART\CARS\gramp_v.p3d", "gramp_v", "grampa" );
Game.AddVehicleSelectInfo( "ART\\CARS\\cletu_v.p3d", "cletu_v", "cletus" );

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
--GagSetSound("gag_s_f1");
--GagSetTrigger("touch", 496.942 , -19.341 , -394 ,  2.0 );
--GagEnd();


--SH_gag_flanders_borrows   *PUT IN LEVEL 4 ONLY
--GagBegin("gag_s_f2.p3d");
--GagSetInterior("SimpsonsHouse");
--GagSetCycle("single");
--GagSetPosition(500.196  ,-20 ,-400.579 );
--GagSetRandom(1);
-- GagSetSound("NED5002.wav & NED0201.wav");
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

--SH_gag_homer_eat_cheese                      *PUT IN LEVEL 4 ONLY
--GagBegin("gag_s_h1.p3d");
--GagSetInterior("SimpsonsHouse");
--GagSetCycle("cycle");
--GagSetPosition(500.196  ,-20 ,-400.579 );
--GagSetRandom(1);
--GagSetSound("mmcheese.wav");   T:\Simpsons2\Sound\WAVE FILES\SOUND_FOR_GAGS\Simpsons_house_sound
--GagSetTrigger("touch", 496.942 , -19.341 , -394 ,  20.0 );
--GagEnd();



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

--KM_gag_nelson_millhouse_beating2
--GagBegin("gag_k_n2.p3d");
--GagSetInterior("KwikEMart");
--GagSetCycle("cycle");
--GagSetPosition(500 ,-20 ,-300 );
--GagSetRandom(1);
--GagSetSound("gag_k_n2");
--GagSetTrigger("touch", 505  , -20 , -292 ,  10 );
--GagEnd();

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


--
--ADDING INTERACTIVE GAGS FOR LEVEL 01//
--

--barbeque gag
Game.GagBegin("gag_bbq.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(228.567, 3.355, -199.931);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_bbq");
Game.GagSetTrigger("action", 228.567, 3.355, -201.097, .812);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--poison gas gag
Game.GagBegin("gag_gas.p3d");
Game.GagSetCycle("reset");
Game.GagSetPosition(11, .998, 337);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_gas");
Game.GagSetTrigger("action", 12.35, .998, 337, 1.5);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Flander's bomb shelter gag
Game.GagBegin("gag_shel.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(262.601, 2.149, -208.027);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_shel");
Game.GagSetTrigger("action", 261.874, 2.515, -206.561, 1.5);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--SwingSet in Homer's Yard
Game.GagBegin("gag_swng.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(221.179, 3.766, -204.937);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_swng");
Game.GagSetTrigger("action", 219.314, 3.957, -206.512, 3.5);
Game.GagSetAnimCollision(1);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--SwingSet in Park
Game.GagBegin("gag_swg2.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(152.941, 6.365, -200.761);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_swng");
Game.GagSetTrigger("action", 150.821, 6.337, -202.115, 3.5);
Game.GagSetAnimCollision(1);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Chuck: commenting this out due to level_heap_other memory
--restriction and this gag being 390KB
--Crows Flying out of Tommacco Field
--GagBegin("gag_crow.p3d");
--GagSetCycle("single");
--GagSetPosition(196.418, 0.119, 402.482);
--GagSetRandom(0);
--GagSetSound("gag_crows");
--GagSetTrigger("touch", 197.749, -2.872, 400.099, 20);
--GagEnd();

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
Game.GagSetPosition("TV");
Game.GagSetRandom(0);
Game.GagSetSound("gag_tv");
Game.GagSetTrigger("action", "TVTrig", 1.35);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--Aztec fire
Game.GagBegin("gag_azte.p3d");
Game.GagSetCycle("reset");
Game.GagSetPosition(241.347, 3.345, -201.126);
Game.GagSetSparkle(1);
Game.GagSetRandom(0);
Game.GagSetSound("gag_azte");
Game.GagSetTrigger("action", 240.699, 3.366, -201.166, 2.82);
Game.GagSetPersist(1);
Game.GagSetCoins(1, -1);
Game.GagEnd();

--PowerPlant Melt Down
Game.GagBegin("gag_melt.p3d");
Game.GagSetCycle("single");
Game.GagSetPosition(-81.089, 2.696, 323.139);
Game.GagSetSparkle(1);
Game.GagSetIntro(1);
Game.GagSetOutro(60);
Game.GagSetRandom(0);
Game.GagSetCameraShake(.1, 450, 3.5);
Game.GagSetSound("gag_melt");
Game.GagSetTrigger("action", -80.698, -0.008, 320.838, 1.7);
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

--MarygoRound
--GagBegin("gag_mgr.p3d");
--GagSetCycle("reset");
--GagSetPosition(146.717, 4.989, -183.561);
--GagSetSparkle(1);
--GagSetRandom(0);
--GagSetSound("gag_mgr");
--GagSetTrigger("action", 146.845, 5.76, -183.561, 4.429);
--GagSetAnimCollision(1);
--GagSetPersist(1);
--GagSetCoins(1, -1);
--GagEnd();

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

--Suppress Characters from being Drivers
--COMMENTING OUT MANY OF THESE, AS THEY ARE NOT DRIVERS
Game.SuppressDriver("homer");
Game.SuppressDriver("marge");
Game.SuppressDriver("apu");
Game.SuppressDriver("lisa");
--SuppressDriver("ned");
--SuppressDriver("barney");
--SuppressDriver("burns");
--SuppressDriver("lenny");
Game.SuppressDriver("smithers");
--SuppressDriver("milhouse");
--SuppressDriver("nelson");
--SuppressDriver("ralph");
--SuppressDriver("carl");
Game.SuppressDriver("skinner");
--SuppressDriver("gil");
--SuppressDriver("moe");
--SuppressDriver("krusty");
--SuppressDriver("eddie");
--SuppressDriver("willie");
--SuppressDriver("patty");
Game.SuppressDriver("grandpa");
--SuppressDriver("louie");
--SuppressDriver("moleman");
--SuppressDriver("cletus");
Game.SuppressDriver("bart"); --he is in the stree race
