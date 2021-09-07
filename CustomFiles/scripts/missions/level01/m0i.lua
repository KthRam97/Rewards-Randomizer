Game.SelectMission("m0");

Game.SetMissionResetPlayerInCar("level1_carstart");
Game.SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;");

Game.UsePedGroup( 0 );

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.RESET_TO_HERE();
	Game.SetHUDIcon( "kwike" );
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(131);
	Game.AddObjective("goto");
		Game.SetDestination("m0_kwickemart","carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.SetHUDIcon( "kwike" );
	Game.SetMaxTraffic(2);
	Game.SetStageMessageIndex(102);
	Game.AddObjective("interior","neither");
		Game.SetDestination("KwikEMart", "kwik_mission_doorstar"); -- use name of interiors entry locator
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(2);
	Game.SetHUDIcon( "apu" );
	Game.SetStageMessageIndex(157);
	Game.AddObjective("talkto","nearest road");
		Game.SetTalkToTarget("apu", 0, -0.3, "3.0"); -- 2 - door icon, "3.0" is the size of the NPC trigger area
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(15,"end");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetConversationCamNpcName("npc_far");
		Game.SetConversationCamPcName("pc_near");
		Game.SetDialogueInfo("homer","apu","congrats",0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.SetHUDIcon( "icecream" );
	Game.SetStageMessageIndex(152);
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m0_cola","icebuck");
	Game.CloseObjective();

	Game.SetCompletionDialog("congrats2","bart");
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
