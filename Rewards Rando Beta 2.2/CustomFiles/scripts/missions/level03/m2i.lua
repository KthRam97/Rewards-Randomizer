Game.SelectMission("m2");

Game.SetMissionResetPlayerInCar("m2_carstart");
Game.SetDynaLoadData("l3z1.p3d;l3r1.p3d;l3r5.p3d;l3r5_dam.p3d;");

Game.UsePedGroup(0);

--AddStage(1);
--	RESET_TO_HERE();
--	SetStageMessageIndex(49);
--	SetHUDIcon( "wallewea" );
--	AddObjective("goto");
--		AddStageVehicle("cSedan","m2_sedanstart_1","NULL", "Pursuit\Easycop.con");
--		SetDestination("m2_sedan_1_trigger", "carsphere");
--		SetCollectibleEffect("wrench_collect");
--	CloseObjective();
--CloseStage();

--AddStage(0);
--	SetStageMessageIndex(178);
--	SetHUDIcon( "bsedan_v" );
--	AddObjective("losetail");
--		ActivateVehicle("cSedan","NULL","chase");
--		SetObjTargetVehicle("cSedan");
--		SetObjDistance(150);
--	CloseObjective();
--	SetStageTime(60);
--	AddCondition("timeout");
--	CloseCondition();
--	StageStartMusicEvent("M2_drama");
--CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.AddNPC("milhouse", "m2_milhouse_1");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(49);
	Game.SetHUDIcon( "wallewea" );
	Game.AddObjective("goto");
		Game.AddNPC("milhouse", "m2_milhouse_1");
		Game.SetDestination("m2_sedan_1_trigger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(20);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(163);
	Game.SetHUDIcon( "milhouse" );
	Game.AddObjective("talkto", "neither");
		Game.AddNPC("milhouse", "m2_milhouse_1");
		Game.AddObjectiveNPCWaypoint( "milhouse", "milhouse_walk_2" );
		Game.SetTalkToTarget("milhouse", 0, -0.5);
	Game.CloseObjective();
Game.CloseStage();



Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m2_bestside2" );
		Game.SetDialogueInfo("lisa","milhouse","weasel",0);
		Game.SetDialoguePositions("l3_lisa_loc2","m2_milhouse_1","m2_sedanstart_1");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();


--AddStage(1);
--	SetStageMessageIndex(186);
--	SetHUDIcon( "planethy" );
--	AddObjective("goto");
--		AddStageVehicle("cSedan","m2_sedanstart_2","NULL", "Pursuit\Easycop.con");
--		SetDestination("m2_sedan_2_trigger", "carsphere");
--		SetCollectibleEffect("wrench_collect");
--	CloseObjective();
--CloseStage();
--
--AddStage(0);
--	SetStageMessageIndex(178);
--	SetHUDIcon( "bsedan_v" );
--	AddObjective("losetail");
--		ActivateVehicle("cSedan","NULL","chase");
--		SetObjTargetVehicle("cSedan");
--		SetObjDistance(150);
--	CloseObjective();
--	SetStageTime(60);
--	AddCondition("timeout");
--	CloseCondition();
--CloseStage();

--AddStage(0);
--	AddObjective("goto");
--		SetDestination("mhouse_loc2");
--	CloseObjective();
--	SetStageTime(60);
--	AddCondition("timeout");
--	CloseCondition();
--CloseStage();

Game.AddStage(5);
	Game.SetStageMessageIndex(186);
	Game.SetHUDIcon( "planethy" );
	Game.AddObjective("goto");
		Game.AddNPC("milhouse", "m2_milhouse_2");
		Game.SetDestination("m2_sedan_2_trigger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(60);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(163);
	Game.SetHUDIcon( "milhouse" );
	Game.AddObjective("talkto", "neither");
		Game.AddNPC("milhouse", "m2_milhouse_2");
		Game.AddObjectiveNPCWaypoint( "milhouse", "milhouse_walk_3" );
		Game.SetTalkToTarget("milhouse", 0, -0.5);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.SetCamBestSide( "m2_bestside3" );
		Game.SetDialogueInfo("lisa","milhouse","store",0);
		Game.SetDialoguePositions("m2_lisa_loc3","m2_milhouse_2","m2_sedanstart_2");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

--AddStage(1);
--	SetStageMessageIndex(95);
--	SetHUDIcon( "spsign" );
--	AddObjective("goto");
--		AddStageVehicle("cSedan","m2_sedanstart_3","NULL", "Pursuit\Easycop.con");
--		SetDestination("m2_sedan_3_trigger", "carsphere");
--		SetCollectibleEffect("wrench_collect");
--	CloseObjective();
--CloseStage();
--
--AddStage(1);
--	SetStageMessageIndex(178);
--	SetHUDIcon( "bsedan_v" );
--	AddObjective("losetail");
--		ActivateVehicle("cSedan","NULL","chase");
--		SetObjTargetVehicle("cSedan");
--		SetObjDistance(150);
--	CloseObjective();
--	SetStageTime(60);
--	AddCondition("timeout");
--	CloseCondition();
--CloseStage();

--AddStage(0);
--	AddObjective("goto");
--		SetDestination("mil_loc3");
--	CloseObjective();
--	SetStageTime(60);
--	AddCondition("timeout");
--	CloseCondition();
--CloseStage();

Game.AddStage(5);
	Game.SetStageMessageIndex(95);
	Game.SetHUDIcon( "spsign" );
	Game.AddObjective("goto");
		Game.AddNPC("milhouse", "m2_milhouse_3");
		Game.SetDestination("m2_sedan_3_trigger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(60);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(5);
	Game.SetStageMessageIndex(163);
	Game.SetHUDIcon( "milhouse" );
	Game.AddObjective("talkto", "neither");
		Game.AddNPC("milhouse", "m2_milhouse_3");
		Game.AddObjectiveNPCWaypoint( "milhouse", "milhouse_walk_4" );
		Game.SetTalkToTarget("milhouse", 0, -0.5);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.SetConversationCam( 4, "npc_far" );
		Game.SetConversationCam( 5, "pc_far" );
		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.SetCamBestSide( "m2_bestside4" );
		Game.SetDialogueInfo("lisa","milhouse","sign",0);
		Game.SetDialoguePositions("m2_lisa_loc4","m2_milhouse_3","m2_sedanstart_2",1);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

c_level = 3
c_mission = 2

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
