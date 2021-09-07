Game.SelectMission("bm1");

c_level = 2
c_mission = 11

Game.SetMissionResetPlayerInCar("bm1_carstart");
Game.SetDynaLoadData("l2z3.p3d;l2r2.p3d;l2r3.p3d;");

Game.UsePedGroup(4);
Game.AddStage(3);
	Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_08.p3d" );
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(114);
	Game.SetHUDIcon( "blood" );
	Game.SetStageTime(30);
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("bm1_blood_locator","bloodbag");
	Game.CloseObjective();
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.SetCompletionDialog("vampire");
Game.CloseStage();

Game.AddStage(0);
	Game.AddStageTime(20);
	Game.SetStageMessageIndex(165);
	Game.SetHUDIcon( "moes" );
	Game.AddObjective("goto");
		Game.SetDestination("bm_moes", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AddSafeZone("bm2_moes_door", 30);
	Game.CloseObjective();
	Game.AddCondition("timeout");
	Game.CloseCondition();
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
		Game.AddNPC("moe","bm2_moe", moe1);
		Game.SetTalkToTarget("moe", 0, 0, "2.0"); -- 0 - eclamation, 1 is gift, with optional height offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddStageTime(0);
	Game.AddObjective("dialogue");
		Game.SetDialogueInfo("bart","moe","goat",0);
		--AmbientAnimationRandomize( 1, 0 );      // ( pc=0, npc=1) (nonrandom=0, random=1)
		--AmbientAnimationRandomize( 0, 0 );
		--AddAmbientNpcAnimation( "none" );
		--AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
		--AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture" );
		--AddAmbientPcAnimation( "dialogue_yes" );
		--SetConversationCam( 3, "pc_far" );
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.SetStageMessageIndex(143);
	Game.SetHUDIcon( "blood" );
	--AddStageTime(0);
	Game.ShowStageComplete();
	Game.AddObjective("goto");
		Game.SetDestination("bm1_blood_locator2","i_bldbag");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(171);
	Game.SetHUDIcon( "kburger" );
	Game.SetStageMusicAlwaysOn();
	Game.AddObjective("goto");
		Game.AddNPC("teen","bm2_svt");
		Game.SetDestination("bm_krustyburger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AddSafeZone("bm2_svt", 30);
	Game.CloseObjective();
	Game.SetStageTime(30);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(175);
	Game.SetHUDIcon( "svt" );
	Game.AddObjective("talkto");
		Game.AddNPC("teen","bm2_svt");
		Game.SetTalkToTarget("teen", 0, 0); -- 0 - eclamation, 1 is gift, with optional hieight offset
		Game.AddSafeZone("bm2_svt", 30);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddStageTime(0);
	Game.AddObjective("dialogue");
		Game.SetDialogueInfo("bart","teen","fries",0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(143);
	Game.SetHUDIcon( "blood" );
	Game.AddObjective("goto");
		Game.SetDestination("bm1_blood_locator3","bloodbag");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.SetStageMessageIndex(32);
	Game.SetHUDIcon( "grampa" );
	Game.AddObjective("goto");
		Game.SetDestination("bm_end", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(60);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.SetStageMusicAlwaysOn();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(29);
	Game.SetHUDIcon( "grampa" );
	Game.AddSafeZone("bm1_grampa_sd", 30);
	Game.SetStageMusicAlwaysOn();
	Game.AddObjective("talkto");
		--AddNPC("grandpa","bm1_grampa_sd"); // do not need this because we are calling grandpa
		Game.SetTalkToTarget("grandpa", 0, 0); -- 0 - eclamation, 1 is gift, with optional hieight offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddStageTime(0);
	Game.AddObjective("dialogue");
		Game.SetDialogueInfo("bart","grandpa","warm",0);
		Game.SetCamBestSide("bm1_bestside");
		Game.SetDialoguePositions("bm1_bart_talk","bm1_grampa_sd","bm1_carstart", 1);
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
