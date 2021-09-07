Game.SelectMission("m1");

c_level = 2
c_mission = 1

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerOutCar("m1_bartstart2","level2_carstart");
Game.SetDynaLoadData("l2z1.p3d;l2r1.p3d;l2r4.p3d;");

Game.UsePedGroup(0);
Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		--AddStageVehicle("skinn_v","m1_skinn_carstart1","NULL", "Missions\level02\M1Chase.con", "skinner");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
	--SetCompletionDialog("charlie","skinner");
Game.CloseStage();

Game.AddStage(1);
	Game.SetMaxTraffic(2);
	Game.SetHUDIcon( "trynsave" );
	Game.SetStageMessageIndex(50);
	Game.AddObjective("goto", "both");
		Game.TurnGotoDialogOff();
		Game.AddStageVehicle("skinn_v","m1_skinn_carstart1","NULL", "Missions\\level02\\M1Chase.con", "skinner");
		Game.SetDestination("skinner_spawn", "carsphere");
	Game.CloseObjective();
	Game.SetStageTime(60);
	Game.AddCondition("timeout");
			--SetHitNRun();
	Game.CloseCondition();
	Game.SetCompletionDialog("charlie","skinner");
Game.CloseStage();

Game.AddStage(1);
	Game.ShowStageComplete();
	Game.SetHUDIcon( "skinn_v" );
	Game.SetStageMessageIndex(51);
	Game.SetStageTime(90);
	Game.ActivateVehicle("skinn_v","NULL","chase");
	Game.AddObjective("losetail");
		Game.AddNPC("jimbo","m1_jimbo_trynsave");
		Game.SetObjTargetVehicle("skinn_v");
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.SetCompletionDialog("gator");
Game.CloseStage();

Game.AddStage(2);
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(50);
	Game.SetHUDIcon( "trynsave" );
	Game.AddObjective("goto", "both");
		Game.AddNPC("jimbo","m1_jimbo_trynsave");
		Game.SetDestination("m1_try_n_save", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(60);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(3);
	Game.SetMaxTraffic(5);
	Game.SetHUDIcon( "jimbo" );
	Game.SetStageMessageIndex(149);
	Game.SetStageMusicAlwaysOn();
	Game.AddObjective("talkto");
		Game.AddNPC("jimbo","m1_jimbo_trynsave");
		Game.AddObjectiveNPCWaypoint( "jimbo", "m1_jimbo_walk1" );
		Game.AddObjectiveNPCWaypoint( "jimbo", "m1_jimbo_walk2" );
		Game.AddObjectiveNPCWaypoint( "jimbo", "m1_jimbo_walk3" );
		Game.SetTalkToTarget("jimbo", 0, -0.5); -- 0 - eclamation, 1 is gift, with optional hieight offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.SetCamBestSide("m1_bestside2");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_near" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		--AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.SetCamBestSide("m1_bestside2");
		Game.SetDialogueInfo("bart","jimbo","finger",0);
		Game.SetDialoguePositions("m1_jimbo_trynsave","m1_jimbo_walk2","m1_jimbo_walk1",1);
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
