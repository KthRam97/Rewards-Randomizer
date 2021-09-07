Game.SelectMission("m0sd");

Game.SetMissionResetPlayerOutCar("level1_homer_start", "level1_carstart");
Game.SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;");

Game.UsePedGroup( 0 );

Game.SetMissionStartCameraName( "mission0camShape" );
Game.SetMissionStartMulticontName( "mission0cam" );
Game.SetMissionStartCameraName( "mission0camShape" );
Game.SetMissionStartMulticontName( "mission0cam" );

Game.SetInitialWalk("level1_homer_walkto");

Game.AddStage(0);
	Game.SetMaxTraffic(2);
	Game.SetHUDIcon("marage");
	Game.SetStageMessageIndex(00);
	Game.AddObjective("talkto","neither");
		Game.AddNPC("marge", "m1_marge_sd");
		Game.AddObjectiveNPCWaypoint( "marge", "marge_walk_1" );
		Game.SetTalkToTarget("marge", 0, 0.2);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_00.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_near" );
		Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetCamBestSide("bestside_m0");
		--SetConversationCamNpcName("npc_far");
		--SetConversationCamPcName("pc_far");
		Game.SetDialogueInfo("homer","marge","icecream",0);
		Game.SetDialoguePositions("level1_homer_walkto","m1_marge_sd","level1_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

--dialogue_hands_in_air
--dialogue_hands_on_hips
--dialogue_scratch_head
--dialogue_shaking_fist
--dialogue_thinking
--dialogue_yes
--dialogue_no
--dialogue_cross_arms
--dialogue_open_arm_hand_gesture
--dialogue_shake_hand_in_air
