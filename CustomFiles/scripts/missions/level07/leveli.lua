--This is all level initialization stuff..
--Anything here is persistent across the entire level.
Game.EnableTutorialMode( false );
dcar = level_rewards[7][7];
Game.InitLevelPlayerVehicle(dcar,"level7_carstart","DEFAULT");
--SetPostLevelFMV("fmv7.rmv");

Game.PreallocateActors( "spaceship", "1" );
Game.AddFlyingActorByLocator("spaceship","Planet Express Ship","l7_spaceship","NEVER_DESPAWN");
Game.AddBehaviour( "Planet Express Ship", "UFO_BEAM_ALWAYS_ON", "UfoBeam" );

Game.CreateChaseManager("cHears","Pursuit\\L7cop.con",1);
Game.SetHitAndRunDecay(1.0);
Game.SetNumChaseCars("2");

Game.AddCharacter("homer","homer");

Game.AddNPCCharacterBonusMission("zmale3", "npd", "sr1_mhouse_sd", "sr1", "checkered", "intro", 0, "checkeredfinish" ); --switch to zombie
	Game.SetBonusMissionDialoguePos( "sr1", "sr1_homer_sd", "sr1_mhouse_sd", "bm_carstart");

Game.AddNPCCharacterBonusMission("zfem1", "npd", "sr2_nelson_sd", "sr2", "checkered", "intro", 0, "checkeredfinish" );  --switch to zombie
	Game.SetBonusMissionDialoguePos( "sr2", "sr2_homer_sd", "sr2_nelson_sd", "bm_carstart");

Game.AddNPCCharacterBonusMission("zmale1", "npd", "sr3_ralph_sd", "sr3", "checkered", "intro", 0, "checkeredfinish" ); --switch to zombie
	Game.SetBonusMissionDialoguePos( "sr3", "sr3_homer_sd", "sr3_ralph_sd", "m4_carstart");

Game.AddNPCCharacterBonusMission("louie", "npd", "sr4_louie_sd", "gr1", "dice", "intro", 0 );

Game.ClearAmbientAnimations( "sr1" );
Game.ClearAmbientAnimations( "sr2" );
Game.ClearAmbientAnimations( "sr3" );
Game.ClearAmbientAnimations( "bm1" );

--BONUS MISSION CHARACTER

	Game.AddNPCCharacterBonusMission("smithers", "npd", "bm1_smithers_sd", "bm1", "exclamation", "errands", 1, "exclamation_shadow" );
	Game.SetBonusMissionDialoguePos( "bm1", "bm_homer_loc", "bm1_smithers_sd", "bm_carstart");

	Game.SetConversationCam( 0, "pc_near",                        	"bm1" );
	Game.SetConversationCam( 1, "npc_far",                        	"bm1" );
	Game.SetConversationCam( 2, "pc_far",                        	"bm1" );

	Game.AddAmbientNpcAnimation( "dialogue_no", 				"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air",		"bm1" );
	Game.AddAmbientNpcAnimation( "dialogue_hands_on_hips",   		"bm1" );

	Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture",	"bm1" );
	Game.AddAmbientPcAnimation( "dialogue_thinking",			"bm1" );
	Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air",		"bm1" );

	Game.SetCamBestSide("bm1_bestside",					"bm1" );
	Game.AddBonusMissionNPCWaypoint( "smithers", "bm1_smithers_walk1" );
	Game.AddBonusMissionNPCWaypoint( "smithers", "bm1_smithers_walk2" );
	Game.AddBonusMissionNPCWaypoint( "smithers", "bm1_smithers_walk1" );

--ADDING PURCHASE POINTS FOR VEHICLES AND SKINS
--
Game.AddPurchaseCarReward( "gil", "gil", "npd", "gil_loc", 1.3, "gil_car" );
Game.AddPurchaseCarNPCWaypoint("gil", "gil_walk1");
Game.AddPurchaseCarReward( "simpson", "zmale1", "npd", "zmale1_loc", 1.3, "zmale1_car" );
Game.AddPurchaseCarNPCWaypoint("zmale1", "zmale1_walk1");

--L7M1
Game.AddPurchaseCarReward( "simpson", "hibbert", "npd", "L7M1CS_npcspawn", 1.3, "L7M1CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("hibbert", "L7M1CS_npcwalk");

--L7M2, 6 and 7
Game.AddPurchaseCarReward( "simpson", "willie", "npd", "L7M2CS_npcspawn", 1.3, "L7M2CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("willie", "L7M2CS_npcwalk");

--L7M3
Game.AddPurchaseCarReward( "simpson", "captain", "npd", "L7M3CS_npcspawn", 1.3, "L7M3CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("captain", "L7M3CS_npcwalk");

--L7M4
Game.AddPurchaseCarReward( "simpson", "milhouse", "npd", "L7M4CS_npcspawn", 1.3, "L7M4CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("milhouse", "L7M4CS_npcwalk");

--L7M5 initialise Krusty to appear in 7-5
krusty = 0

--ADDING TRAFFIC GROUP FOR LEVEL 07//
--
	Game.CreateTrafficGroup( 0 );
		Game.AddTrafficModel( "coffin",2 );
		Game.AddTrafficModel( "hallo",1 );
		Game.AddTrafficModel( "ship",1,1 );
		Game.AddTrafficModel( "witchcar",1,1 );
	Game.CloseTrafficGroup( );


--ADDING AMBIENT CHARACTERS
--
	Game.AddAmbientCharacter("apu", "ambient_apu",  1.8);  --Kwik-E-Mart Interior

	Game.AddAmbientCharacter("wiggum", "ambient_wiggum",  0); --zone 1
		Game.AddAmbientNPCWaypoint( "wiggum", "ambient_wiggum" );
		Game.AddAmbientNPCWaypoint( "wiggum", "wiggum_walk1" );
		Game.AddAmbientNPCWaypoint( "wiggum", "wiggum_walk2" );
		Game.AddAmbientNPCWaypoint( "wiggum", "wiggum_walk1" );
		Game.AddAmbientNPCWaypoint( "wiggum", "ambient_wiggum" );

	Game.AddAmbientCharacter("beeman", "ambient_beeman",  0); --rail 1
		Game.AddAmbientNPCWaypoint( "beeman", "ambient_beeman" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk1" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk2" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk3" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk4" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk3" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk2" );
		Game.AddAmbientNPCWaypoint( "beeman", "beeman_walk1" );
		Game.AddAmbientNPCWaypoint( "beeman", "ambient_beeman" );

	Game.AddAmbientCharacter("teen", "ambient_svt",  1.3); --rail 2
		Game.AddAmbientNPCWaypoint( "teen", "ambient_svt" );
		Game.AddAmbientNPCWaypoint( "teen", "svt_walk1" );
		Game.AddAmbientNPCWaypoint( "teen", "svt_walk2" );
		Game.AddAmbientNPCWaypoint( "teen", "svt_walk3" );
		Game.AddAmbientNPCWaypoint( "teen", "svt_walk2" );
		Game.AddAmbientNPCWaypoint( "teen", "svt_walk1" );
		Game.AddAmbientNPCWaypoint( "teen", "ambient_svt" );

	Game.AddAmbientCharacter("skinner", "ambient_skinner",  1.3); --zone 3
		Game.AddAmbientNPCWaypoint( "skinner", "ambient_skinner" );
		Game.AddAmbientNPCWaypoint( "skinner", "skinner_walk1" );
		Game.AddAmbientNPCWaypoint( "skinner", "skinner_walk2" );
		Game.AddAmbientNPCWaypoint( "skinner", "skinner_walk3" );
		Game.AddAmbientNPCWaypoint( "skinner", "skinner_walk2" );
		Game.AddAmbientNPCWaypoint( "skinner", "skinner_walk1" );
		Game.AddAmbientNPCWaypoint( "skinner", "ambient_skinner" );

	Game.AddAmbientCharacter("cletus", "ambient_cletus",  0); --rail 6
		Game.AddAmbientNPCWaypoint( "cletus", "ambient_cletus" );
		Game.AddAmbientNPCWaypoint( "cletus", "cletus_walk1" );
		Game.AddAmbientNPCWaypoint( "cletus", "ambient_cletus" );

	Game.AddAmbientCharacter("carl", "ambient_carl",  0); --rail 7
		Game.AddAmbientNPCWaypoint( "carl", "ambient_carl" );
		Game.AddAmbientNPCWaypoint( "carl", "carl_walk1" );
		Game.AddAmbientNPCWaypoint( "carl", "carl_walk2" );
		Game.AddAmbientNPCWaypoint( "carl", "carl_walk1" );
		Game.AddAmbientNPCWaypoint( "carl", "ambient_carl" );

--ADDING OED GROUP FOR LEVEL 07//
--
--z1r1
Game.CreatePedGroup( 0 );
Game.AddPed( "zfem1", 3 );
Game.AddPed( "zmale1", 2 );
Game.AddPed( "zmale4", 2 );
Game.ClosePedGroup( );

--z2
Game.CreatePedGroup( 1 );
Game.AddPed( "zfem1", 2 );
Game.AddPed( "zmale4", 3 );
Game.AddPed( "witch", 2 );
Game.ClosePedGroup( );

--R2
Game.CreatePedGroup( 2 );
Game.AddPed( "zfem1", 2 );
Game.AddPed( "zmale1", 2 );
Game.AddPed( "witch", 3 );
Game.ClosePedGroup( );

--Z3
Game.CreatePedGroup( 3 );
Game.AddPed( "zfem1", 3 );
Game.AddPed( "zmale1", 2 );
Game.AddPed( "witch", 2 );
Game.ClosePedGroup( );

--R3Z4
Game.CreatePedGroup( 4 );
Game.AddPed( "zfem1", 2 );
Game.AddPed( "zmale1", 3 );
Game.AddPed( "witch", 2 );
Game.ClosePedGroup( );

--R6Z7
Game.CreatePedGroup( 5 );
Game.AddPed( "zfem1", 2 );
Game.AddPed( "zmale3", 2 );
Game.AddPed( "zfem5", 3 );
Game.ClosePedGroup( );

--R7
Game.CreatePedGroup( 6 );
Game.AddPed( "zfem5", 3 );
Game.AddPed( "zmale3", 2 );
Game.AddPed( "witch", 2 );
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
Game.SetProjectileStats( "waspray", "90.0", "10" );


--AddSpawnPoint( "SimpsonsHouse", "beecamera", "Shelly","222.041","4.5","-169.169","50.0","20" );

Game.AddSpawnPointByLocatorScript("w_lemon","beecamera","Shelley","w_lemon","15.0","20");

Game.AddSpawnPointByLocatorScript("w_krustyRC","beecamera","Shelley","w_krustyRC","15.0","20");
Game.AddSpawnPointByLocatorScript("w_lardlads","beecamera","Shelley","w_lardlads","15.0","20");

Game.AddSpawnPointByLocatorScript("w_playground","beecamera","Shelley","w_playground","15.0","20");
Game.AddSpawnPointByLocatorScript("w_schoolroof1","beecamera","Shelley","w_schoolroof1","15.0","20");
Game.AddSpawnPointByLocatorScript("w_schoolroof2","beecamera","Shelley","w_schoolroof2","15.0","20");
Game.AddSpawnPointByLocatorScript("w_schoolroof3","beecamera","Shelley","w_schoolroof3","15.0","20");

Game.AddSpawnPointByLocatorScript("w_blockade","beecamera","Shelley","w_blockade","15.0","20");

Game.AddSpawnPointByLocatorScript("w_barn","beecamera","Shelley","w_barn","5.0","20");


Game.AddSpawnPointByLocatorScript("w_plantlot2","beecamera","Shelley","w_plantlot2","30.0","20");

-- They will evade between a certain distance in the horizontal, specified by the 1st 2 numbers
-- and will keep a height above the ground somewhere the 3rd and 4th numbers
-- The final number indicates the speed at which to evade (in KPH)
Game.AddBehaviour( "beecamera", "EVADE_PLAYER", "1.0", "3.5", "1.0", "2.0", "30" );

--First param - min distance ( go closer and attraction mode disabled)
--2nd param - max distance ( bee will attempt to move closer )
--3rd param - speed in KPH
Game.AddBehaviour( "beecamera", "ATTRACTION", "2.0","10","10.0");

-- Tell the wasp to attack the player. First number indicates maximum firing range in meters
-- 2nd number indicates forward firing arc in degrees
-- Both conditions have to be satisfied before the actor will fire
-- 3rd number is the number of second between wasp evasion attempts
Game.AddBehaviour( "beecamera", "ATTACK_PLAYER", "15.0", "3.0" , "1.0");

Game.SetActorRotationSpeed( "beecamera", "160.0" );
Game.AddShield( "beecamera", "beeshield" );

--STATIC wasps - these ones never move
--AddBehaviour( "static_bee", "ATTRACTION", "2.0","20","10.0");

--Zone 1

Game.AddSpawnPointByLocatorScript("w_simpsons","beecamera","Shelley","w_simpsons","20.0","60");
Game.AddSpawnPointByLocatorScript("w_simpsons2","beecamera","Shelley","w_simpsons2","15.0","20");
Game.AddSpawnPointByLocatorScript("w_flanders","beecamera","Shelley","w_flanders","8.0","60");
Game.AddSpawnPointByLocatorScript("w_wiggum","beecamera","Shelley","w_wiggum","20.0","60");

--Zone 2

Game.AddSpawnPointByLocatorScript("w_kwickemart","beecamera","Shelley","w_kwickemart","5.0","60");
Game.AddSpawnPointByLocatorScript("w_gasroof","beecamera","Shelley","w_gasroof","5.0","20");

--Zone 3

--Zone 4

--Zone 5
Game.AddSpawnPointByLocatorScript("w_bridge1","beecamera","Shelley","w_bridge1","30.0","20");
--Zone 6

Game.AddSpawnPointByLocatorScript("w_plantlot","beecamera","Shelley","w_plantlot","30.0","20");

--Zone 7

Game.AddSpawnPointByLocatorScript("w_trailor1","beecamera","Shelley","w_trailor1","50.0","20");
Game.AddSpawnPointByLocatorScript("w_trailor2","beecamera","Shelley","w_trailor2","50.0","20");

Game.AddBehaviour( "w_simpsons", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_simpsons2", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_flanders", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_wiggum", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_kwickemart", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_gasroof", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_bridge1", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_trailor1", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_trailor2", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
Game.AddBehaviour( "w_plantlot", "ATTACK_PLAYER", "10.0", "5.0" , "-1.0");
--AddBehaviour( "static_bee2", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");
--AddBehaviour( "static_bee3", "ATTACK_PLAYER", "20.0", "5.0" , "-1.0");

Game.AddBehaviour( "w_simpsons", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_simpsons2", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_flanders", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_wiggum", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_kwickemart", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_gasroof", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_bridge1", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_trailor1", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_trailor2", "ATTRACTION", "2.0","20","-1");
Game.AddBehaviour( "w_plantlot", "ATTRACTION", "2.0","20","-1");
