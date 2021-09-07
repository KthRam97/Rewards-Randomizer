Game.SelectMission("m1");

Game.SetMissionResetPlayerInCar("m1_carstart");
Game.SetDynaLoadData("l3z1.p3d;l3r1.p3d;l3r5.p3d;l3r5_dam.p3d;");
Game.InitLevelPlayerVehicle("comic_v","m1_carstart","OTHER");

Game.SetNumValidFailureHints( 5 );

Game.UsePedGroup(0);

Game.SetForcedCar();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(2);
	Game.SetStageMessageIndex(116);
	Game.SetHUDIcon( "itcstore" );
	Game.AddStageVehicle("cNerd","m1_AI_carstart_1","race","Missions\\level03\\M1race.con", "male2");
	Game.SetVehicleAIParams( "cNerd", 0, 1 );   -- very dumb - no shortcuts
	--SetStageAIRaceCatchupParams("smith_v", 80, 0.5, 1.1, 1.7);
--		SetStageAIRaceCatchupParams("snake_v", 80, 0.5, 1.5, 1.7);

	Game.SetStageAIRaceCatchupParams("cNerd", 80, 0.5, 1.5, 1.7);

	Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds

	Game.AddStageWaypoint( "m1_AI_path4" );
	Game.AddStageWaypoint( "m1_AI_path9" );
	Game.AddStageWaypoint( "m1_AI_path13" );
	Game.AddObjective( "race", "both" );
		Game.AddCollectible("extracheckpoint");
		Game.AddCollectible("m1_AI_path13", "carsphere");
--		SetCollectibleEffect("finish_line_col");
	Game.CloseObjective();
	Game.AddCondition("position");
		Game.SetConditionPosition(1);
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "comic_v" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage();
	Game.SetStageMessageIndex(177);
	Game.SetHUDIcon( "comic" );
	Game.AddObjective("goto");
		Game.SetDestination("m1_itchy","is_comic");
		Game.TurnGotoDialogOff();
	Game.CloseObjective();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "comic_v" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.SetCompletionDialog("nuisance", "cbg");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(117);
	Game.SetHUDIcon( "android" );
	Game.AddObjective("goto");
		Game.SetDestination("m1_end", "carsphere");
		Game.TurnGotoDialogOff();
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(90);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "comic_v" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.SetFadeOut( 0.1 );
	Game.SwapInDefaultCar();
	Game.SetSwapDefaultCarLocator("level3_carstart");
	Game.SetSwapForcedCarLocator("m1_cbgcar_sd");
	Game.SetSwapPlayerLocator("level3_lisa_walkto");
	Game.ShowStageComplete();
Game.CloseStage();

--AddStage(0);
--	SetStageMessageIndex(176);
--	SetHUDIcon( "android" );
--	AddObjective("interior");
--		SetDestination("Android", "ad_mission_doorstar");
--	CloseObjective();
--CloseStage();

Game.AddStage(1);
	Game.AddObjective("timer");
		Game.AddNPC("cbg", "level3_lisa_start");
		Game.StayInBlack();
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();

--AddStage(0);
--	SetStageMessageIndex(54);
--	SetHUDIcon( "cbg" );
--	AddObjective("talkto");
--		AddNPC("cbg", "m1_cbg_sd");
--		SetTalkToTarget("cbg", 0, -0.2, "3.0");
--	CloseObjective();
--CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_01.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m1_bestside");
		Game.SetDialogueInfo("lisa","cbg","mylar",0); --needs to be re-piped
		Game.AddNPC("cbg", "level3_lisa_start");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

c_level = 3
c_mission = 1

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
