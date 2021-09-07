--This is all level initialization stuff..
--Anything here is persistent across the entire level.
Game.EnableTutorialMode( false );
dcar = level_rewards[7][7]
Game.InitLevelPlayerVehicle(dcar,"level3_carstart","DEFAULT");
Game.AddCharacter("lisa","lisa");

--Adding Harass Vehicles for the second half of Mission 1
Game.CreateChaseManager( "cPolice","Pursuit\\L3cop.con",1);
Game.SetHitAndRunDecay(1.0);
Game.SetNumChaseCars("1");

Game.ClearAmbientAnimations( "sr1" );
Game.ClearAmbientAnimations( "sr2" );
Game.ClearAmbientAnimations( "sr3" );
Game.ClearAmbientAnimations( "bm1" );

Game.AddNPCCharacterBonusMission("milhouse", "npd", "sr1_mhouse_sd", "sr1", "checkered", "intro", 0, "checkeredfinish" ); --time trial
Game.SetBonusMissionDialoguePos("sr1","sr1_lisa","sr1_mhouse_sd","gil_car");

	Game.SetConversationCam( 0, "pc_far",				"sr1" );
	Game.SetConversationCam( 1, "npc_far",				"sr1" );

	Game.AddAmbientNpcAnimation( "none",					"sr1" );
	Game.AddAmbientNpcAnimation( "dialogue_no",				"sr1" );

	Game.AddAmbientPcAnimation( "dialogue_hands_on_hips",		"sr1" );
	Game.AddAmbientPcAnimation( "none",					"sr1" );

	Game.SetCamBestSide("sr1_bestside",					"sr1" );

Game.AddNPCCharacterBonusMission("nelson", "npd", "sr2_nelson_sd", "sr2", "checkered", "intro", 0, "checkeredfinish" ); --circuit race
Game.SetBonusMissionDialoguePos("sr2","sr2_lisa","sr2_nelson_sd","sr2_lisacar");

	Game.SetConversationCam( 0, "pc_far",				"sr2" );
	Game.SetConversationCam( 1, "npc_far",				"sr2" );

	Game.AddAmbientNpcAnimation( "none",					"sr2" );
	Game.AddAmbientNpcAnimation( "dialogue_hands_on_hips",		"sr2" );

	Game.AddAmbientPcAnimation( "dialogue_scratch_head",			"sr2" );
	Game.AddAmbientPcAnimation( "none",					"sr2" );

	Game.SetCamBestSide("sr2_bestside",					"sr2" );

Game.AddNPCCharacterBonusMission("ralph", "npd", "sr3_ralph_sd", "sr3", "checkered", "intro", 0, "checkeredfinish" ); --checkpoint
Game.SetBonusMissionDialoguePos("sr3","sr3_lisa","sr3_ralph_sd","sr3_lisacar");

	Game.SetConversationCam( 1, "pc_far",				"sr3" );
	Game.SetConversationCam( 0, "npc_far",				"sr3" );
	Game.SetConversationCam( 1, "pc_far",				"sr3" );

	Game.AddAmbientNpcAnimation( "none",					"sr3" );
	Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture",	"sr3" );
	Game.AddAmbientNpcAnimation( "none",					"sr3" );

	Game.AddAmbientPcAnimation( "dialogue_thinking",			"sr3" );
	Game.AddAmbientPcAnimation( "none",					"sr3" );
	Game.AddAmbientPcAnimation( "dialogue_yes",				"sr3" );

	Game.SetCamBestSide("sr3_bestside",					"sr3" );

Game.AddNPCCharacterBonusMission("louie", "npd", "sr4_louie_sd", "gr1", "dice", "intro", 0 );
Game.AddNPCCharacterBonusMission("skinner", "npd", "bm1_skinner_sd", "bm1", "exclamation", "tragedy", 1 );
Game.AddBonusMissionNPCWaypoint("skinner", "bm_skinner_walk_1");
Game.SetBonusMissionDialoguePos("bm1","bm_lisa","bm_skinner_walk_1","bm_lisacar");

	Game.SetConversationCam( 0, "pc_far",				"bm1" );
	Game.SetConversationCam( 1, "npc_near",				"bm1" );
	Game.SetConversationCam( 2, "pc_far",				"bm1" );
	Game.SetConversationCam( 3, "npc_near",				"bm1" );

	Game.AddAmbientNpcAnimation( "none",					"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_shaking_fist",		"bm1" );
	Game.AddAmbientNpcAnimation( "none",					"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_cross_arms",			"bm1" );

	Game.AddAmbientPcAnimation( "dialogue_hands_in_air",			"bm1" );
	Game.AddAmbientPcAnimation( "none",					"bm1" );
	Game.AddAmbientPcAnimation( "dialogue_hands_on_hips",		"bm1" );
	Game.AddAmbientPcAnimation( "none",					"bm1" );

	Game.SetCamBestSide("bm1_bestside",					"bm1" );

Game.AddAmbientCharacter("teen", "ismovie_cbg_sd", 0);

--ADDING AMBIENT CHARACTERS
	Game.AddAmbientCharacter("cbg", "m1_cbg_sd", 0); --Android Interior
	--AddAmbientCharacter("teen", "bm1_svt", 2.0); // zone 1 - Krusty Burger
	Game.AddAmbientCharacter("dolph", "ambient_dolph",  0); -- zone 2
		Game.AddAmbientNPCWaypoint( "dolph", "dolph_walk1" );
		Game.AddAmbientNPCWaypoint( "dolph", "dolph_walk2" );
		Game.AddAmbientNPCWaypoint( "dolph", "dolph_walk1" );
	Game.AddAmbientCharacter("smithers", "ambient_smithers",  0); -- rail 2
		Game.AddAmbientNPCWaypoint( "smithers", "smithers_walk1" );
		Game.AddAmbientNPCWaypoint( "smithers", "smithers_walk2" );
		Game.AddAmbientNPCWaypoint( "smithers", "smithers_walk3" );
		Game.AddAmbientNPCWaypoint( "smithers", "smithers_walk2" );
		Game.AddAmbientNPCWaypoint( "smithers", "smithers_walk1" );

	Game.AddAmbientCharacter("captain", "m6_captain_sd",  1.3); -- zone 3
		Game.AddAmbientNPCWaypoint( "captain", "m6_captain_walk1_sd" );

	Game.AddAmbientCharacter("jimbo", "ambient_jimbo",  0); -- rail 3
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk1" );
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk2" );
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk3" );
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk4" );
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk5" );
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk4" );
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk3" );
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk2" );
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk1" );

	Game.AddAmbientCharacter("barney", "ambient_barney",  0); -- zone 4
		Game.AddAmbientNPCWaypoint( "barney", "barney_walk1" );
		Game.AddAmbientNPCWaypoint( "barney", "barney_walk2" );
		Game.AddAmbientNPCWaypoint( "barney", "barney_walk1" );





--ADDING PURCHASE POINTS FOR VEHICLES AND SKINS
--
Game.AddPurchaseCarReward( "gil", "gil", "npd", "gil_loc", 1.3, "gil_car" );
Game.AddPurchaseCarNPCWaypoint("gil", "gil_walk");
Game.AddPurchaseCarReward( "simpson", "otto", "npd", "otto_loc", 1.3, "otto_car" );
Game.AddPurchaseCarNPCWaypoint("otto", "otto_walk");

--L3M1 done
Game.AddPurchaseCarReward( "simpson", "zmale1", "npd", "L3M1CS_npcspawn", 1.3, "L3M1CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale1", "L3M1CS_npcwalk");

--L3M2
Game.AddPurchaseCarReward( "simpson", "zmale3", "npd", "L3M2CS_npcspawn", 1.3, "L3M2CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale3", "L3M2CS_npcwalk");

--L3M3 done
Game.AddPurchaseCarReward( "simpson", "zmale4", "npd", "L3M3CS_npcspawn", 1.3, "L3M3CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale4", "L3M3CS_npcwalk");

--L3M4
Game.AddPurchaseCarReward( "simpson", "zfem1", "npd", "L3M4CS_npcspawn", 1.3, "L3M4CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zfem1", "L3M4CS_npcwalk");

--L3M5
Game.AddPurchaseCarReward( "simpson", "zfem5", "npd", "L3M5CS_npcspawn", 1.3, "L3M5CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zfem5", "L3M5CS_npcwalk");

--L3M6 and 7
Game.AddPurchaseCarReward( "simpson", "witch", "npd", "L3M6CS_npcspawn", 1.3, "L3M6CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("witch", "L3M6CS_npcwalk");

--ADDING TRAFFIC GROUP FOR LEVEL 03//
--
Game.CreateTrafficGroup( 0 );
Game.AddTrafficModel( "compactA",2 );
Game.AddTrafficModel( "pickupA",1 );
Game.AddTrafficModel( "sportsA",1 );
Game.AddTrafficModel( "fishtruc",1,1 );
Game.CloseTrafficGroup( );

--
--ADDING PED GROUP FOR LEVEL 03//
--
--Z1
Game.CreatePedGroup( 0 );
Game.AddPed( "girl3", 2 );
Game.AddPed( "fem1", 2 );
Game.AddPed( "boy3", 2 );
Game.AddPed( "male6", 2 );
Game.ClosePedGroup( );

--R1
Game.CreatePedGroup( 1 );
Game.AddPed( "girl2", 2 );
Game.AddPed( "boy2", 1 );
Game.AddPed( "fem3", 2 );
Game.AddPed( "male2", 2 );
Game.ClosePedGroup( );

--Z2
Game.CreatePedGroup( 2 );
Game.AddPed( "boy1", 1 );
Game.AddPed( "boy4", 2 );
Game.AddPed( "fem2", 2 );
Game.AddPed( "male5", 2 );
Game.ClosePedGroup( );

--R2
Game.CreatePedGroup( 3 );
Game.AddPed( "olady2", 1 );
Game.AddPed( "sail2", 2 );
Game.AddPed( "hooker", 2 );
Game.AddPed( "male4", 2 );
Game.ClosePedGroup( );

--Z3
Game.CreatePedGroup( 4 );
Game.AddPed( "boy2", 2 );
Game.AddPed( "fem4", 2 );
Game.AddPed( "girl1", 1 );
Game.AddPed( "male6", 2 );
Game.ClosePedGroup( );

--R3
Game.CreatePedGroup( 5 );
Game.AddPed( "sail1", 2 );
Game.AddPed( "sail3", 2 );
Game.AddPed( "sail4", 2 );
Game.AddPed( "bum", 1 );
Game.ClosePedGroup( );

--Z4
Game.CreatePedGroup( 6 );
Game.AddPed( "sail4", 2 );
Game.AddPed( "fem2", 2 );
Game.AddPed( "boy2", 1 );
Game.AddPed( "const2", 2 );
Game.ClosePedGroup( );

-- WASPS ///

Game.PreallocateActors( "beecamera", "3" );
Game.SetProjectileStats( "waspray", "80.0", "5" );

--Z1
Game.AddSpawnPointByLocatorScript("w_comicroof","beecamera","Shelley","w_comicroof","10.0","120");
--R1
--Z2
Game.AddSpawnPointByLocatorScript("w_bowl","beecamera","Shelley","w_bowl","10.0","30");
--R2
--Z3
Game.AddSpawnPointByLocatorScript("w_lighthouse","beecamera","Shelley","w_lighthouse","10.0","30");
--R3
Game.AddSpawnPointByLocatorScript("w_shipcrane","beecamera","Shelley","w_shipcrane","10.0","50");
Game.AddSpawnPointByLocatorScript("w_dockcrane","beecamera","Shelley","w_dockcrane","20.0","30");
--AddSpawnPointByLocatorScript("w_davey","beecamera","Shelley","w_davey","10.0","50");
--Z4
Game.AddSpawnPointByLocatorScript("w_duff2","beecamera","Shelley","w_duff2","20.0","50");
Game.AddSpawnPointByLocatorScript("w_kstage1","beecamera","Shelley","w_kstage1","10.0","30");
Game.AddSpawnPointByLocatorScript("w_kstage2","beecamera","Shelley","w_kstage2","10.0","30");
Game.AddSpawnPointByLocatorScript("w_night","beecamera","Shelley","w_night","10.0","30");
--R4
Game.AddSpawnPointByLocatorScript("w_culvert","beecamera","Shelley","w_culvert","10.0","40");
Game.AddSpawnPointByLocatorScript("w_offramp","beecamera","Shelley","w_offramp","10.0","30");
Game.AddSpawnPointByLocatorScript("w_dam1","beecamera","Shelley","w_dam1","10.0","50");



-- They will evade between a certain distance in the horizontal, specified by the 1st 2 numbers
-- and will keep a height above the ground somewhere the 3rd and 4th numbers
-- The final number indicates the speed at which to evade (in KPH)
Game.AddBehaviour( "beecamera", "EVADE_PLAYER", "1.0", "2.0", "1.0", "2.0", "10" );

--First param - min distance ( go closer and attraction mode disabled)
--2nd param - max distance ( bee will attempt to move closer )
--3rd param - speed in KPH
Game.AddBehaviour( "beecamera", "ATTRACTION", "5.0","10","7.0");

-- Tell the wasp to attack the player. First number indicates maximum firing range in meters
-- 2nd number indicates forward firing arc in degrees
-- Both conditions have to be satisfied before the actor will fire
-- 3rd number is the number of second between wasp evasion attempts
Game.AddBehaviour( "beecamera", "ATTACK_PLAYER", "10.0", "4.0", "3.0" );

Game.SetActorRotationSpeed( "beecamera", "100.0" );


--Bind the coin drawable, sparkle, and spark texture. The art is loaded in the missgen.p3d file.
-- Yes the name of the p3d tTexture is scratch2.bmp, thanks to p3dimage. No biggie.
Game.SetCoinDrawable( "coinShape_000" );
Game.SetParticleTexture( 0, "scratch2.bmp" ); -- sparkles.
Game.SetParticleTexture( 1, "spark4.bmp" );	 -- sparks when vehicle hits.
Game.SetParticleTexture( 2, "cloud.tga" );	 -- dust cloud when running/jumping.
Game.SetParticleTexture( 3, "cloud.tga" );	 -- leaves when hitting shrubs/trees.
Game.SetParticleTexture( 4, "star.tga" );	 -- stars when hitting something static.
Game.SetParticleTexture( 5, "cloud.tga" );	 -- paint chips when vehicle is damaged.
Game.SetParticleTexture( 6, "halo.bmp" );	 -- Ring for shock wave fx.


--STATIC wasps - these ones never move
--AddBehaviour( "static_bee", "ATTRACTION", "2.0","20","10.0");

--Zone 1

--Zone 2

--Zone 3

Game.AddSpawnPointByLocatorScript("w_hype","beecamera","Shelley","w_hype","20.0","30");

--Rail 3

Game.AddSpawnPointByLocatorScript("w_shipstairs","beecamera","Shelley","w_shipstairs","30.0","30");

--Zone 4

Game.AddSpawnPointByLocatorScript("w_duff1","beecamera","Shelley","w_duff1","25.0","50");
Game.AddSpawnPointByLocatorScript("w_duff3","beecamera","Shelley","w_duff3","25.0","50");

--Rail 4

Game.AddSpawnPointByLocatorScript("w_dam2","beecamera","Shelley","w_dam2","10.0","50");
Game.AddSpawnPointByLocatorScript("w_observatory","beecamera","Shelley","w_observatory","10.0","40");
Game.AddSpawnPointByLocatorScript("w_kamp1","beecamera","Shelley","w_kamp1","20.0","40");
Game.AddSpawnPointByLocatorScript("w_kamp2","beecamera","Shelley","w_kamp2","20.0","40");

--Zone 5

--Zone 6

--Zone 7

Game.AddBehaviour( "w_hype", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_hype", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_shipstairs", "ATTACK_PLAYER", "20.0", "4.0" , "-1.0");
Game.AddBehaviour( "w_shipstairs", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_duff1", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_duff1", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_duff3", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_duff3", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_dam2", "ATTACK_PLAYER", "10.0", "3.0" , "-1.0");
Game.AddBehaviour( "w_dam2", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_observatory", "ATTACK_PLAYER", "10.0", "3.0" , "-1.0");
Game.AddBehaviour( "w_observatory", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_kamp1", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_kamp1", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_kamp2", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_kamp2", "ATTRACTION", "2.0","20","-1");
