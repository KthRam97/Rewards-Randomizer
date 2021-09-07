Game.SelectMission("m5");

Game.SetMissionResetPlayerInCar("m5_wiggumcar_sd");
Game.SetDynaLoadData("l3r2.p3d;l3z2.p3d;l3z3.p3d;l3r1.p3d;");
Game.InitLevelPlayerVehicle("wiggu_v","m5_wiggumcar_sd","OTHER");

Game.SetNumValidFailureHints( 5 );

Game.UsePedGroup(3);

Game.SetForcedCar();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.DisableHitAndRun();
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(14);
	Game.SetHUDIcon( "sjail" );
	Game.AddStageVehicle("snake_v","m5_snake_carstart","evade","Missions\\level03\\M5dump.con", "snake" );
	--SetStageAIRaceCatchupParams("smith_v", 80, 0.5, 1.1, 1.7);
--SetStageAIRaceCatchupParams("snake_v", 80, 1.0, 1.3, 2.3);

Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds

	Game.AddStageWaypoint( "m5_AI_path_4" );
	Game.AddStageWaypoint( "m5_AI_path_7" );
	Game.AddStageWaypoint( "m5_AI_path_10" );
	Game.AddStageWaypoint( "m5_AI_path_16" );
	Game.AddObjective("dump", "neither");
		Game.AddNPC("wiggum", "m5_wiggum_hide");
		Game.SetObjTargetVehicle("snake_v");
		Game.AddCollectible("m5_collectible_1","jeans","jeans","wiggum");
		Game.AddCollectible("m5_collectible_2","molemanr","elderly","wiggum");
		Game.AddCollectible("m5_collectible_3","h_soda");
		Game.BindCollectibleTo(0, 0);
		Game.BindCollectibleTo(1, 1);
		Game.BindCollectibleTo(2, 2);
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0, 150);
		Game.SetCondTargetVehicle("snake_v");
	Game.CloseCondition();
	Game.AddCondition("race");
		Game.SetCondTargetVehicle("snake_v");
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "wiggu_v" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.DisableHitAndRun();
	Game.SetStageMessageIndex(187);
	Game.SetHUDIcon( "casino" );
	Game.AddObjective("goto");
		Game.SetDestination("m5_casino_sd", "carsphere");
		Game.TurnGotoDialogOff();
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "wiggu_v" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.SetStageTime(60);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.SetFadeOut( 1.0 );
	Game.SwapInDefaultCar();
	Game.SetSwapDefaultCarLocator("level3_carstart");
	Game.SetSwapForcedCarLocator("m5_wiggumcar_sd");
	Game.SetSwapPlayerLocator("m5_lisa_loc");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(1);
	Game.AddObjective("timer");
		Game.AddNPC("wiggum", "m5_wiggum_walk1_sd");
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();

--AddStage();
--	SetStageMessageIndex(104);
--	SetHUDIcon( "wiggum" );
--	AddObjective("dialogue");
--		//AddStageCharacter("lisa", "m5_lisa_start", "", "wiggu_v", "m5_wiggumcar_sd" );
--		AddNPC("wiggum", "m5_wiggum_sd");
--		AddObjectiveNPCWaypoint( "wiggum", "m5_wiggum_walk1_sd" );
--		AddObjectiveNPCWaypoint( "wiggum", "m5_wiggum_walk2_sd" );
--		SetCamBestSide("m5_bestside");
--		SetTalkToTarget("wiggum", 0, 0);
--	CloseObjective();
--CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.AddNPC("wiggum", "m5_wiggum_sd");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );

		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.SetConversationCam( 3, "pc_far" );

		Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );

		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );

		Game.SetDialogueInfo("lisa","wiggum","lowlife",0);
		Game.SetDialoguePositions("m5_lisa_loc","m5_wiggum_sd","level3_carstart",1);
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();

c_level = 3
c_mission = 5

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
