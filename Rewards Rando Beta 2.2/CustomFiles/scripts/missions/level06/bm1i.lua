Game.SelectMission("bm1");

c_level = 6
c_mission = 11

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("bm1_carstart");
Game.SetDynaLoadData("l6r1.p3d;l6z1.p3d;l6z2.p3d;");

Game.UsePedGroup(1);

Game.AddStage(0);
    Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_08.p3d" );
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(124);
	Game.SetHUDIcon( "wiggu_v" );
	Game.AddStageVehicle("wiggu_v","bm1_wiggum_carstart","target","Missions\\level06\\BM1dest.con", "wiggum");
	Game.SetVehicleAIParams( "wiggu_v", 10, 20 ); --  random shortcuts
	Game.SetStageAITargetCatchupParams( "wiggu_v", 50, 100);

	Game.AddStageWaypoint( "bm1_wiggum_path1" );
	Game.AddStageWaypoint( "bm1_wiggum_path19" );
	Game.AddObjective("dump");
		Game.SetObjTargetVehicle("wiggu_v");
		Game.AddCollectible("bm1_evidence","i_folder");
	Game.CloseObjective();
	Game.SetStageTime(120);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(60);
	Game.SetHUDIcon( "snake" );
	Game.AddObjective("talkto");
		Game.SetTalkToTarget("snake", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetDialogueInfo("bart","snake","porkbag",0);
		Game.SetCamBestSide( "bm1_bestside" );
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(247);
	Game.SetHUDIcon( "bowlera" );
	Game.AddObjective("goto");
		Game.AddStageVehicle("cMilk","bm1_milk","NULL","Missions\\level06\\BM1dest2.con");
		Game.SetDestination( "bm_bowlerama", "carsphere");
		--SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(150);
	Game.SetHUDIcon( "milk_v" );
	Game.ActivateVehicle("cMilk","NULL","target");
	Game.SetVehicleAIParams( "cMilk", -10, -9 ); --  no shortcuts
	Game.AddStageWaypoint( "bm1_milk_path1" );
	Game.AddStageWaypoint( "bm1_milk_path4" );
	Game.AddObjective("destroy");
		Game.SetObjTargetVehicle("cMilk");
	Game.CloseObjective();
	Game.SetStageTime(180);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(60);
	Game.SetHUDIcon( "snake" );
	Game.AddObjective( "talkto" );
		Game.SetTalkToTarget("snake", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0, "final");
	Game.AddObjective("dialogue");
		Game.SetDialogueInfo("bart","snake","deal",0);
		Game.SetCamBestSide( "bm1_bestside" );
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
