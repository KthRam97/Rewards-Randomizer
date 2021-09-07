--This is all level initialization stuff..
--Anything here is persistent across the entire level.

Game.EnableTutorialMode( false );
dcar = level_rewards[7][7]
Game.InitLevelPlayerVehicle(dcar,"level4_carstart","DEFAULT");

Game.CreateChaseManager("cPolice","Pursuit\\L4cop.con",1);
Game.SetHitAndRunDecay(1.0);
Game.SetNumChaseCars("2");

Game.AddCharacter("marge","marge");

Game.ClearAmbientAnimations( "sr1" );
Game.ClearAmbientAnimations( "sr2" );
Game.ClearAmbientAnimations( "sr3" );
Game.ClearAmbientAnimations( "bm1" );


-- STREET RACE 1 CHARACTER

	Game.AddNPCCharacterBonusMission("milhouse", "npd", "sr1_mhouse_sd", "sr1", "checkered", "intro", 0, "checkeredfinish" );
	Game.SetBonusMissionDialoguePos("sr1","sr1_player","sr1_mhouse_sd","level4_carstart");

	Game.SetConversationCam( 0, "pc_far",                        	"sr1" );
	Game.SetConversationCam( 1, "npc_far",                        	"sr1" );
	Game.SetConversationCam( 2, "pc_far",                        	"sr1" );
	Game.SetConversationCam( 3, "npc_far",                        	"sr1" );
	Game.SetConversationCam( 4, "pc_far",                        	"sr1" );

	Game.AddAmbientNpcAnimation( "dialogue_scratch_head", 		"sr1" );
	Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air",		"sr1" );
	Game.AddAmbientNpcAnimation( "dialogue_scratch_head", 		"sr1" );
	Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air",		"sr1" );
	Game.AddAmbientNpcAnimation( "dialogue_scratch_head", 		"sr1" );

	Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture",	"sr1" );
	Game.AddAmbientPcAnimation( "dialogue_scratch_head",			"sr1" );
	Game.AddAmbientPcAnimation( "dialogue_cross_arms",			"sr1" );
	Game.AddAmbientPcAnimation( "dialogue_hands_on_hips",		"sr1" );
	Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air",		"sr1" );

	Game.SetCamBestSide("sr2_nelson_sd",					"sr1" );

	Game.AddBonusMissionNPCWaypoint( "milhouse", "sr1_player" );
	Game.AddBonusMissionNPCWaypoint( "milhouse", "sr1_mhouse_sd" );

-- STREET RACE 2 CHARACTER

	Game.AddNPCCharacterBonusMission("nelson", "npd", "sr2_nelson_sd", "sr2", "checkered", "intro", 0, "checkeredfinish" );
	Game.SetBonusMissionDialoguePos("sr2","sr2_player","sr2_nelson_sd","level4_carstart");

	Game.SetConversationCam( 0, "npc_far",                        	"sr2" );
	Game.SetConversationCam( 1, "pc_far",                        	"sr2" );

	Game.AddAmbientNpcAnimation( "dialogue_shaking_fist", 		"sr2" );
	Game.AddAmbientNpcAnimation( "dialogue_thinking",			"sr2" );

	Game.AddAmbientPcAnimation( "dialogue_cross_arms",			"sr2" );
	Game.AddAmbientPcAnimation( "dialogue_hands_on_hips",		"sr2" );

	Game.SetCamBestSide("willie_walk1",					"sr2" );

-- STREET RACE 3 CHARACTER

	Game.AddNPCCharacterBonusMission("ralph", "npd", "sr3_ralph_sd", "sr3", "checkered", "intro", 0, "checkeredfinish" );
	Game.SetBonusMissionDialoguePos("sr3","sr3_player","sr3_ralph_sd","level4_carstart");

	Game.SetConversationCam( 0, "pc_far",                        	"sr3" );
	Game.SetConversationCam( 1, "npc_far",                        	"sr3" );
	Game.SetConversationCam( 2, "pc_near",                        	"sr3" );
	Game.SetConversationCam( 3, "npc_far",                        	"sr3" );

	Game.AddAmbientNpcAnimation( "none", 				"sr3" );
	Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture",	"sr3" );
	Game.AddAmbientNpcAnimation( "dialogue_thinking", 			"sr3" );
	Game.AddAmbientNpcAnimation( "dialogue_shaking_fist",		"sr3" );

	Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture",	"sr3" );
	Game.AddAmbientPcAnimation( "dialogue_scratch_head",			"sr3" );
	Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture",	"sr3" );
	Game.AddAmbientPcAnimation( "dialogue_scratch_head",			"sr3" );

	Game.SetCamBestSide("bm1_bestside",					"sr3" );

	Game.AddBonusMissionNPCWaypoint( "ralph", "sr3_player" );
	Game.AddBonusMissionNPCWaypoint( "ralph", "sr3_ralph_sd" );

Game.AddNPCCharacterBonusMission("louie", "npd", "sr4_louie_sd", "gr1", "dice", "intro", 0 );

--BONUS MISSION CHARACTER

	Game.AddNPCCharacterBonusMission("cbg", "npd", "bm1_cbg_sd", "bm1", "exclamation", "spherical", 1, "exclamation_shadow" );
	Game.SetBonusMissionDialoguePos("bm1","bm1_marge_talk","bm_cbg_walk_1","level4_carstart");

	Game.SetConversationCam( 0, "pc_far",                        	"bm1" );
	Game.SetConversationCam( 1, "npc_far",                        	"bm1" );
	Game.SetConversationCam( 2, "pc_far",                        	"bm1" );
	Game.SetConversationCam( 3, "npc_far",                        	"bm1" );
	Game.SetConversationCam( 4, "pc_far",                        	"bm1" );
	Game.SetConversationCam( 5, "npc_far",                        	"bm1" );
	Game.SetConversationCam( 6, "pc_far",                        	"bm1" );

	Game.AddAmbientNpcAnimation( "none", 				"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_shaking_fist",		"bm1" );
	Game.AddAmbientNpcAnimation( "none",                         	"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_hands_on_hips",	    	"bm1" );
	Game.AddAmbientNpcAnimation( "none", 				"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture",	"bm1" );
	Game.AddAmbientNpcAnimation( "none",					"bm1" );

	Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air",	        "bm1" );
	Game.AddAmbientPcAnimation( "none",			                "bm1" );
	Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture",	"bm1" );
	Game.AddAmbientPcAnimation( "none",					"bm1" );
	Game.AddAmbientPcAnimation( "dialogue_yes",				"bm1" );
	Game.AddAmbientPcAnimation( "none",					"bm1" );
	Game.AddAmbientPcAnimation( "dialogue_hands_on_hips",		"bm1" );

	Game.SetCamBestSide("bm1_bestside",					"bm1" );
	Game.AddBonusMissionNPCWaypoint("cbg", "bm_cbg_walk_1");


--ADDING AMBIENT CHARACTERS
	Game.AddAmbientCharacter("apu", "m7_apu_sd",  1.8);  --Kwik-E-Mart Interior

	Game.AddAmbientCharacter("skinner", "ambient_skinner",  1.3); --school interior

	Game.AddAmbientCharacter("beeman", "beeman_walk1",  0); --rail 1
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk2" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk3" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk3a" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk5" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk3a" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk3" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk2" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk1" );
		Game.AddAmbientNPCWaypoint( "beeman", "ambient_beeman" );

	Game.AddAmbientCharacter("ralph", "ambient_ralph",  1.3); --zone 1
		Game.AddAmbientNPCWaypoint( "ralph", "ralph_walk1" );
		Game.AddAmbientNPCWaypoint( "ralph", "ralph_walk2" );
		Game.AddAmbientNPCWaypoint( "ralph", "ralph_walk3" );

	Game.AddAmbientCharacter("selma", "ambient_selma",  0); --rail 2
		Game.AddAmbientNPCWaypoint( "selma", "selma_walk1" );
		Game.AddAmbientNPCWaypoint( "selma", "selma_walk2" );
		Game.AddAmbientNPCWaypoint( "selma", "selma_walk3" );
		Game.AddAmbientNPCWaypoint( "selma", "selma_walk4" );
		Game.AddAmbientNPCWaypoint( "selma", "selma_walk3" );
		Game.AddAmbientNPCWaypoint( "selma", "selma_walk2" );
		Game.AddAmbientNPCWaypoint( "selma", "selma_walk1" );

	Game.AddAmbientCharacter("kearney", "kearney_walk4",  0); --zone 3
		Game.AddAmbientNPCWaypoint( "kearney", "kearney_walk3" );
		Game.AddAmbientNPCWaypoint( "kearney", "ambient_kearney" );
		Game.AddAmbientNPCWaypoint( "kearney", "kearney_walk1" );
		Game.AddAmbientNPCWaypoint( "kearney", "kearney_walk2" );
		Game.AddAmbientNPCWaypoint( "kearney", "kearney_walk1" );
		Game.AddAmbientNPCWaypoint( "kearney", "ambient_kearney" );
		Game.AddAmbientNPCWaypoint( "kearney", "kearney_walk3" );

-- REMOVING BECAUSE HE'S STANDING BY HIS DOORBELL
--	AddAmbientCharacter("moe", "ambient_moe",  1.3); //zone 3
--		AddAmbientNPCWaypoint( "moe", "moe_walk1" );


--ADDING PURCHASE POINTS FOR VEHICLES AND SKINS
--
Game.AddPurchaseCarReward( "gil", "gil", "npd", "gil_loc", 1.3, "gil_car" );
Game.AddPurchaseCarNPCWaypoint("gil", "gil_walk1");
Game.AddPurchaseCarReward( "simpson", "willie", "npd", "willie_loc", 1.3, "willie_car" );
Game.AddPurchaseCarNPCWaypoint("willie", "willie_walk1");

--L4M1 and 6 done
Game.AddPurchaseCarReward( "simpson", "zmale1", "npd", "L4M1CS_npcspawn", 1.3, "L4M1CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale1", "L4M1CS_npcwalk");

--L4M2
Game.AddPurchaseCarReward( "simpson", "zmale3", "npd", "L4M2CS_npcspawn", 1.3, "L4M2CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale3", "L4M2CS_npcwalk");

--L4M3
Game.AddPurchaseCarReward( "simpson", "zmale4", "npd", "L4M3CS_npcspawn", 1.3, "L4M3CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale4", "L4M3CS_npcwalk");

--L4M4
Game.AddPurchaseCarReward( "simpson", "zfem1", "npd", "L4M4CS_npcspawn", 1.3, "L4M4CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zfem1", "L4M4CS_npcwalk");

--L4M5
Game.AddPurchaseCarReward( "simpson", "zfem5", "npd", "L4M5CS_npcspawn", 1.3, "L4M5CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zfem5", "L4M5CS_npcwalk");

--L4M7
Game.AddPurchaseCarReward( "simpson", "witch", "npd", "L4M7CS_npcspawn", 1.3, "L4M7CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("witch", "L4M7CS_npcwalk");

--ADDING TRAFFIC GROUP FOR LEVEL 04//
--
Game.CreateTrafficGroup( 0 );
Game.AddTrafficModel( "compactA",2 );
Game.AddTrafficModel( "SUVA",1 );
Game.AddTrafficModel( "garbage",1,1 );
Game.AddTrafficModel( "nuctruck",1,1 );
Game.CloseTrafficGroup( );

--
--ADDING PED GROUP FOR LEVEL 04//
--
--z1r1
Game.CreatePedGroup( 0 );
Game.AddPed( "joger1", 2 );
Game.AddPed( "fem1", 1 );
Game.AddPed( "fem2", 2 );
Game.AddPed( "male5", 2 );
Game.ClosePedGroup( );

--z2
Game.CreatePedGroup( 1 );
Game.AddPed( "olady3", 2 );
Game.AddPed( "olady2", 2 );
Game.AddPed( "male3", 2 );
Game.AddPed( "male5", 1 );
Game.ClosePedGroup( );

--R2
Game.CreatePedGroup( 2 );
Game.AddPed( "busw1", 2 );
Game.AddPed( "olady1", 2 );
Game.AddPed( "girl4", 2 );
Game.AddPed( "male3", 1 );
Game.ClosePedGroup( );

--Z3
Game.CreatePedGroup( 3 );
Game.AddPed( "boy1", 2 );
Game.AddPed( "boy4", 1 );
Game.AddPed( "girl1", 2 );
Game.AddPed( "girl4", 2 );
Game.ClosePedGroup( );

--R3Z4
Game.CreatePedGroup( 4 );
Game.AddPed( "fem4", 2 );
Game.AddPed( "male2", 2 );
Game.AddPed( "busw1", 2 );
Game.AddPed( "male6", 1 );
Game.ClosePedGroup( );

--R6Z7
Game.CreatePedGroup( 5 );
Game.AddPed( "farmr1", 2 );
Game.AddPed( "sail3", 1 );
Game.AddPed( "bum", 2 );
Game.AddPed( "hooker", 2 );
Game.ClosePedGroup( );

--R7
Game.CreatePedGroup( 6 );
Game.AddPed( "joger2", 2 );
Game.AddPed( "girl2", 1 );
Game.AddPed( "male1", 2 );
Game.AddPed( "fem4", 2 );
Game.ClosePedGroup( );

--Z6
Game.CreatePedGroup( 7 );
Game.AddPed( "nuclear", 7 );
Game.ClosePedGroup( );

--


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
Game.SetProjectileStats( "waspray", "70.0", "6" );


--AddSpawnPoint( "SimpsonsHouse", "beecamera", "Shelly","222.041","4.5","-169.169","50.0","20" );

Game.AddSpawnPointByLocatorScript("w_kwickemart","beecamera","Shelley","w_kwickemart","15.0","20");
Game.AddSpawnPointByLocatorScript("w_gasroof","beecamera","Shelley","w_gasroof","15.0","20");


Game.AddSpawnPointByLocatorScript("w_schoolroof1","beecamera","Shelley","w_schoolroof1","15.0","20");
Game.AddSpawnPointByLocatorScript("w_schoolroof2","beecamera","Shelley","w_schoolroof2","15.0","20");


Game.AddSpawnPointByLocatorScript("w_tower","beecamera","Shelley","w_tower","15.0","20");
--AddSpawnPointByLocatorScript("w_bonuscar","beecamera","Shelley","w_bonuscar","50.0","20");

--AddSpawnPointByLocatorScript("w_stonetemple","beecamera","Shelley","w_stonetemple","60.0","30");

Game.AddSpawnPointByLocatorScript("w_burns1","beecamera","Shelley","w_burns1","60.0","30");
Game.AddSpawnPointByLocatorScript("w_chess1","beecamera","Shelley","w_chess1","30.0","20");
Game.AddSpawnPointByLocatorScript("w_chess2","beecamera","Shelley","w_chess2","30.0","10");

Game.AddSpawnPointByLocatorScript("w_trailor1","beecamera","Shelley","w_trailor1","50.0","20");
Game.AddSpawnPointByLocatorScript("w_trailor2","beecamera","Shelley","w_trailor2","50.0","20");

--AddSpawnPointByLocatorScript("w_bridge1","beecamera","Shelley","w_bridge1","30.0","20");
--AddSpawnPointByLocatorScript("w_bridge2","beecamera","Shelley","w_bridge2","30.0","20");

-- They will evade between a certain distance in the horizontal, specified by the 1st 2 numbers
-- and will keep a height above the ground somewhere the 3rd and 4th numbers
-- The final number indicates the speed at which to evade (in KPH)
Game.AddBehaviour( "beecamera", "EVADE_PLAYER", "1.0", "5.0", "1.0", "2.0", "5" );

-- They will evade between a certa//First param - min distance ( go closer and attraction mode disabled)
--2nd param - max distance ( bee will attempt to move closer )
--3rd param - speed in KPH
Game.AddBehaviour( "beecamera", "ATTRACTION", "6.0","12.0","5.0");

-- Tell the wasp to attack the player. First number indicates maximum firing range in meters
-- 2nd number indicates forward firing arc in degrees
-- 3rd number is the number of second between wasp evasion attempts
-- Both conditions have to be satisfied before the actor will fire
Game.AddBehaviour( "beecamera", "ATTACK_PLAYER", "8.0", "3.5" , "5.0");

Game.SetActorRotationSpeed( "beecamera", "100.0" );
--AddShield( "beecamera", "beeshield" );

--STATIC wasps - these ones never move
--AddBehaviour( "static_bee", "ATTRACTION", "2.0","20","10.0");

--Z1

Game.AddSpawnPointByLocatorScript("w_simpsons","beecamera","Shelley","w_simpsons","20.0","20");
Game.AddSpawnPointByLocatorScript("w_flanders","beecamera","Shelley","w_flanders","25.0","20");
Game.AddSpawnPointByLocatorScript("w_neighbor1","beecamera","Shelley","w_neighbor1","15.0","20");
Game.AddSpawnPointByLocatorScript("w_wiggum","beecamera","Shelley","w_wiggum","15.0","20");
Game.AddSpawnPointByLocatorScript("w_wiggum2","beecamera","Shelley","w_wiggum2","20.0","10");


--R1
--Z2

Game.AddSpawnPointByLocatorScript("w_gasroof2","beecamera","Shelley","w_gasroof2","15.0","20");

--R2
--Z3

--AddSpawnPointByLocatorScript("w_playground","beecamera","Shelley","w_playground","15.0","20");
Game.AddSpawnPointByLocatorScript("w_schoolstairs","beecamera","Shelley","w_schoolstairs","15.0","20");

--R3
--Z4
--R4
--Z5
--R5
--Z6

Game.AddSpawnPointByLocatorScript("w_burns2","beecamera","Shelley","w_burns2","60.0","30");

--R6
--Z7


Game.AddSpawnPointByLocatorScript("static_bee2","beecamera","Shelley","w_powerplant2","20.0","10");
--AddSpawnPointByLocatorScript("static_bee3","beecamera","Shelley","w_powerplant3","20.0","10");
--AddSpawnPointByLocatorScript("static_bee4","beecamera","Shelley","w_powerplant4","20.0","10");

Game.AddSpawnPointByLocatorScript("static_bee6","beecamera","Shelley","w_barn","20.0","20");

Game.AddBehaviour( "w_simpsons", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_simpsons", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_flanders", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_flanders", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_neighbor1", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_neighbor1", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_wiggum", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_wiggum", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_wiggum2", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_wiggum2", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_lardlads", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_lardlads", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_schoolstairs", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_schoolstairs", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "static_bee2", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "static_bee2", "ATTRACTION", "2.0","20","-1");
--AddBehaviour( "static_bee3", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "static_bee3", "ATTRACTION", "2.0","20","-1");
--AddBehaviour( "static_bee4", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "static_bee4", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "static_bee6", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "static_bee6", "ATTRACTION", "2.0","20","-1");
--AddBehaviour( "w_playground", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_playground", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_burns2", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_burns2", "ATTRACTION", "2.0","20","-1");
