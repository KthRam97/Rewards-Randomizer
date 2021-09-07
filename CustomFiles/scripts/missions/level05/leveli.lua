--This is all level initialization stuff..
--Anything here is persistent across the entire level.
Game.EnableTutorialMode( false );
dcar = level_rewards[7][7];
Game.InitLevelPlayerVehicle(dcar,"level5_carstart","DEFAULT");
Game.AddCharacter("apu","apu");
--SetPostLevelFMV("fmv5.rmv");

Game.CreateChaseManager("cPolice","Pursuit\\L5cop.con",1);
Game.SetHitAndRunDecay(1.0);
Game.SetNumChaseCars("2");

Game.ClearAmbientAnimations( "sr1" );
Game.ClearAmbientAnimations( "sr2" );
Game.ClearAmbientAnimations( "sr3" );
Game.ClearAmbientAnimations( "bm1" );

Game.AddNPCCharacterBonusMission("milhouse", "npd", "sr1_mhouse_sd", "sr1", "checkered", "intro", 0, "checkeredfinish" );
Game.SetBonusMissionDialoguePos("sr1","sr1_apu","sr1_mhouse_sd","sr1_apucar");
	Game.SetConversationCam( 0, "pc_near",				"sr1" );
	Game.SetConversationCam( 1, "npc_far",				"sr1" );
	Game.SetConversationCam( 2, "pc_near",				"sr1" );
	Game.SetConversationCam( 3, "npc_far",				"sr1" );

	Game.AddAmbientNpcAnimation( "none",					"sr1" );
	Game.AddAmbientNpcAnimation( "dialogue_shaking_fist",		"sr1" );
	Game.AddAmbientNpcAnimation( "none",					"sr1" );
	Game.AddAmbientNpcAnimation( "dialogue_cross_arms",			"sr1" );

	Game.AddAmbientPcAnimation( "none",					"sr1" );
	Game.AddAmbientPcAnimation( "none",					"sr1" );
	Game.AddAmbientPcAnimation( "dialogue_hands_in_air",			"sr1" );
	Game.AddAmbientPcAnimation( "none",					"sr1" );

Game.AddNPCCharacterBonusMission("nelson", "npd", "sr2_nelson_sd", "sr2", "checkered", "intro", 0, "checkeredfinish" );
Game.SetBonusMissionDialoguePos("sr2","sr2_apu","sr2_nelson_sd","sr2_apucar");
	Game.SetConversationCam( 0, "pc_near",				"sr2" );
	Game.SetConversationCam( 1, "npc_far",				"sr2" );

	Game.AddAmbientNpcAnimation( "none",					"sr2" );
	Game.AddAmbientNpcAnimation( "dialogue_shaking_fist",		"sr2" );

	Game.AddAmbientPcAnimation( "dialogue_thinking",			"sr2" );
	Game.AddAmbientPcAnimation( "none",					"sr2" );
Game.AddNPCCharacterBonusMission("ralph", "npd", "sr3_ralph_sd", "sr3", "checkered", "intro", 0, "checkeredfinish" );
Game.SetBonusMissionDialoguePos("sr3","sr3_apu","sr3_ralph_sd","sr3_apucar");
	Game.SetConversationCam( 0, "pc_near",				"sr3" );
	Game.SetConversationCam( 1, "npc_far",				"sr3" );

	Game.AddAmbientNpcAnimation( "none",					"sr3" );
	Game.AddAmbientNpcAnimation( "dialogue_yes",				"sr3" );

	Game.AddAmbientPcAnimation( "dialogue_scratch_head",			"sr3" );
	Game.AddAmbientPcAnimation( "none",					"sr3" );
Game.AddNPCCharacterBonusMission("louie", "npd", "sr4_louie_sd", "gr1", "dice", "intro", 0 );
Game.AddNPCCharacterBonusMission("frink", "npd", "bm1_frink_sd", "bm1", "exclamation", "hovercar", 1, "exclamation_shadow" );
	Game.SetConversationCam( 0, "npc_near",                        	"bm1" );
	Game.SetConversationCam( 1, "pc_far",                      		"bm1" );
	Game.SetConversationCam( 2, "npc_far",                  		"bm1" );
	Game.SetConversationCam( 3, "pc_near",                        	"bm1" );
	Game.SetConversationCam( 4, "npc_near",                        	"bm1" );
	Game.SetConversationCam( 5, "pc_far",                        	"bm1" );
	Game.SetConversationCam( 6, "pc_far",                        	"bm1" );

	Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture", 	"bm1" );
	Game.AddAmbientNpcAnimation( "none", 				"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_hands_in_air",		"bm1" );
	Game.AddAmbientNpcAnimation( "none",                            	"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_cross_arms",              	"bm1" );
	Game.AddAmbientNpcAnimation( "none", 				"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air",		"bm1" );

	Game.AddAmbientPcAnimation( "none",					"bm1" );
	Game.AddAmbientPcAnimation( "dialogue_no",				"bm1" );
	Game.AddAmbientPcAnimation( "none",					"bm1" );
	Game.AddAmbientPcAnimation( "dialogue_shaking_fist",			"bm1" );
	Game.AddAmbientPcAnimation( "none",					"bm1" );
	Game.AddAmbientPcAnimation( "dialogue_yes",				"bm1" );
	Game.AddAmbientPcAnimation( "none",					"bm1" );
Game.AddBonusMissionNPCWaypoint("frink", "bm_frink_walk_1");
Game.AddBonusMissionNPCWaypoint("frink", "bm_frink_walk_2");
Game.AddBonusMissionNPCWaypoint("frink", "bm_frink_walk_1");
Game.SetBonusMissionDialoguePos("bm1","bm1_apu","bm_frink_walk_1","bm1_carstart");

--ADDING AMBIENT CHARACTERS
	Game.AddAmbientCharacter("patty", "ambient_patty",  2.5);  --DMV
	Game.AddAmbientCharacter("selma", "ambient_selma",  0);  --DMV

	Game.AddAmbientCharacter("moe", "ambient_moe",  2.5);  --Moe's


	Game.AddAmbientCharacter("jasper", "ambient_jasper",  0);  --Zone4
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk1" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk2" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk3" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk4" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk5" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk6" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk7" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk10" );
		Game.AddAmbientNPCWaypoint( "jasper", "jasper_walk1" );

	Game.AddAmbientCharacter("lenny", "ambient_lenny",  0);  --Zone2
		Game.AddAmbientNPCWaypoint( "lenny", "lenny_walk1" );
		Game.AddAmbientNPCWaypoint( "lenny", "lenny_walk2" );
		Game.AddAmbientNPCWaypoint( "lenny", "lenny_walk1" );

	Game.AddAmbientCharacter("grandpa", "ambient_grandpa",  0);  --Zone1
		Game.AddAmbientNPCWaypoint( "grandpa", "grandpa_walk1" );
		Game.AddAmbientNPCWaypoint( "grandpa", "grandpa_walk2" );
		Game.AddAmbientNPCWaypoint( "grandpa", "grandpa_walk3" );
		Game.AddAmbientNPCWaypoint( "grandpa", "grandpa_walk4" );
		Game.AddAmbientNPCWaypoint( "grandpa", "grandpa_walk3" );
		Game.AddAmbientNPCWaypoint( "grandpa", "grandpa_walk2" );
		Game.AddAmbientNPCWaypoint( "grandpa", "grandpa_walk1" );

	Game.AddAmbientCharacter("ralph", "ambient_otto",  0);  --Zone3
		Game.AddAmbientNPCWaypoint( "ralph", "ambient_otto" );
		Game.AddAmbientNPCWaypoint( "ralph", "otto_walk1" );
		Game.AddAmbientNPCWaypoint( "ralph", "ambient_otto" );

--ADDING PURCHASE POINTS FOR VEHICLES AND SKINS
--
Game.AddPurchaseCarReward( "gil", "gil", "npd", "gil_loc", 1.3, "gil_car" );
Game.AddPurchaseCarNPCWaypoint("gil", "gil_walk1");
Game.AddPurchaseCarReward( "simpson", "homer", "npd", "homer_loc", 1.3, "homer_car" );
Game.AddPurchaseCarNPCWaypoint("homer", "homer_walk1");

--L5M1
Game.AddPurchaseCarReward( "simpson", "zmale1", "npd", "L5M1CS_npcspawn", 1.3, "L5M1CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale1", "L5M1CS_npcwalk");

--L5M2
Game.AddPurchaseCarReward( "simpson", "zmale3", "npd", "L5M2CS_npcspawn", 1.3, "L5M2CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale3", "L5M2CS_npcwalk");

--L5M4
Game.AddPurchaseCarReward( "simpson", "zmale4", "npd", "L5M4CS_npcspawn", 1.3, "L5M4CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zmale4", "L5M4CS_npcwalk");

--L5M5 and 6
Game.AddPurchaseCarReward( "simpson", "zfem1", "npd", "L5M5CS_npcspawn", 1.3, "L5M5CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("zfem5", "L5M5CS_npcwalk");

--L5M7
Game.AddPurchaseCarReward( "simpson", "witch", "npd", "L5M7CS_npcspawn", 1.3, "L5M7CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("witch", "L5M7CS_npcwalk");

--ADDING TRAFFIC GROUP FOR LEVEL 05//
--
Game.CreateTrafficGroup( 0 );
	Game.AddTrafficModel( "sportsB",2 );
	Game.AddTrafficModel( "SUVA",1 );
	Game.AddTrafficModel( "ambul",1,1 );
	Game.AddTrafficModel( "votetruc",1,1 );
Game.CloseTrafficGroup( );

--
--ADDING PED GROUP FOR LEVEL 05//
--
--Z1
Game.CreatePedGroup( 0 );
Game.AddPed( "olady3", 1 );
Game.AddPed( "boy1", 2 );
Game.AddPed( "male5", 2 );
Game.AddPed( "hooker", 2 );
Game.ClosePedGroup( );

--R1
Game.CreatePedGroup( 1 );
Game.AddPed( "const1", 2 );
Game.AddPed( "const2", 2 );
Game.AddPed( "male3", 2 );
Game.AddPed( "fem2", 1 );
Game.ClosePedGroup( );

--Z2
Game.CreatePedGroup( 2 );
Game.AddPed( "sail2", 2 );
Game.AddPed( "mobstr", 2 );
Game.AddPed( "busm2", 1 );
Game.AddPed( "hooker", 2);
Game.ClosePedGroup( );

--R2
Game.CreatePedGroup( 3 );
Game.AddPed( "sail3", 2 );
Game.AddPed( "bum", 2 );
Game.AddPed( "rednk1", 1 );
Game.AddPed( "const2", 2 );
Game.ClosePedGroup( );

--Z3
Game.CreatePedGroup( 4 );
Game.AddPed( "busm1", 1 );
Game.AddPed( "busw1", 2 );
Game.AddPed( "male6", 2 );
Game.AddPed( "bum", 2 );

Game.ClosePedGroup( );

--Z4
Game.CreatePedGroup( 5 );
Game.AddPed( "male2", 1 );
Game.AddPed( "busw1", 2 );
Game.AddPed( "busm2", 2 );
Game.AddPed( "fem3", 2 );
Game.ClosePedGroup( );

--R4
Game.CreatePedGroup( 6 );
Game.AddPed( "busm1", 1 );
Game.AddPed( "busw1", 2 );
Game.AddPed( "fem2", 2 );
Game.AddPed( "joger2", 2 );
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

-- WASPS ///

Game.PreallocateActors( "beecamera", "2" );
Game.SetProjectileStats( "waspray", "80.0", "6" );

-- Create a new spawn point called "catapult spawn point"
-- When within a certain radius, specified by the 4th number, it will retrieve the stateprop
-- called "beecamera" from memory and create a new instance of it named "Shelly" This prop
-- will be positioned at (xyz) location specified by the first 3 numbers
-- Final value is unused at this point (eventually for timeout implementation)

--zone1
--AddSpawnPointByLocatorScript("w_jeb","beecamera","Shelley","w_jeb","2.0","30");
Game.AddSpawnPointByLocatorScript("w_roof","beecamera","Shelley","w_roof","10.0","-1");
Game.AddSpawnPointByLocatorScript("w_hospital","beecamera","Shelley","w_hospital","10.0","30");
Game.AddSpawnPointByLocatorScript("w_museum","beecamera","Shelley","w_museum","20.0","30");
--rail1
--AddSpawnPointByLocatorScript("w_jackass","beecamera","Shelley","w_jackass","10.0","50");
--AddSpawnPointByLocatorScript("w_firehall","beecamera","Shelley","w_firehall","10.0","50");
--zone2
--AddSpawnPointByLocatorScript("w_carwash","beecamera","Shelley","w_carwash","10.0","50");
--rail2
Game.AddSpawnPointByLocatorScript("w_railstair","beecamera","Shelley","w_railstair","10.0","30");
Game.AddSpawnPointByLocatorScript("w_rail2","beecamera","Shelley","w_rail2","10.0","20");
Game.AddSpawnPointByLocatorScript("w_rail3","beecamera","Shelley","w_rail3","10.0","20");
--zone3
--rail3
--AddSpawnPointByLocatorScript("w_matt1","beecamera","Shelley","w_matt1","10.0","50");
--AddSpawnPointByLocatorScript("w_matt2","beecamera","Shelley","w_matt2","10.0","50");
--AddSpawnPointByLocatorScript("w_matt3","beecamera","Shelley","w_matt3","10.0","50");
--zone4
Game.AddSpawnPointByLocatorScript("w_mono1","beecamera","Shelley","w_mono1","10.0","30");
Game.AddSpawnPointByLocatorScript("w_mono4","beecamera","Shelley","w_mono4","10.0","30");
Game.AddSpawnPointByLocatorScript("w_needle1","beecamera","Shelley","w_needle1","10.0","30");
Game.AddSpawnPointByLocatorScript("w_needle2","beecamera","Shelley","w_needle2","10.0","-1");

--rail4
Game.AddSpawnPointByLocatorScript("w_fountain","beecamera","Shelley","w_fountain","10.0","50");

-- They will evade between a certain distance in the horizontal, specified by the 1st 2 numbers
-- and will keep a height above the ground somewhere the 3rd and 4th numbers
-- The final number indicates the speed at which to evade (in KPH)
Game.AddBehaviour( "beecamera", "EVADE_PLAYER", "1.0", "5.0", "1.0", "2.0", "10" );

--First param - min distance ( go closer and attraction mode disabled)
--2nd param - max distance ( bee will attempt to move closer )
--3rd param - speed in KPH
Game.AddBehaviour( "beecamera", "ATTRACTION", "5","15","5.0");

-- Tell the wasp to attack the player. First number indicates maximum firing range in meters
-- 2nd number indicates forward firing arc in degrees
-- Both conditions have to be satisfied before the actor will fire
-- 3rd number is the number of second between wasp evasion attempts
Game.AddBehaviour( "beecamera", "ATTACK_PLAYER", "20.0", "3.0" , "3.0");

Game.SetActorRotationSpeed( "beecamera", "120.0" );
Game.AddShield( "beecamera", "beeshield" );

--STATIC wasps - these ones never move
--AddBehaviour( "static_bee", "ATTRACTION", "2.0","20","10.0");

--Zone 1
Game.AddSpawnPointByLocatorScript("w_townhall","beecamera","Shelley","w_townhall","20.0","-1");
Game.AddSpawnPointByLocatorScript("w_gazebo","beecamera","Shelley","w_gazebo","15.0","-1");
--Zone 2
Game.AddSpawnPointByLocatorScript("w_legitroof","beecamera","Shelley","w_legitroof","15.0","60");
Game.AddSpawnPointByLocatorScript("w_legitroof2","beecamera","Shelley","w_legitroof2","15.0","60");
Game.AddSpawnPointByLocatorScript("w_moesroof","beecamera","Shelley","w_moesroof","15.0","-1");
--Rail 2
Game.AddSpawnPointByLocatorScript("w_rail1","beecamera","Shelley","w_rail1","13.0","-1");
--Zone 3
--Zone 4
Game.AddSpawnPointByLocatorScript("w_police","beecamera","Shelley","w_police","10.0","-1");
Game.AddSpawnPointByLocatorScript("w_mono2","beecamera","Shelley","w_mono2","12.0","-1");
Game.AddSpawnPointByLocatorScript("w_mono3","beecamera","Shelley","w_mono3","12.0","-1");

Game.AddBehaviour( "w_townhall", "ATTACK_PLAYER", "15.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_townhall", "ATTRACTION", "2.0","20","-1");
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
Game.AddBehaviour( "w_police", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_police", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_mono2", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_mono2", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_mono3", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_mono3", "ATTRACTION", "2.0","20","-1");
