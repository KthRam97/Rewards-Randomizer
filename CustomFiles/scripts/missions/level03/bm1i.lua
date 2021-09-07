Game.SelectMission("bm1");

Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_08.p3d" );
Game.SetMissionResetPlayerInCar("bm1_carstart");
Game.SetDynaLoadData("l3z1.p3d;l3r1.p3d;l3z2.p3d;l3r5.p3d;l3r5_dam.p3d;");
Game.InitLevelPlayerVehicle("skinn_v","bm1_carstart","OTHER");

Game.SetNumValidFailureHints( 5 );

Game.UsePedGroup(1);

Game.SetForcedCar();

Game.AddStage();
    Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_08.p3d" );
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(188);
	Game.SetHUDIcon( "right" );

	Game.StartCountdown("count");
		Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds

	Game.AddObjective("goto");
		Game.AddNPC("skinner", "bm1_skinner_hide");
		Game.SetDestination("bm_rightfluff", "laundry");
	Game.CloseObjective();
	Game.SetStageTime(40);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(3);
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(121);
	Game.SetHUDIcon( "lundry" );
	Game.AddObjective("goto");
		Game.SetDestination("bm1_laundry_locator","laundry"); --the first object
		Game.TurnGotoDialogOff();
	Game.CloseObjective();
	Game.SetCompletionDialog("laundromat", "skinner");
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage();
	Game.SetStageMessageIndex(180);
	Game.SetHUDIcon( "kburger" );
	Game.AddObjective("goto");
		Game.AddNPC("teen","bm_svt");
		Game.SetDestination("bm_krustyburger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(30);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(122);
	Game.SetHUDIcon( "svt" );
	Game.AddObjective("talkto");
		Game.AddNPC("teen","bm_svt");
		Game.SetTalkToTarget("teen", 0, 0);
	Game.CloseObjective();
--	AddStageTime(0);
--	AddCondition("timeout");
--	CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("lisa","teen","sandwich",0);
		Game.SetCamBestSide( "bm1_bestside" );
		Game.SetDialoguePositions("bm_lisa_loc1","bm_svt","m3_carstart");
	Game.CloseObjective();
--	AddStageTime(0);
--	AddCondition("timeout");
--	CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
Game.CloseStage();



Game.AddStage(0);
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(189);
	Game.SetHUDIcon( "kbmeal" );
	Game.AddObjective("goto");
		Game.SetDestination("bm_burger", "kmeal");
		Game.TurnGotoDialogOff();
	Game.CloseObjective();
--	AddStageTime(0);
--	AddCondition("timeout");
--	CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.SetHUDIcon( "skinn_v" );
	Game.SetCompletionDialog("heart", "skinner");
	Game.AddObjective("getin", "skinn_v" );
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(187);
	Game.SetHUDIcon( "casino" );
	Game.AddObjective("goto");
		Game.AddNPC("nriviera","bm1_captain");
		Game.SetDestination("bm_casino", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(45);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(62);
	Game.SetHUDIcon( "drnick" );
	Game.AddObjective("talkto");
		Game.AddNPC("nriviera","bm1_captain");
		Game.AddObjectiveNPCWaypoint( "nriviera", "bm_nriviera_walk1" );
		Game.SetTalkToTarget("nriviera", 0, 0);
		Game.SetCamBestSide( "bm1_bestside2" );
	Game.CloseObjective();
--	AddStageTime(0);
--	AddCondition("timeout");
--	CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetDialogueInfo("lisa","nriviera","cream",0);
		Game.SetDialoguePositions("bm_lisa_loc2","bm1_captain","m5_carstart");
	Game.CloseObjective();
--	AddStageTime(0);
--	AddCondition("timeout");
--	CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(255);
	Game.SetHUDIcon( "antifung" );
	Game.AddObjective("goto");
		Game.SetDestination("bm_cream", "cream");
		Game.TurnGotoDialogOff();
	Game.CloseObjective();
--	AddStageTime(0);
--	AddCondition("timeout");
--	CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(179);
	Game.SetHUDIcon( "noise" );
	Game.SetMaxTraffic(3);
	Game.AddObjective("goto");
		Game.AddNPC("teen","ismovie_cbg_sd");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m2_arcade", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(35);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "skinn_v" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("timer");
		Game.SetDurationTime(1);
	Game.CloseObjective();
	Game.SetFadeOut( 0.1 );
	Game.SwapInDefaultCar();
	Game.SetSwapDefaultCarLocator("m2_carstart");
	Game.SetSwapForcedCarLocator("bm_skinner_carend");
	Game.SetSwapPlayerLocator("m2_lisa_start");
Game.CloseStage();

Game.AddStage("1"); -- gets lisa out of the Car and hides the car
	Game.AddObjective("timer");
		Game.RemoveDriver("skinner");
		Game.AddNPC("skinner", "skinner_final");
		Game.StayInBlack();
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.AddNPC("skinner", "skinner_final");
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("lisa","skinner","aspic",0);
		Game.SetDialoguePositions("lisa_final","skinner_final","m2_carstart");
	Game.CloseObjective();
Game.CloseStage();




Game.CloseMission();

c_level = 3
c_mission = 11

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
