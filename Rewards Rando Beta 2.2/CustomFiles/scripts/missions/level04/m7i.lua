Game.SelectMission("m7");

c_level = 4
c_mission = 7

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m7_carstart");
Game.SetDynaLoadData("l4z2.p3d;l4r1.p3d;l4r2.p3d;");

Game.UsePedGroup(1);

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.AddStageVehicle("cCola","m7_cola1_carstart","NULL","Missions\\level04\\M7dest.con","male2");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
	Game.SetMusicState("Mission7", "Stage1");
Game.CloseStage();

Game.AddStage(36);
	Game.RESET_TO_HERE();
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(103);
	Game.SetHUDIcon( "cola_v" );
	Game.AddStageWaypoint( "m7_cola1_path1" );
	Game.AddStageWaypoint( "m7_cola1_path4" );
	Game.AddStageWaypoint( "m7_cola2_path1" );
	Game.AddStageWaypoint( "m7_cola2_path6a" );
	Game.AddObjective("destroy");
		Game.ActivateVehicle("cCola","NULL","target");
		Game.SetVehicleAIParams( "cCola", -10, -9 );   -- no shortcuts
		Game.SetObjTargetVehicle("cCola");
	Game.CloseObjective();
	Game.SetStageTime(120);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.SetCompletionDialog("evil");
Game.CloseStage();

Game.AddStage(37);
	Game.SetStageMessageIndex(234);
	Game.SetHUDIcon( "mansion" );
	Game.AddObjective("goto");
		Game.AddStageVehicle("cCola","m7_cola2_carstart","NULL","Missions\\level04\\M7dest.con","male2");
		Game.SetDestination("m7_cola2_trigger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(36);
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(103);
	Game.SetHUDIcon( "cola_v" );
	Game.AddStageWaypoint( "m7_cola2_path6" );
	Game.AddStageWaypoint( "m7_cola2_path6a" );
	Game.AddStageWaypoint( "m7_cola3_path5" );
	Game.AddStageWaypoint( "m7_cola3_path4" );
	Game.AddObjective("destroy");
		Game.ActivateVehicle("cCola","NULL","target");
		Game.SetVehicleAIParams( "cCola", -10, -9 );   -- no shortcuts
		Game.SetObjTargetVehicle("cCola");
	Game.CloseObjective();
	Game.SetStageTime(120);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.SetCompletionDialog("canyonero");
Game.CloseStage();

Game.AddStage(37);
	Game.SetStageMessageIndex(235);
	Game.SetHUDIcon( "pwrplant" );
	Game.AddObjective("goto");
		Game.AddStageVehicle("cCola","m7_cola3_carstart","NULL","Missions\\level04\\M7dest.con","male2");
		Game.SetDestination("m7_cola3_trigger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(36);
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(38);
	Game.SetHUDIcon( "cola_v" );
	Game.AddStageWaypoint( "m7_cola3_path4" );
	Game.AddStageWaypoint( "m7_cola1_path1" );
	Game.AddObjective("destroy");
		Game.ActivateVehicle("cCola","NULL","target");
		Game.SetVehicleAIParams( "cCola", -10, -9 );   -- no shortcuts
		Game.SetObjTargetVehicle("cCola");
	Game.CloseObjective();
	Game.SetStageTime(120);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.SetMusicState("Mission7", "Stage2");
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(217);
	Game.SetHUDIcon( "simpsons" );
	Game.AddObjective( "goto" );
		Game.TurnGotoDialogOff();
--		AddStageVehicle("wiggu_v","m7_wiggum_carstart1","NULL","Missions\level04\M7evade.con");
		Game.AddStageVehicle("cPolice","m7_wiggum_carstart1","NULL","Missions\\level04\\M7evade.con","wiggum");
		Game.SetDestination( "m7_wiggum_pursue", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetCompletionDialog("settled","wiggum");
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(40);
	Game.SetHUDIcon( "wiggu_v" );
	Game.ActivateVehicle("cPolice","NULL","chase");
	Game.AddObjective("losetail");
		Game.SetObjTargetVehicle("cPolice");
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.SetStageTime(60);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0,"final");
	Game.SetStageMessageIndex(217);
	Game.SetHUDIcon( "simpsons" );
	Game.AddObjective("goto");
		Game.SetDestination("m7_home_locator", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
