Game.SelectMission("m2");

c_level = 2
c_mission = 2

Game.SetMissionResetPlayerInCar("m2_carstart");
Game.SetDynaLoadData("l2z3.p3d;l2r2.p3d;l2r3.p3d;");

Game.UsePedGroup(4);

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
	Game.SetMusicState("Mission2", "Stage1");
Game.CloseStage();


Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(2);
	Game.SetHUDIcon( "moes" );
	Game.SetStageMessageIndex(165);
	--SetStageMusicAlwaysOn();
	Game.AddObjective("goto");
		Game.AddNPC("otto","m2_otto2");
		Game.SetDestination("moes", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(60);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(160);
	Game.SetHUDIcon( "otto" );
	Game.AddObjective("talkto");
		Game.AddNPC("otto","m2_otto2");
		Game.SetTalkToTarget("otto", 0, 0); -- 0 - eclamation, 1 is gift, with optional hieight offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetCamBestSide( "bestside_ottocam" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );

		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("bart","otto","frog",0);
		Game.SetDialoguePositions("m2_otto_bart","m2_otto2","level2_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.SetStageMessageIndex(166);
	Game.SetHUDIcon( "firework" );
	Game.AddObjective("goto");
		Game.SetDestination("m2_fireworks_locator2","firewrks");
	Game.CloseObjective();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(1);
	Game.SetHUDIcon( "moes" );
	Game.SetStageMessageIndex(52);
	Game.AddObjective("interior");
		Game.SetDestination("moe1", "moes_mission_doorstar"); -- use name of interiors entry locator
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon( "moe" );
	Game.SetStageMessageIndex(83);
	Game.AddObjective("talkto");
		Game.AddNPC("moe","m2_moes1", moe1);
		Game.SetTalkToTarget("moe", 0, 0, "2.0"); -- 0 - eclamation, 1 is gift, with optional height offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		--SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("bart","moe","minor",0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.SetHUDIcon( "firework" );
	Game.SetStageMessageIndex(166);
	Game.ShowStageComplete();
	Game.AddObjective("goto", "neither");
		Game.SetDestination("m2_fireworks_locator1","i_firewk");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(2);
	Game.SetStageMessageIndex(168);
	Game.SetHUDIcon( "townhall" );
	Game.SetStageMusicAlwaysOn();
	Game.AddObjective("goto");
		Game.AddNPC("snake","m2_snake3");
		Game.SetDestination("cityhall", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(40);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(60);
	Game.SetHUDIcon( "snake" );
	Game.AddObjective("talkto");
		Game.AddNPC("snake","m2_snake3");
		Game.SetTalkToTarget("snake", 0, 0); -- 0 - eclamation, 1 is gift, with optional hieight offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "snake_bestside" );
		Game.SetDialogueInfo("bart","snake","tijuana",0);
		Game.SetDialoguePositions("m2_snake_bart","m2_snake3","level2_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.SetStageMessageIndex(166);
	Game.SetHUDIcon( "firework" );
	Game.AddObjective("goto", "neither");
		Game.SetDestination("m2_fireworks_locator3","firewrks");
	Game.CloseObjective();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(169);
	Game.SetHUDIcon( "police" );
	Game.SetMaxTraffic(3);
	Game.SetStageMusicAlwaysOn();
	Game.AddObjective("goto", "both");
		Game.AddStageVehicle("wiggu_v","m2_wiggu_carstart","NULL", "Missions\\level02\\M2chase.con", "wiggum");
		Game.AddNPC("ralph","m2_ralph4");
		Game.SetDestination("police_station", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(45);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage();
	Game.SetStageMessageIndex(53);
	Game.SetHUDIcon( "ralph" );
	Game.AddObjective("talkto", "both");
		Game.AddNPC("ralph","m2_ralph4");
		Game.SetTalkToTarget("ralph", 0, -0.5); -- 0 - eclamation, 1 is gift, with optional height offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetCamBestSide( "m2_bestside_ralphcam" );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("bart","ralph","stash",0);
		Game.SetDialoguePositions("m2_ralph_bart","m2_ralph4","level2_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.SetStageMessageIndex(166);
	Game.SetHUDIcon( "firework" );
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m2_fireworks_locator4","firewrks");
	Game.CloseObjective();
	Game.ShowStageComplete();
	Game.SetCompletionDialog("life","wiggum");
Game.CloseStage();

Game.AddStage(4);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin","neither");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0, "final");
	Game.SetStageMessageIndex(40);
	Game.SetHUDIcon( "wiggu_v" );
	Game.SetMaxTraffic(2);
	Game.ActivateVehicle("wiggu_v","NULL","chase");
	Game.AddObjective("losetail","neither");
		Game.SetObjTargetVehicle("wiggu_v");
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.SetStageTime(90);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.SetCompletionDialog("fought");
	Game.SetMusicState("Mission2", "Stage2");

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
