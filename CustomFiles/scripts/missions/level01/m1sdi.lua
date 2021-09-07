Game.SelectMission("m1sd");

Game.SetMissionStartCameraName( "mission6camShape" );
Game.SetMissionStartMulticontName( "mission6cam" );
Game.SetAnimatedCameraName( "mission6camShape" );
Game.SetAnimCamMulticontName( "mission6cam" );

Game.SetMissionResetPlayerOutCar("level1_homer_start", "level1_carstart");
Game.SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;");

Game.UsePedGroup( 0 );

	Game.AddStage(0);
		Game.SetMaxTraffic(2);
		Game.SetHUDIcon("simpsons");
		Game.SetStageMessageIndex(217);
		Game.AddObjective( "goto" );
			Game.AddNPC("marge", "m1_marge_sd");
			Game.SetDestination( "m2_simpsonhouse_sd", "carsphere");
			Game.SetCollectibleEffect("wrench_collect");
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(0);
		Game.RESET_TO_HERE();
		Game.SetStageMessageIndex(00);
		Game.SetHUDIcon("marage");
		Game.AddObjective("talkto","both");
			Game.AddNPC("marge", "m1_marge_sd");
			Game.AddObjectiveNPCWaypoint( "marge", "marge_walk_1" );
			Game.AddObjectiveNPCWaypoint( "marge", "marge_walk_2" );
			Game.SetTalkToTarget("marge", 0, 0.2);
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(1);
		Game.AddObjective("dialogue");
			Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_01.p3d" );
			Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
				Game.AmbientAnimationRandomize( 0, 0 );
			Game.SetConversationCam( 0, "npc_far" );
			Game.SetConversationCam( 1, "pc_near" );
			Game.SetConversationCam( 2, "npc_far" );
			Game.SetConversationCam( 3, "pc_near" );
			Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_thinking" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
			--SetConversationCamNpcName("npc_far");
			--SetConversationCamPcName("pc_far");
			Game.SetDialogueInfo("homer","marge","project",0);
			Game.SetCamBestSide("bestside_m1");
			Game.SetDialoguePositions("level1_homer_walkto","m1_marge_sd","level1_carstart");
		Game.CloseObjective();
	Game.CloseStage();

Game.CloseMission();
