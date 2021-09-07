Game.SelectMission("bm1");

c_level = 5
c_mission = 11

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerOutCar("bm1_Apustart", "bm1_carstart");
Game.SetDynaLoadData("l5z1.p3d;l5r4.p3d;l5r1.p3d;");

Game.UsePedGroup(0);

Game.AddStage(7);
	Game.SetStageMessageIndex(127);
	Game.SetHUDIcon( "frink_v" );
	Game.AddStageVehicle("frink_v","bm1_hovercar_carstart","target","Missions\\level05\\BM1dest.con");
	Game.SetVehicleAIParams( "frink_v", 15, 25 ); --  some shorctuts
	Game.SetStageAITargetCatchupParams( "frink_v", 50, 100);

	Game.AddStageWaypoint( "bm1_hovercar_newpath_1" );
	Game.AddStageWaypoint( "bm1_hovercar_newpath_2" );
	Game.AddStageWaypoint( "bm1_hovercar_newpath_3" );
	Game.AddStageWaypoint( "bm1_hovercar_newpath_4" );
	Game.AddStageWaypoint( "bm1_hovercar_newpath_5" );
	Game.AddStageWaypoint( "bm1_hovercar_newpath_6" );
	Game.AddStageWaypoint( "bm1_hovercar_newpath_7" );
	Game.AddStageWaypoint( "bm1_hovercar_newpath_8" );
	Game.AddObjective("destroy");
		Game.SetObjTargetVehicle("frink_v");
	Game.CloseObjective();
	Game.SetStageTime(180);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(244);
	Game.SetHUDIcon( "java" );
	Game.AddObjective( "goto" );
		Game.SetDestination( "bm_javaserver", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(30);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(96);
	Game.SetHUDIcon( "frink" );
	Game.AddObjective("talkto");
		Game.SetTalkToTarget("frink", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.SetDialogueInfo("apu","frink","relief",0);
		Game.SetCamBestSide( "bm1_bestside" );
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();

