Game.SelectMission("m2");

c_level = 6
c_mission = 2

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerOutCar("bart_barneytalk","level6_carstart");
Game.SetDynaLoadData("l6z4.p3d;l6r3.p3d;l6r4.p3d;");

Game.UsePedGroup(6);

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetHUDIcon( "observ" );
	Game.SetStageMessageIndex(266);
	Game.AddStageVehicle("IStruck","m2_truck_start","race","Missions\\level06\\M2follow.con");
	Game.AddStageVehicle("cKlimo","m2_limo_start","NULL","Missions\\level06\\M2race.con", "eddie");
	Game.SetVehicleAIParams( "IStruck", 0, 1 );
	Game.AddStageWaypoint( "m2_truck" );
	Game.AddObjective("follow");
		Game.SetObjTargetVehicle("IStruck");
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0, 200);
		Game.SetCondTargetVehicle("IStruck");
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon( "krusty_v" );
	Game.SetMaxTraffic(1);
	Game.SetStageMessageIndex(271);
	Game.AddObjective("goto");
		Game.AddStageVehicle("cKlimo","m2_limo_start","NULL","Missions\\level06\\M2race.con", "eddie");
		Game.SetDestination("m2_limo_wait","triggersphere");
		Game.SetCollectibleEffect("wrench_collect");
--		MustActionTrigger();
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0,"final");
	Game.ActivateVehicle("cKlimo","NULL","race");
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(70);
	Game.SetHUDIcon( "squidp" );
	--PutMFPlayerInCar();  // This makes the play auto reset into their car for this stage.
	Game.SetStageAIRaceCatchupParams("cKlimo", 80, 0.9, 1.5, 2.3);
	Game.SetVehicleAIParams( "cKlimo", 50, 51 );   -- no shortcuts
-- 	AddStageWaypoint( "m2_limo_path3" );
	Game.AddStageWaypoint( "m2_limo_path5" );
--	AddStageWaypoint( "m2_limo_path7" );
	Game.AddStageWaypoint( "m2_limo_path8" );
	Game.AddObjective( "race" );
		Game.AddNPC("krusty", "m3_krusty_sd");
		Game.AddCollectible("m2_limo_path8", "finish_line");
--		SetCollectibleEffect("finish_line_col");
	Game.CloseObjective();
	Game.AddCondition("race");
		Game.SetCondTargetVehicle("cKlimo");
	Game.CloseCondition();
	Game.AddStageMusicChange();
Game.CloseStage();

Game.CloseMission();
