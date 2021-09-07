Game.SelectMission("m3");

c_level = 2
c_mission = 3

Game.SetMissionResetPlayerInCar("m3_cbgcar_sd");
Game.SetDynaLoadData("l2z4.p3d;l2r3.p3d;l2r4.p3d;");
Game.InitLevelPlayerVehicle("comic_v","m3_cbgcar_sd","OTHER");
Game.SetNumValidFailureHints(5);

Game.UsePedGroup(5);

--This is a forced car mission
Game.SetForcedCar();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(106);
	Game.SetHUDIcon( "java" );
	Game.AddStageVehicle("cNerd","m3_AI_start","race","Missions\\level02\\M3race.con", "male2");

	Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1",  1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO",  400 ); -- duration time in milliseconds

--	SetStageAIRaceCatchupParams( "cNerd", 80 ); -- when we'll apply max catchup (speed up!)
	Game.SetStageAIRaceCatchupParams("cNerd", 80, 0.8, 1.5, 2.3);

	Game.AddStageWaypoint( "m3_AI_path4" );
	Game.AddObjective( "race", "both");
		Game.AddNPC("cbg", "m3_cbg_hide");
		Game.AddCollectible("m3_AI_path4","finish_line");
--		SetCollectibleEffect("finish_line_col");
	Game.CloseObjective();
	Game.AddCondition("race");
		Game.SetCondTargetVehicle("cNerd");
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "comic_v" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	--SetCompletionDialog("futile", "cbg");
	Game.SetFadeOut( 0.1 );
	Game.SwapInDefaultCar();
	Game.SetSwapDefaultCarLocator("level2_carstart");
	Game.SetSwapForcedCarLocator("m3_cbg_car_end");
	Game.SetSwapPlayerLocator("m3_bart_end");
Game.CloseStage();

--AddStage(0);
--	SetStageMessageIndex(54);
--	SetHUDIcon( "cbg" );
--	AddObjective("talkto");
--		AddNPC("cbg", "m3_cbg_end");
--		SetTalkToTarget("cbg", 0, 0);
--	CloseObjective();
--CloseStage();

Game.AddStage(1);
	Game.AddObjective("timer");
		Game.AddNPC("cbg", "m3_cbg_end");
--		AddStageCharacter ("bart", "m3_bart_end", "", "current", "level2_carstart");
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.AddNPC("cbg", "m3_cbg_end");

		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );

		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_far" );

		Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );

		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture" );

		Game.SetCamBestSide("m3_bestside");
		Game.SetDialogueInfo("bart","cbg","futile",0);
		Game.SetDialoguePositions("m3_bart_end","m3_cbg_end","level2_carstart",1);
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
