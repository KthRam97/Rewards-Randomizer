Game.SelectMission("m4");

c_level = 6
c_mission = 4

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m4_carstart");
Game.SetDynaLoadData("l6z5.p3d;l6r4.p3d;l6r5.p3d;l6r5_dam.p3d;");

Game.UsePedGroup(6);

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(245);
	Game.SetHUDIcon( "duff" );
	Game.AddObjective( "goto" );
		Game.AddStageVehicle("cDuff","m4_duff_carstart","NULL","Missions\\level06\\M4dump.con");
		Game.SetDestination( "m4_brewery", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(45);
	Game.AddCondition( "timeout" );
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(140);
	Game.SetHUDIcon( "lasercra" );
	Game.ActivateVehicle("cDuff","NULL","target");
	Game.SetVehicleAIParams( "cDuff", -10, -9 ); --  <=== name, min, max; 0,1 = really dumb, no shortcuts
	Game.SetStageAITargetCatchupParams( "cDuff", 50, 100);

	Game.AddStageWaypoint( "m4_laser_path7" );
	Game.AddStageWaypoint( "m4_laser_path14" );
	Game.AddStageWaypoint( "m4_laser_path1" );
	Game.AddObjective("dump");
		Game.SetObjTargetVehicle("cDuff");
		Game.AddCollectible("m4_laser1","laserbox_crate");
		Game.AddCollectible("m4_laser2","laserbox_crate");
		Game.AddCollectible("m4_laser3","laserbox_crate");
		Game.AddCollectible("m4_laser4","laserbox_crate");
		Game.AddCollectible("m4_laser5","laserbox_crate");
		Game.AddCollectible("m4_laser6","laserbox_crate");
		Game.SetCollectibleEffect("bonestorm_explosion");
	Game.CloseObjective();
	Game.AddStageTime(120);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(211);
	Game.SetHUDIcon( "duff" );
	Game.AddObjective( "goto" );
		Game.SetDestination( "m4_brewery", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(40);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0, "final");
	Game.SetStageMessageIndex(133);
	Game.SetHUDIcon( "lasergun" );
	Game.AddObjective("goto", "niether");
		Game.SetDestination("m4_lasergun", "lasergun");
		Game.TurnGotoDialogOff();
	Game.CloseObjective();
	Game.AddStageTime(30);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.SetCompletionDialog("sellout");

Game.CloseStage();

Game.CloseMission();
