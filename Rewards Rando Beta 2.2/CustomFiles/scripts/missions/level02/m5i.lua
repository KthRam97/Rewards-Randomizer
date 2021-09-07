Game.SelectMission("m5");

c_level = 2
c_mission = 5

Game.SetMissionResetPlayerInCar("m5_cletustruck_sd");
Game.SetDynaLoadData("l2z1.p3d;l2r1.p3d;l2z2.p3d;");
Game.InitLevelPlayerVehicle("cletu_v","m5_cletustruck_sd","OTHER");
Game.SetNumValidFailureHints(5);

Game.UsePedGroup(1);
Game.SetForcedCar();

Game.AddStage(3);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(61);
	Game.SetHUDIcon( "flatmeat" );
	Game.SetStageTime(80);
	Game.SetMaxTraffic(4);

	Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1",  1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO",  400 ); -- duration time in milliseconds

	Game.AddObjective("delivery");
		Game.AddNPC("cletus", "m5_cletus_hide");
		Game.AddCollectible("m5_roadkill1","roadkill");
		Game.AddCollectible("m5_roadkill2","roadkill");
		Game.AddCollectible("m5_roadkill3","roadkill");
		Game.AddCollectible("m5_roadkill4","roadkill");
		Game.AddCollectible("m5_roadkill5","roadkill");
		Game.AddCollectible("m5_roadkill6","roadkill");
		Game.AddCollectible("m5_roadkill7","roadkill");
		Game.AddCollectible("m5_roadkill8","roadkill");
		Game.AddCollectible("m5_roadkill9","roadkill");
		Game.AddCollectible("m5_roadkill10","roadkill");
		Game.AddCollectible("m5_roadkill11","roadkill");
		Game.AddCollectible("m5_roadkill12","roadkill");
		Game.AddCollectible("m5_roadkill13","roadkill");
		Game.AddCollectible("m5_roadkill14","roadkill");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "cletu_v" );
	Game.CloseCondition();
	Game.ShowStageComplete();
	Game.SetMusicState("Mission5", "Stage1");
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(138);
	Game.SetHUDIcon( "kburger" );
	Game.AddStageTime(60);
	Game.AddStageVehicle("apu_v","m5_apu_carstart","NULL","Missions\\level02\\M5chase.con", "apu");
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m5_apu_chase_start", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "cletu_v" );
	Game.CloseCondition();
	Game.SetCompletionDialog("stinkdog","apu");
Game.CloseStage();

Game.AddStage(0);
	Game.AddStageTime(60);
	Game.SetStageMessageIndex(139);
	Game.SetHUDIcon( "apu_v" );
	Game.ActivateVehicle("apu_v","NULL","chase");
	Game.AddObjective("losetail","neither");
		Game.SetObjTargetVehicle("apu_v");
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "cletu_v" );
	Game.CloseCondition();
	Game.ShowStageComplete();
	Game.SetMusicState("Mission5", "Stage2");
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageTime(90);
	Game.SetStageMessageIndex(138);
	Game.SetHUDIcon( "kburger" );
	Game.AddObjective("goto","both");
		Game.SetDestination("m5_krustyburger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "cletu_v" );
	Game.CloseCondition();
	Game.SetFadeOut( 0.1 );
	Game.SwapInDefaultCar();
	Game.SetSwapDefaultCarLocator("level2_carstart");
	Game.SetSwapForcedCarLocator("m5_cletustruck_sd");
	Game.SetSwapPlayerLocator("m5_bart_run");
	Game.SetMusicState("Mission5", "Stage1");
Game.CloseStage();

--AddStage(0);
--	SetStageMessageIndex(25);
--	SetHUDIcon( "cletus" );
--	AddObjective("talkto","neither");
--		AddNPC("cletus", "m5_cletus_sd");
--		SetTalkToTarget("cletus", 0, 0);
--	CloseObjective();
--CloseStage();

Game.AddStage(1);
	Game.AddObjective("timer");
		Game.AddNPC("cletus", "m5_cletus_walk1");
--		AddStageCharacter ("bart", "m5_bart_run", "", "current", "level2_carstart");
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.AddNPC("cletus", "m5_cletus_walk1");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m5_bestside" );
		Game.SetDialogueInfo("bart","cletus","roadkill",0);
		Game.SetDialoguePositions("m5_bart_run","m5_cletus_walk1","level2_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.SetHUDIcon( "setelite" );
	Game.SetStageMessageIndex(172);
	Game.AddObjective("goto","neither");
		Game.AddNPC("cletus", "m5_cletus_walk1");
		Game.SetDestination("m5_dish","s_dish");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

