Game.SelectMission("m1");

c_level = 7
c_mission = 1

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerOutCar("m1_homer_restart", "level7_carstart");
--SetDynaLoadData("l7z1.p3d;l7r1.p3d;l7r7.p3d;l7i02.p3d@", "SimpsonsHouse");
Game.SetDynaLoadData("l7z1.p3d;l7r1.p3d;l7r7.p3d;");

Game.UsePedGroup(0);

Game.AddStage(1);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(3);
	Game.SetHUDIcon( "ned" );
	Game.SetMaxTraffic(3);
	Game.SetStageMusicAlwaysOn();
	Game.AddObjective("talkto");
		Game.AddNPC("ned","m1_ned");
		Game.AddObjectiveNPCWaypoint( "ned", "m1_ned_walk1" );
		Game.AddObjectiveNPCWaypoint( "ned", "m1_ned_walk2" );
		Game.AddObjectiveNPCWaypoint( "ned", "m1_ned_walk3" );
		Game.AddObjectiveNPCWaypoint( "ned", "m1_ned_walk2" );
		Game.AddObjectiveNPCWaypoint( "ned", "m1_ned_walk1" );
		Game.SetTalkToTarget("ned", 0, 0); -- 0 - eclamation, 1 is gift, with optional hieight offset
	Game.CloseObjective();
	Game.SetStageTime(30);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(2);
	Game.AddStageTime(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m1_bestside2" );
		Game.SetDialogueInfo("homer","ned","firstaid",0);
		Game.SetDialoguePositions("m1_ned_walk1","m1_ned","m1_moe_walk2");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(108);
	Game.SetHUDIcon( "firstaid" );
	Game.AddObjective( "goto" );
		Game.TurnGotoDialogOff();
		Game.SetDestination("m1_firstaid", "medkit");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.SetCompletionDialog("boards");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(215);
	Game.SetHUDIcon( "cletushs" );
	Game.AddObjective( "goto" );
		Game.SetDestination( "m1_cletushouse", "wplanks");
		--SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(15);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(107);
	Game.SetHUDIcon( "boards" );
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m1_object","wplanks");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.ShowStageComplete();
	Game.SetCompletionDialog("boards2","cletus");
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(214);
	Game.SetHUDIcon( "moehouse" );
	Game.AddObjective( "goto" );
		Game.AddNPC("moe","m1_moe");
		Game.SetDestination( "m1_moeshouse", "carsphere" );
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(15);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(1);
	Game.SetStageMessageIndex(83);
	Game.SetHUDIcon( "moe" );
	Game.SetStageMusicAlwaysOn();
	Game.AddObjective("talkto");
		Game.AddNPC("moe","m1_moe");
		Game.AddObjectiveNPCWaypoint( "moe", "m1_moe_walk1" );
		Game.AddObjectiveNPCWaypoint( "moe", "m1_moe_walk2" );
		Game.AddObjectiveNPCWaypoint( "moe", "m1_moe_walk1" );
		Game.SetTalkToTarget("moe", 0, 0); -- 0 - eclamation, 1 is gift, with optional hieight offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddStageTime(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m1_bestside3" );
		Game.SetDialogueInfo("homer","moe","chainsaw",0);
		Game.SetDialoguePositions("m1_homertalk","m1_moe","m1_moe_walk2");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(216);
	Game.SetHUDIcon( "chainsaw" );
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m1_chainsaw","saw");
	Game.CloseObjective();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(1);
	Game.SetStageMessageIndex(217);
	Game.SetHUDIcon( "simpsons" );
	Game.AddObjective("goto");
		Game.SetDestination( "m1_simpsonshouse", "carsphere" );
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(40);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("timer");
		Game.SetDurationTime(0.5);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
