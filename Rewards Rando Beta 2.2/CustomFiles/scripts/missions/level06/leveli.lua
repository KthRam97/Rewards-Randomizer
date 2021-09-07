--This is all level initialization stuff..
--Anything here is persistent across the entire level.
Game.EnableTutorialMode( false );
dcar = level_rewards[7][7];
Game.InitLevelPlayerVehicle(dcar,"level6_carstart","DEFAULT");
Game.AddCharacter("bart","bart");
--SetPostLevelFMV("fmv6.rmv");

Game.CreateChaseManager("cPolice","Pursuit\\L6cop.con",1);
Game.SetHitAndRunDecay(1.0);
Game.SetNumChaseCars("2");

Game.ClearAmbientAnimations( "sr1" );
Game.ClearAmbientAnimations( "sr2" );
Game.ClearAmbientAnimations( "sr3" );
Game.ClearAmbientAnimations( "bm1" );

Game.AddNPCCharacterBonusMission("milhouse", "npd", "sr1_mhouse_sd", "sr1", "checkered", "intro", 0, "checkeredfinish" ); --time trial
Game.SetBonusMissionDialoguePos("sr1","sr1_bart","sr1_mhouse_sd","sr1_bartcar");
	Game.SetConversationCam( 0, "pc_far",                        	"sr1" );
	Game.SetConversationCam( 1, "npc_far",                        	"sr1" );

	Game.AddAmbientNpcAnimation( "none", 				"sr1" );
	Game.AddAmbientNpcAnimation( "dialogue_cross_arms", 			"sr1" );

	Game.AddAmbientPcAnimation( "dialogue_hands_in_air",			"sr1" );
	Game.AddAmbientPcAnimation( "none",					"sr1" );

	Game.SetCamBestSide("sr1_bestside",					"sr1" );

Game.AddNPCCharacterBonusMission("nelson", "npd", "sr2_nelson_sd", "sr2", "checkered", "intro", 0, "checkeredfinish" ); --circuit race
Game.SetBonusMissionDialoguePos("sr2","sr2_bart","sr2_nelson_sd","sr2_bartcar");
	Game.SetConversationCam( 0, "pc_far",                        	"sr2" );
	Game.SetConversationCam( 1, "npc_far",                        	"sr2" );

	Game.AddAmbientNpcAnimation( "dialogue_cross_arms", 			"sr2" );
	Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air", 		"sr2" );

	Game.AddAmbientPcAnimation( "dialogue_scratch_head",			"sr2" );
	Game.AddAmbientPcAnimation( "dialogue_scratch_head",			"sr2" );

	Game.SetCamBestSide("sr2_bestside",					"sr2" );


Game.AddNPCCharacterBonusMission("ralph", "npd", "sr3_ralph_sd", "sr3", "checkered", "intro", 0, "checkeredfinish" ); --checkpoint
Game.SetBonusMissionDialoguePos("sr3","sr3_bart","sr3_ralph_sd","m4_carstart");
	Game.SetConversationCam( 0, "pc_far",                        	"sr3" );
	Game.SetConversationCam( 1, "npc_far",                        	"sr3" );

	Game.AddAmbientNpcAnimation( "none", 				"sr3" );
	Game.AddAmbientNpcAnimation( "dialogue_scratch_head", 		"sr3" );

	Game.AddAmbientPcAnimation( "dialogue_hands_on_hips",		"sr3" );
	Game.AddAmbientPcAnimation( "none",					"sr3" );

	Game.SetCamBestSide("sr3_bestside",					"sr3" );
Game.AddNPCCharacterBonusMission("louie", "npd", "sr4_louie_sd", "gr1", "dice", "intro", 0 );
Game.AddNPCCharacterBonusMission("snake", "npd", "bm1_snake_sd", "bm1", "exclamation", "wheelman", 1, "exclamation_shadow" );
Game.SetBonusMissionDialoguePos("bm1","bm_bart","bm_snake_walk_1","bm1_carstart");
	Game.SetConversationCam( 0, "pc_near",                        	"bm1" );
	Game.SetConversationCam( 1, "npc_far",                        	"bm1" );
	Game.SetConversationCam( 2, "pc_far",                        	"bm1" );
	Game.SetConversationCam( 3, "npc_near",                        	"bm1" );
	Game.SetConversationCam( 4, "pc_near",                        	"bm1" );
	Game.SetConversationCam( 5, "npc_far",                        	"bm1" );

	Game.AddAmbientNpcAnimation( "none", 				"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_yes",				"bm1" );
	Game.AddAmbientNpcAnimation( "none",		                     	"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air",		"bm1" );
	Game.AddAmbientNpcAnimation( "none", 				"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air",		"bm1" );

	Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture",	"bm1" );
	Game.AddAmbientPcAnimation( "none",					"bm1" );
	Game.AddAmbientPcAnimation( "dialogue_yes",				"bm1" );
	Game.AddAmbientPcAnimation( "none",					"bm1" );
	Game.AddAmbientPcAnimation( "dialogue_hands_in_air",			"bm1" );
	Game.AddAmbientPcAnimation( "none",					"bm1" );

	Game.AddBonusMissionNPCWaypoint("snake", "bm_snake_walk_1");
	Game.AddBonusMissionNPCWaypoint("snake", "bm1_snake_sd");

--ADDING PURCHASE POINTS FOR VEHICLES AND SKINS
--
Game.AddPurchaseCarReward( "gil", "gil", "npd", "gil_loc", 1.3, "gil_car" );
Game.AddPurchaseCarNPCWaypoint("gil", "gil_walk1");
Game.AddPurchaseCarReward( "simpson", "kearney", "npd", "kearney_loc", 1.3, "kearney_car" );
Game.AddPurchaseCarNPCWaypoint("kearney", "kearney_walk1");

--L6M1
Game.AddPurchaseCarReward( "simpson", "zmale1", "npd", "L6M1CS_npcspawn", 1.3, "L6M1CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale1", "L6M1CS_npcwalk");

--L6M2 and 6
Game.AddPurchaseCarReward( "simpson", "zmale3", "npd", "L6M2CS_npcspawn", 1.3, "L6M2CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale3", "L6M2CS_npcwalk");

--L6M3
Game.AddPurchaseCarReward( "simpson", "zmale4", "npd", "L6M3CS_npcspawn", 1.3, "L6M3CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale4", "L6M3CS_npcwalk");

--L6M4
Game.AddPurchaseCarReward( "simpson", "zfem1", "npd", "L6M4CS_npcspawn", 1.3, "L6M4CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zfem1", "L6M4CS_npcwalk");

--L6M5
Game.AddPurchaseCarReward( "simpson", "zfem5", "npd", "L6M5CS_npcspawn", 1.3, "L6M5CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zfem5", "L6M5CS_npcwalk");

--L6M7
Game.AddPurchaseCarReward( "simpson", "witch", "npd", "L6M7CS_npcspawn", 1.3, "L6M7CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("witch", "L6M7CS_npcwalk");

--ADDING TRAFFIC GROUP FOR LEVEL 06//
--
Game.CreateTrafficGroup( 0 );
Game.AddTrafficModel( "compactA",2 );
Game.AddTrafficModel( "pickupA",1 );
Game.AddTrafficModel( "burnsarm",1,1 );
Game.AddTrafficModel( "IStruck",1,1 );
Game.CloseTrafficGroup( );

--ADDING AMBIENT CHARACTERS
	Game.AddAmbientCharacter("teen", "ambient_svt", 2.0); -- Aztec Theatre

	Game.AddAmbientCharacter("cbg", "ambient_cbg",  0); -- Android Interior

	Game.AddAmbientCharacter("jimbo", "ambient_jimbo", 0); -- zone 2
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk1" );
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk2" );
		Game.AddAmbientNPCWaypoint( "jimbo", "jimbo_walk1" );

	Game.AddAmbientCharacter("nriviera", "ambient_burns",  0); -- rail 2
		Game.AddAmbientNPCWaypoint( "nriviera", "burns_walk1" );
		Game.AddAmbientNPCWaypoint( "nriviera", "burns_walk2" );
		Game.AddAmbientNPCWaypoint( "nriviera", "burns_walk1" );

	Game.AddAmbientCharacter("captain", "ambient_captain",  1.3); -- zone 3
		Game.AddAmbientNPCWaypoint( "captain", "captain_walk1" );
		Game.AddAmbientNPCWaypoint( "captain", "captain_walk2" );
		Game.AddAmbientNPCWaypoint( "captain", "captain_walk1" );

	Game.AddAmbientCharacter("carl", "ambient_carl",  0); -- zone 4
		Game.AddAmbientNPCWaypoint( "carl", "carl_walk1" );
		Game.AddAmbientNPCWaypoint( "carl", "carl_walk2" );
		Game.AddAmbientNPCWaypoint( "carl", "carl_walk1" );

	Game.AddAmbientCharacter("lou", "ambient_lou",  0); -- zone 4
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk1" );
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk2" );
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk3" );
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk2" );
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk1" );



--
--ADDING PED GROUP FOR LEVEL 06//
--
--Z1
Game.CreatePedGroup( 0 );
Game.AddPed( "girl1", 2 );
Game.AddPed( "male1", 2 );
Game.AddPed( "boy2", 2 );
Game.AddPed( "joger2", 2 );
Game.ClosePedGroup( );

--R1
Game.CreatePedGroup( 1 );
Game.AddPed( "girl2", 2 );
Game.AddPed( "boy4", 1 );
Game.AddPed( "fem4", 2 );
Game.AddPed( "male6", 2 );
Game.ClosePedGroup( );

--Z2
Game.CreatePedGroup( 2 );
Game.AddPed( "rednk2", 1 );
Game.AddPed( "girl4", 2 );
Game.AddPed( "fem1", 2 );
Game.AddPed( "male4", 2 );
Game.ClosePedGroup( );

--R2
Game.CreatePedGroup( 3 );
Game.AddPed( "busm2", 1 );
Game.AddPed( "sail1", 2 );
Game.AddPed( "hooker", 2 );
Game.AddPed( "bum", 2 );
Game.ClosePedGroup( );

--Z3
Game.CreatePedGroup( 4 );
Game.AddPed( "boy1", 2 );
Game.AddPed( "male5", 2 );
Game.AddPed( "girl1", 1 );
Game.AddPed( "fem1", 2 );
Game.ClosePedGroup( );

--R3
Game.CreatePedGroup( 5 );
Game.AddPed( "sail2", 2 );
Game.AddPed( "sail4", 2 );
Game.AddPed( "male3", 2 );
Game.AddPed( "bum", 1 );
Game.ClosePedGroup( );

--Z4
Game.CreatePedGroup( 6 );
Game.AddPed( "sail3", 2 );
Game.AddPed( "fem2", 2 );
Game.AddPed( "boy2", 1 );
Game.AddPed( "male1", 2 );
Game.ClosePedGroup( );


--Bind the coin drawable and sparkle texture. The art is loaded in the missgen.p3d file.
-- Yes the name of the p3d tTexture is scratch2.bmp, thanks to p3dimage. No biggie.
Game.SetCoinDrawable( "coinShape_000" );
Game.SetParticleTexture( 0, "scratch2.bmp" ); -- sparkles.
Game.SetParticleTexture( 1, "spark4.bmp" );	 -- sparks when vehicle hits.
Game.SetParticleTexture( 2, "cloud.tga" );	 -- dust cloud when running/jumping.
Game.SetParticleTexture( 3, "cloud.tga" );	 -- leaves when hitting shrubs/trees.
Game.SetParticleTexture( 4, "star.tga" );	 -- stars when hitting something static.
Game.SetParticleTexture( 5, "cloud.tga" );	 -- paint chips when vehicle is damaged.
Game.SetParticleTexture( 6, "halo.bmp" );	 -- Ring for shock wave fx.

Game.PreallocateActors( "beecamera", "2" );
Game.SetProjectileStats( "waspray", "120.0", "6" );

--Z1
Game.AddSpawnPointByLocatorScript("w_comicroof","beecamera","Shelley","w_comicroof","10.0","120");
--R1
--Z2
Game.AddSpawnPointByLocatorScript("w_bowl","beecamera","Shelley","w_bowl","10.0","30");
--R2
--Z3
--AddSpawnPointByLocatorScript("w_hype1","beecamera","Shelley","w_hype1","10.0","30");
Game.AddSpawnPointByLocatorScript("w_lighthouse","beecamera","Shelley","w_lighthouse","10.0","30");
--R3
Game.AddSpawnPointByLocatorScript("w_dockcrane","beecamera","Shelley","w_dockcrane","10.0","30");
--AddSpawnPointByLocatorScript("w_davey","beecamera","Shelley","w_davey","10.0","50");
--Z4
--AddSpawnPointByLocatorScript("w_duff1","beecamera","Shelley","w_duff1","10.0","50");
Game.AddSpawnPointByLocatorScript("w_kstage1","beecamera","Shelley","w_kstage1","10.0","30");
Game.AddSpawnPointByLocatorScript("w_kstage2","beecamera","Shelley","w_kstage2","10.0","30");
Game.AddSpawnPointByLocatorScript("w_night","beecamera","Shelley","w_night","10.0","30");
--R4
--AddSpawnPointByLocatorScript("w_culvert","beecamera","Shelley","w_culvert","10.0","40");
Game.AddSpawnPointByLocatorScript("w_offramp","beecamera","Shelley","w_offramp","10.0","30");
Game.AddSpawnPointByLocatorScript("w_observatory1","beecamera","Shelley","w_observatory1","13.0","40");
Game.AddSpawnPointByLocatorScript("w_observatory2","beecamera","Shelley","w_observatory2","13.0","40");
Game.AddSpawnPointByLocatorScript("w_kamp1","beecamera","Shelley","w_kamp1","15.0","40");
Game.AddSpawnPointByLocatorScript("w_kamp2","beecamera","Shelley","w_kamp2","10.0","40");


-- They will evade between a certain distance in the horizontal, specified by the 1st 2 numbers
-- and will keep a height above the ground somewhere the 3rd and 4th numbers
-- The final number indicates the speed at which to evade (in KPH)
--AddBehaviour( "beecamera", "EVADE_PLAYER", "1.0", "3.0", "1.0", "2.0", "15" );

--First param - min distance ( go closer and attraction mode disabled)
--2nd param - max distance ( bee will attempt to move closer )
--3rd param - speed in KPH
Game.AddBehaviour( "beecamera", "ATTRACTION", "5","15","5.0");

-- Tell the wasp to attack the player. First number indicates maximum firing range in meters
-- 2nd number indicates forward firing arc in degrees
-- Both conditions have to be satisfied before the actor will fire
-- 3rd number is the number of second between wasp evasion attempts
Game.AddBehaviour( "beecamera", "ATTACK_PLAYER", "15.0", "2.5" , "2.3");

Game.SetActorRotationSpeed( "beecamera", "140.0" );
Game.AddShield( "beecamera", "beeshield" );


--STATIC wasps - these ones never move
--AddBehaviour( "static_bee", "ATTRACTION", "2.0","20","10.0");

--Zone 1

Game.AddSpawnPointByLocatorScript("w_comicroof2","beecamera","Shelley","w_comicroof2","10.0","120");

--Zone 2

--Zone 3

Game.AddSpawnPointByLocatorScript("w_hype2","beecamera","Shelley","w_hype2","10.0","30");

--Rail 3

Game.AddSpawnPointByLocatorScript("w_shipcrane","beecamera","Shelley","w_shipcrane","30.0","50");
Game.AddSpawnPointByLocatorScript("w_shipstairs","beecamera","Shelley","w_shipstairs","30.0","30");

--Zone 4

Game.AddSpawnPointByLocatorScript("w_duff2","beecamera","Shelley","w_duff2","20.0","50");
Game.AddSpawnPointByLocatorScript("w_duff3","beecamera","Shelley","w_duff3","20.0","50");

--Rail 4

Game.AddSpawnPointByLocatorScript("w_dam1","beecamera","Shelley","w_dam1","10.0","50");
Game.AddSpawnPointByLocatorScript("w_dam2","beecamera","Shelley","w_dam2","10.0","50");

--Zone 5

--Zone 6

--Zone 7

Game.AddBehaviour( "w_comicroof2", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_comicroof2", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_hype2", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_hype2", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_shipstairs", "ATTACK_PLAYER", "20.0", "4.0" , "-1.0");
Game.AddBehaviour( "w_shipstairs", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_shipcrane", "ATTACK_PLAYER", "20.0", "4.0" , "-1.0");
Game.AddBehaviour( "w_shipcrane", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_duff2", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_duff2", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_duff3", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_duff3", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_dam1", "ATTACK_PLAYER", "10.0", "3.0" , "-1.0");
Game.AddBehaviour( "w_dam1", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_dam2", "ATTACK_PLAYER", "10.0", "3.0" , "-1.0");
Game.AddBehaviour( "w_dam2", "ATTRACTION", "2.0","20","-1");
