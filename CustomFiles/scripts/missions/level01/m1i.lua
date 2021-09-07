Game.SelectMission("m1");

c_level = 1
c_mission = 1



	Game.SetMissionResetPlayerOutCar("level1_homer_start","level1_carstart");
	Game.SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;");
	--SetAnimatedCameraName( "cameraShape1" );
	--SetAnimCamMulticontName( "MasterController" );

	Game.UsePedGroup( 0 );

	Game.AddStage(1);
		Game.RESET_TO_HERE();
		Game.SetStageMessageIndex(153);
		Game.SetHUDIcon( "digest" );
		Game.AddObjective("goto", "nearest road");
			Game.TurnGotoDialogOff();
			Game.SetDestination("m1_tomato","scien");
		Game.CloseObjective();
		Game.ShowStageComplete();
	Game.CloseStage();

	Game.AddStage(8);
		Game.SetStageMessageIndex(128);
		Game.SetHUDIcon( "school" );
		Game.SetMaxTraffic(2);
		Game.AddObjective("goto");
			Game.AddStageVehicle("skinn_v","m1_skinner_place","NULL","Missions\\level01\\M1race.con", "skinner");
			Game.SetDestination("m1_skinner_start", "carsphere");
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(18);
		Game.SetStageMessageIndex(47);
		Game.SetHUDIcon( "school" );
		Game.ActivateVehicle("skinn_v","NULL","race");
		Game.AddStageWaypoint( "m1_AI_path1" );
		Game.AddStageWaypoint( "m1_AI_path1b");
		Game.AddStageWaypoint( "m1_AI_path4" );
		Game.AddObjective( "race", "both" );
	--		AddCollectible("m1_AI_path1b");
			Game.AddCollectible("m1_AI_path4", "carsphere");
		Game.CloseObjective();
		Game.AddCondition("race");
			Game.SetCondTargetVehicle("skinn_v");
		Game.CloseCondition();
		Game.AddStageMusicChange();
		Game.ShowStageComplete();
	Game.CloseStage();

	Game.AddStage(1);
		Game.SetStageMessageIndex(1);
		Game.SetHUDIcon( "school" );
		Game.SetMaxTraffic(2);
		Game.SetStageMusicAlwaysOn();
		Game.AddObjective("interior", "nearest road");
			Game.SetDestination("SpringfieldElementary", "school_mission_doorstar");
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(1);
		Game.SetStageMessageIndex(156);
		Game.SetHUDIcon( "lisa" );
		Game.SetMaxTraffic(2);
		Game.SetStageMusicAlwaysOn();
		Game.AddObjective("talkto", "nearest road");
			Game.AddNPC("lisa","m1_lisa_place", SpringfieldElementary);
			Game.AddObjectiveNPCWaypoint( "lisa", "lisa_walk_1" );
			Game.AddObjectiveNPCWaypoint( "lisa", "lisa_walk_2" );
			Game.AddObjectiveNPCWaypoint( "lisa", "lisa_walk_1" );
			Game.SetTalkToTarget("lisa",0, -0.5);
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage("final");
		Game.AddObjective("dialogue");
			Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
			Game.AmbientAnimationRandomize( 0, 0 );
			Game.AddAmbientNpcAnimation( "dialogue_yes" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_hands_on_hips" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_yes" );
				Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_no" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
			Game.SetDialogueInfo("homer","lisa","bladder",0);
		Game.CloseObjective();

	Game.CloseStage();

	Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

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
