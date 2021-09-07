--This is all level initialization stuff..
--Anything here is persistent across the entire level.

Game.EnableTutorialMode( false );
dcar = level_rewards[7][7]
Game.InitLevelPlayerVehicle(dcar,"level2_carstart","DEFAULT");
Game.AddCharacter("bart","bart");
--SetPostLevelFMV("fmv3.rmv");

Game.CreateChaseManager("cPolice","Pursuit\\L2cop.con",1);
Game.SetHitAndRunDecay(1.5);
Game.SetNumChaseCars("1");

Game.ClearAmbientAnimations( "sr1" );
Game.ClearAmbientAnimations( "sr2" );
Game.ClearAmbientAnimations( "sr3" );
Game.ClearAmbientAnimations( "bm1" );


Game.AddNPCCharacterBonusMission("milhouse", "npd", "sr1_mhouse_sd", "sr1", "checkered", "intro", 0, "checkeredfinish" );
Game.SetBonusMissionDialoguePos("sr1","sr1_bart","sr1_mhouse_sd","homer_car");

	Game.SetConversationCam( 0, "pc_far",				"sr1" );
	Game.SetConversationCam( 1, "npc_far",				"sr1" );
	Game.AddAmbientNpcAnimation( "none",					"sr1" );
	Game.AddAmbientNpcAnimation( "dialogue_no",				"sr1" );

	Game.AddAmbientPcAnimation( "dialogue_hands_on_hips",		"sr1" );
	Game.AddAmbientPcAnimation( "none",					"sr1" );

	Game.SetCamBestSide("sr1_bestside",					"sr1" );

Game.AddNPCCharacterBonusMission("nelson", "npd", "sr2_nelson_sd", "sr2", "checkered", "intro", 0, "checkeredfinish" );
Game.SetBonusMissionDialoguePos("sr2","sr2_bart","sr2_nelson_sd","sr2_carstart");

	Game.SetConversationCam( 0, "pc_far",				"sr2" );
	Game.SetConversationCam( 1, "npc_far",				"sr2" );

	Game.AddAmbientNpcAnimation( "none",					"sr2" );
	Game.AddAmbientNpcAnimation( "dialogue_shaking_fist",		"sr2" );

	Game.AddAmbientPcAnimation( "dialogue_scratch_head",			"sr2" );
	Game.AddAmbientPcAnimation( "none",					"sr2" );

	Game.SetCamBestSide("sr2_bestside",					"sr2" );

Game.AddNPCCharacterBonusMission("ralph", "npd", "sr3_ralph_sd", "sr3", "checkered", "intro", 0, "checkeredfinish" );
Game.SetBonusMissionDialoguePos("sr3","sr3_bart","sr3_ralph_sd","sr3_carstart");

	Game.SetConversationCam( 0, "npc_far",				"sr3" );
	Game.SetConversationCam( 1, "pc_far",				"sr3" );

	Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture",	"sr3" );
	Game.AddAmbientNpcAnimation( "none",					"sr3" );

	Game.AddAmbientPcAnimation( "none",					"sr3" );
	Game.AddAmbientPcAnimation( "dialogue_yes",				"sr3" );

	Game.SetCamBestSide("sr3_bestside",					"sr3" );

--SetCamBestSide("sr4_bestside");
Game.AddNPCCharacterBonusMission("louie", "npd", "sr4_louie_sd", "gr1", "dice", "intro", 0 );
Game.SetBonusMissionDialoguePos("gr1","sr4_bart","sr4_louie_sd","sr4_bartcar");

Game.AddNPCCharacterBonusMission("grandpa", "npd", "bm1_grampa_sd", "bm1", "exclamation", "incontinent", 1, "exclamation_shadow" );
Game.SetBonusMissionDialoguePos("bm1","bm1_bart_talk","bm1_grampa_sd","bm1_carstart");

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

	Game.SetCamBestSide("bm1_bestside",					"sr3" );

	Game.AddBonusMissionNPCWaypoint( "grandpa", "bm1_grampa_walk1" );
	Game.AddBonusMissionNPCWaypoint( "grandpa", "bm1_grampa_walk2" );
	Game.AddBonusMissionNPCWaypoint( "grandpa", "bm1_grampa_sd" );

--ADDING AMBIENT CHARACTERS
	Game.AddAmbientCharacter("patty", "ambient_patty",  2.0); --DMV Interior

	Game.AddAmbientCharacter("moe", "ambient_moe",  2.0); --Moe's Interior

	Game.AddAmbientCharacter("moleman", "ambient_moleman",  0); --zone 1
		Game.AddAmbientNPCWaypoint( "moleman", "moleman_walk1" );
		Game.AddAmbientNPCWaypoint( "moleman", "moleman_walk2" );
		Game.AddAmbientNPCWaypoint( "moleman", "moleman_walk3" );
		Game.AddAmbientNPCWaypoint( "moleman", "moleman_walk4" );
		Game.AddAmbientNPCWaypoint( "moleman", "moleman_walk5" );
		Game.AddAmbientNPCWaypoint( "moleman", "moleman_walk4" );
		Game.AddAmbientNPCWaypoint( "moleman", "moleman_walk3" );
		Game.AddAmbientNPCWaypoint( "moleman", "moleman_walk2" );
		Game.AddAmbientNPCWaypoint( "moleman", "moleman_walk1" );


	Game.AddAmbientCharacter("jasper", "ambient_jasper",  0); --rail 1
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk1" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk2" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk3" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk2" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk1" );

	Game.AddAmbientCharacter("lenny", "ambient_lenny",  0); --zone 2
		Game.AddAmbientNPCWaypoint( "lenny", "lenny_walk1" );
		Game.AddAmbientNPCWaypoint( "lenny", "lenny_walk2" );
		Game.AddAmbientNPCWaypoint( "lenny", "lenny_walk1" );

	Game.AddAmbientCharacter("eddie", "ambient_eddie",  0); --zone 3
		Game.AddAmbientNPCWaypoint( "eddie", "eddie_walk1" );
		Game.AddAmbientNPCWaypoint( "eddie", "eddie_walk2" );
		Game.AddAmbientNPCWaypoint( "eddie", "eddie_walk1" );

	Game.AddAmbientCharacter("lou", "ambient_lou",  0); --zone 4
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk1" );
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk2" );
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk3" );
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk4" );
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk3" );
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk2" );
		Game.AddAmbientNPCWaypoint( "lou", "lou_walk1" );

--ADDING PURCHASE POINTS FOR VEHICLES AND SKINS
--
	Game.AddPurchaseCarReward( "gil", "gil", "npd", "gil_loc", 1.3, "gil_car" );
	Game.AddPurchaseCarReward( "simpson", "homer", "npd", "homer_loc", 1.3, "homer_car" );

--L2M1 done
	Game.AddPurchaseCarReward( "simpson", "zmale1", "npd", "L2M1CS_npcspawn", 1.3, "L2M1CS_carspawn" );
	Game.AddPurchaseCarNPCWaypoint("zmale1", "L2M1CS_npcwalk");

--L2M2 done
	Game.AddPurchaseCarReward( "simpson", "zmale3", "npd", "L2M2CS_npcspawn", 1.3, "L2M2CS_carspawn" );
	Game.AddPurchaseCarNPCWaypoint("zmale3", "L2M2CS_npcwalk");

--L2M3 done
	Game.AddPurchaseCarReward( "simpson", "zmale4", "npd", "L2M3CS_npcspawn", 1.3, "L2M3CS_carspawn" );
	Game.AddPurchaseCarNPCWaypoint("zmale4", "L2M3CS_npcwalk");

--L2M4,6 and 7 done
	Game.AddPurchaseCarReward( "simpson", "zfem1", "npd", "L2M4CS_npcspawn", 1.3, "L2M4CS_carspawn" );
	Game.AddPurchaseCarNPCWaypoint("zfem1", "L2M4CS_npcwalk");

--L2M5 done
	Game.AddPurchaseCarReward( "simpson", "zfem5", "npd", "L2M5CS_npcspawn", 1.3, "L2M5CS_carspawn" );
	Game.AddPurchaseCarNPCWaypoint("zfem5", "L2M5CS_npcwalk");

--ADDING TRAFFIC GROUP FOR LEVEL 02//
--
	Game.CreateTrafficGroup( 0 );
		Game.AddTrafficModel( "taxiA",2 );
		Game.AddTrafficModel( "sedanB",1 );
		Game.AddTrafficModel( "sportsA",1 );
		Game.AddTrafficModel( "pizza",1,1 );
	Game.CloseTrafficGroup( );

--
--ADDING PED GROUP FOR LEVEL 02//
--
--Z1
Game.CreatePedGroup( 0 );
Game.AddPed( "male6", 1 );
Game.AddPed( "fem3", 2 );
Game.AddPed( "fem4", 2 );
Game.AddPed( "girl4", 2 );
Game.ClosePedGroup( );

--R1
Game.CreatePedGroup( 1 );
Game.AddPed( "const1", 2 );
Game.AddPed( "const2", 2 );
Game.AddPed( "male3", 2 );
Game.AddPed( "boy4", 1 );
Game.ClosePedGroup( );

--Z2
Game.CreatePedGroup( 2 );
Game.AddPed( "sail1", 2 );
Game.AddPed( "mobstr", 2 );
Game.AddPed( "busm2", 1 );
Game.AddPed( "hooker", 2);
Game.ClosePedGroup( );

--R2
Game.CreatePedGroup( 3 );
Game.AddPed( "const1", 2 );
Game.AddPed( "bum", 2 );
Game.AddPed( "sail4", 1 );
Game.AddPed( "male3", 2 );
Game.ClosePedGroup( );

--Z3
Game.CreatePedGroup( 4 );
Game.AddPed( "busm1", 1 );
Game.AddPed( "busw1", 2 );
Game.AddPed( "male5", 2 );
Game.AddPed( "boy2", 2 );

Game.ClosePedGroup( );

--Z4
Game.CreatePedGroup( 5 );
Game.AddPed( "busm1", 1 );
Game.AddPed( "busw1", 2 );
Game.AddPed( "busm2", 2 );
Game.AddPed( "fem2", 2 );
Game.ClosePedGroup( );

--R4
Game.CreatePedGroup( 6 );
Game.AddPed( "male1", 1 );
Game.AddPed( "busw1", 2 );
Game.AddPed( "fem1", 2 );
Game.AddPed( "joger1", 2 );
Game.ClosePedGroup( );

-- WASPS ///

Game.PreallocateActors( "beecamera", "2" );
Game.SetProjectileStats( "waspray", "70.0", "5" );

-- Create a new spawn point called "catapult spawn point"
-- When within a certain radius, specified by the 4th number, it will retrieve the stateprop
-- called "beecamera" from memory and create a new instance of it named "Shelly" This prop
-- will be positioned at (xyz) location specified by the first 3 numbers
-- Final value is unused at this point (eventually for timeout implementation)


--zone1
Game.AddSpawnPointByLocatorScript("w_hospital","beecamera","Shelley","w_hospital","15.0","-1");
Game.AddSpawnPointByLocatorScript("w_museum","beecamera","Shelley","w_museum","8.0","-1");
--rail1
Game.AddSpawnPointByLocatorScript("w_krusty1","beecamera","Shelley","w_krusty1","10.0","-1");
--zone2
Game.AddSpawnPointByLocatorScript("w_carwash","beecamera","Shelley","w_carwash","10.0","-1");
--rail2
Game.AddSpawnPointByLocatorScript("w_railstair","beecamera","Shelley","w_railstair","15.0","-1");
Game.AddSpawnPointByLocatorScript("w_rail2","beecamera","Shelley","w_rail2","10.0","-1");
--zone3
--rail3
--AddSpawnPointByLocatorScript("w_matt1","beecamera","Shelley","w_matt1","10.0","-1");
--AddSpawnPointByLocatorScript("w_matt2","beecamera","Shelley","w_matt2","10.0","-1");
--AddSpawnPointByLocatorScript("w_matt3","beecamera","Shelley","w_matt3","10.0","-1");
--zone4
Game.AddSpawnPointByLocatorScript("w_mono1","beecamera","Shelley","w_mono1","10.0","-1");
Game.AddSpawnPointByLocatorScript("w_popcycle","beecamera","Shelley","w_popcycle","8.0","-1");

--rail4
Game.AddSpawnPointByLocatorScript("w_fountain","beecamera","Shelley","w_fountain","10.0","-1");


-- They will evade between a certain distance in the horizontal, specified by the 1st 2 numbers
-- and will keep a height above the ground somewhere the 3rd and 4th numbers
-- The final number indicates the speed at which to evade (in KPH)
Game.AddBehaviour( "beecamera", "EVADE_PLAYER", "2.5", "8.0", "1.0", "2.0", "5" );

--First param - min distance ( go closer and attraction mode disabled)
--2nd param - max distance ( bee will attempt to move closer )
--3rd param - speed in KPH
Game.AddBehaviour( "beecamera", "ATTRACTION", "2.0","15","5.0");

-- Tell the wasp to attack the player. First number indicates maximum firing range in meters
-- 2nd number indicates forward firing arc in degrees
-- Both conditions have to be satisfied before the actor will fire
-- 3rd number is the number of second between wasp evasion attempts
Game.AddBehaviour( "beecamera", "ATTACK_PLAYER", "15.0", "2.5" , "4.0");


Game.SetActorRotationSpeed( "beecamera", "85.0" );
--AddShield( "beecamera", "beeshield" );


--STATIC wasps - these ones never move
--AddBehaviour( "static_bee", "ATTRACTION", "2.0","20","10.0");

--Zone 1
Game.AddSpawnPointByLocatorScript("w_townhall","beecamera","Shelley","w_townhall","20.0","-1");
Game.AddSpawnPointByLocatorScript("w_gazebo","beecamera","Shelley","w_gazebo","15.0","-1");
Game.AddSpawnPointByLocatorScript("w_roof","beecamera","Shelley","w_roof","10.0","-1");
--Zone 2
Game.AddSpawnPointByLocatorScript("w_legitroof","beecamera","Shelley","w_legitroof","15.0","60");
Game.AddSpawnPointByLocatorScript("w_legitroof2","beecamera","Shelley","w_legitroof2","15.0","60");
Game.AddSpawnPointByLocatorScript("w_moesroof","beecamera","Shelley","w_moesroof","15.0","-1");
--Rail 2
Game.AddSpawnPointByLocatorScript("w_rail1","beecamera","Shelley","w_rail1","12.0","-1");
Game.AddSpawnPointByLocatorScript("w_roundroom","beecamera","Shelley","w_roundroom","8.0","-1");
--Zone 3
--Zone 4
Game.AddSpawnPointByLocatorScript("w_police","beecamera","Shelley","w_police","10.0","-1");
Game.AddSpawnPointByLocatorScript("w_mono2","beecamera","Shelley","w_mono2","10.0","-1");
Game.AddSpawnPointByLocatorScript("w_mono3","beecamera","Shelley","w_mono3","10.0","-1");

Game.AddBehaviour( "w_townhall", "ATTACK_PLAYER", "15.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_townhall", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_roof", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_roof", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_gazebo", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_gazebo", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_legitroof", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_legitroof", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_legitroof2", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_legitroof2", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_moesroof", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_moesroof", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_rail1", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_rail1", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_roundroom", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_roundroom", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_police", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_police", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_mono2", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_mono2", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_mono3", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_mono3", "ATTRACTION", "2.0","20","-1");


--Bind the coin drawable and textures for various particle/sfx. The art is loaded in the missgen/fx file.
Game.SetCoinDrawable( "coinShape_000" );
Game.SetParticleTexture( 0, "scratch2.bmp" ); -- sparkles.
Game.SetParticleTexture( 1, "spark4.bmp" );	 -- sparks when vehicle hits.
Game.SetParticleTexture( 2, "cloud.tga" );	 -- dust cloud when running/jumping.
Game.SetParticleTexture( 3, "cloud.tga" );	 -- leaves when hitting shrubs/trees.
Game.SetParticleTexture( 4, "star.tga" );	 -- stars when hitting something static.
Game.SetParticleTexture( 5, "cloud.tga" );	 -- paint chips when vehicle is damaged.
Game.SetParticleTexture( 6, "halo.bmp" );	 -- Ring for shock wave fx.
