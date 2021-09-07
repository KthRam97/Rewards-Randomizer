Game.SelectMission("m2");

c_level = 1
c_mission = 2

--SetMissionResetPlayerOutCar("m2_homer_inside","level1_carstart");
--SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;l1i02.p3d@", "SimpsonsHouse");

Game.SetMissionResetPlayerInCar("m2_carstart");
Game.SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;");

Game.UsePedGroup( 0 );

Game.AddStage(0);
--	RESET_TO_HERE();
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(41);
	Game.SetHUDIcon( "tuxedo" );
	Game.AddObjective("goto","both");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m2_object1","tux");
	Game.CloseObjective();
	Game.SetStageTime(40);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage();
	Game.SetStageMessageIndex(42);
	Game.SetHUDIcon( "lawnmwr" );
	Game.AddObjective("goto","both");
		Game.TurnGotoDialogOff();
		Game.AddNPC("barney", "m2_barney");
		Game.SetDestination("m2_object2","mower");
	Game.CloseObjective();
	Game.AddStageTime(40);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.SetCompletionDialog("mower");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(43);
	Game.SetHUDIcon( "barne" );
	Game.AddObjective("talkto","both");
		Game.AddNPC("barney", "m2_barney");
		Game.AddObjectiveNPCWaypoint( "barney", "barney_walk1" );
		Game.SetTalkToTarget("barney", 0, 0);
	Game.CloseObjective();
	Game.AddStageTime(40);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m2_bestside_barn");
		Game.SetDialogueInfo("homer","barney","cooler",0);
		Game.SetDialoguePositions("m2_homer_barney","m2_barney","mission2_carstart");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(3);
	Game.SetStageMessageIndex(151);
	Game.SetHUDIcon( "cooler" );
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m2_cooler","coolr"); --change to cooler when it's ready
	Game.CloseObjective();
	Game.AddStageTime(40);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage();
	Game.SetStageMessageIndex(44);
	Game.SetHUDIcon( "lawnchr" );
	Game.AddObjective("goto","both");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m2_object4","lwnchair");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.SetCompletionDialog("picture");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage();
	Game.SetStageMessageIndex(45);
	Game.SetHUDIcon( "photo" );
	Game.AddObjective("goto","both");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m2_object6","flanpic");
	Game.CloseObjective();
	Game.AddStageTime(40);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.SetCompletionDialog("inhaler");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage();
	Game.SetStageMessageIndex(46);
	Game.SetHUDIcon( "inhaler" );
	Game.AddObjective("goto","both");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m2_object5","inhaler");
	Game.CloseObjective();
	Game.AddStageTime(40);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.SetCompletionDialog("return");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(251);
	Game.SetHUDIcon( "ned" );
	Game.AddObjective( "goto" );
		Game.AddNPC("ned", "m2_ned_sd");
		Game.SetDestination( "m2_nedhouse", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(40);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(4);
	Game.SetStageMessageIndex(4);
	Game.SetHUDIcon( "ned" );
	Game.AddObjective("talkto","both");
		Game.AddNPC("ned", "m2_ned_sd");
		Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_1" );
		Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_2" );
		Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_3" );
		Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_2" );
		Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_1" );
		Game.SetTalkToTarget("ned", 0, 0);
	Game.CloseObjective();
	Game.AddStageMusicChange();
	Game.SetStageMusicAlwaysOn();
Game.CloseStage();

Game.AddStage(0, "final");
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.SetCamBestSide("bestside_m2");
		Game.SetDialogueInfo("homer","ned","reward",0);
		Game.SetDialoguePositions("m2_homer_ned","m2_ned_sd","mission2_carstart",1);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

--DIALOGUE ANIMATION LIST
--
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
