Game.SelectMission("m6");

c_level = 2
c_mission = 6

Game.SetMissionResetPlayerInCar("m6_carstart");
Game.SetDynaLoadData("l2r1.p3d;l2z1.p3d;l2r4.p3d;");
Game.SetNumValidFailureHints(5);

Game.UsePedGroup(6);

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(173);
	Game.SetHUDIcon( "scream" );
	Game.AddObjective("goto");
		Game.AddNPC("nriviera", "m6_drnick");
		Game.SetDestination("screaming_monkey", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(63);
	Game.SetMaxTraffic(4);
	Game.SetHUDIcon( "monkey" );
	Game.SetStageTime(240);
	Game.AddObjective("delivery", "neither");
		Game.AddCollectible("m6_monkey_6","monkey");
		Game.AddCollectible("m6_monkey_5","monkey");
		Game.AddCollectible("m6_monkey_3","monkey");
		Game.AddCollectible("m6_monkey_4","monkey");
		Game.AddCollectible("m6_monkey_2","monkey");
		Game.AddCollectible("m6_monkey_8","monkey");
		Game.AddCollectible("m6_monkey_7","monkey");
		Game.AddCollectible("m6_monkey_10","monkey");
		Game.AddCollectible("m6_monkey_9","monkey");
		Game.AddCollectible("m6_monkey_11","monkey");
		Game.AddCollectible("m6_monkey_12","monkey");
		Game.AddCollectible("m6_monkey_13","monkey");
		Game.AddCollectible("m6_monkey_14","monkey");
		Game.AddCollectible("m6_monkey_15","monkey");
		Game.AddCollectible("m6_monkey_17","monkey");
		Game.AddCollectible("m6_monkey_16","monkey");
		Game.AddCollectible("m6_monkey_18","monkey");
		Game.AddCollectible("m6_monkey_21","monkey");
		Game.AddCollectible("m6_monkey_19","monkey");
		Game.AddCollectible("m6_monkey_22","monkey");
		Game.AddCollectible("m6_monkey_25","monkey");
		Game.AddCollectible("m6_monkey_24","monkey");
		Game.AddCollectible("m6_monkey_23","monkey");
		Game.AddCollectible("m6_monkey_20","monkey");
		Game.AddCollectible("m6_monkey_1","monkey");
		Game.AddCollectible("m6_monkey_26","monkey");
		Game.AddCollectible("m6_monkey_27","monkey");
		Game.AddCollectible("m6_monkey_28","monkey");
		Game.AddCollectible("m6_monkey_29","monkey");
		Game.AddCollectible("m6_monkey_30","monkey");
		--SetCollectibleEffect("bonestorm_explosion");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(173);
	Game.SetHUDIcon( "scream" );
	Game.AddObjective("goto");
		Game.AddNPC("nriviera", "m6_drnick");
		Game.SetDestination("screaming_monkey", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(4);
	Game.SetStageMessageIndex(62);
	Game.SetHUDIcon( "drnick" );
	Game.AddObjective("talkto", "neither");
		Game.AddNPC("nriviera", "m6_drnick");
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick_walk1" );
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick_walk2" );
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick_walk3" );
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick" );
		Game.SetTalkToTarget("nriviera", 0, 0);
	Game.CloseObjective();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.AddStageMusicChange();
	Game.SetStageMusicAlwaysOn();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetCamBestSide( "m6_bestside" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );

		Game.SetConversationCam( 0, "npc_far" );

		Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );

		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );

		Game.SetDialogueInfo("bart","nriviera","electrode",0);
		Game.SetDialoguePositions("m6_bart_talk","m6_drnick_walk2","m6_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.SetHUDIcon( "blender");
	Game.SetStageMessageIndex(174);
	Game.AddObjective("goto","neither");
		Game.AddNPC("nriviera", "m6_drnick");
		Game.SetDestination("m6_blender","blend");
	Game.CloseObjective();
Game.CloseStage();

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
--SetConversationCam( 3, "pc_far" );
