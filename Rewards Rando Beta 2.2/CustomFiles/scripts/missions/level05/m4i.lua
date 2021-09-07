Game.SelectMission("m4");

c_level = 5
c_mission = 4

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m4_carstart");
Game.SetDynaLoadData("l5r1.p3d;l5z1.p3d;l5z2.p3d;");

Game.UsePedGroup(0);
Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(8);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(264);
	Game.SetHUDIcon( "donuts" );
	Game.AddObjective("delivery", "neither");
		Game.AddStageVehicle("wiggu_v","m4_wiggum_carstart","NULL","Missions\\level05\\M4chase.con", "wiggum");
		Game.AddCollectible("m4_donut_1","donut");
		Game.AddCollectible("m4_donut_2","donut");
		Game.AddCollectible("m4_donut_3","donut");
		Game.AddCollectible("m4_donut_4","donut");
		Game.AddCollectible("m4_donut_5","donut");
		Game.AddCollectible("m4_donut_6","donut");
		Game.AddCollectible("m4_donut_7","donut");
		Game.AddCollectible("m4_donut_8","donut");
		Game.AddCollectible("m4_donut_9","donut");
		Game.AddCollectible("m4_donut_10","donut");
		Game.AddCollectible("m4_donut_11","donut");
		Game.AddCollectible("m4_donut_12","donut");
		Game.AddCollectible("m4_donut_13","donut");
		Game.AddCollectible("m4_donut_14","donut");
		Game.AddCollectible("m4_donut_15","donut");
		Game.AddCollectible("m4_donut_16","donut");
		Game.AddCollectible("m4_donut_17","donut");
		Game.AddCollectible("m4_donut_18","donut");
		Game.AddCollectible("m4_donut_19","donut");
		Game.AddCollectible("m4_donut_20","donut");
		Game.AddCollectible("m4_donut_21","donut");
	Game.CloseObjective();
	Game.SetStageTime(55);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage("final");
	Game.SetStageMessageIndex(75);
	Game.SetHUDIcon( "wiggu_v" );
	Game.ActivateVehicle("wiggu_v","NULL","evade");
	Game.SetVehicleAIParams( "wiggu_v", 45, 51 ); --  all shortcuts
	Game.AddStageWaypoint( "m4_wiggum1" );
	Game.AddStageWaypoint( "m4_wiggum2" );
	Game.AddStageWaypoint( "m4_wiggum3" );
	Game.AddStageWaypoint( "m4_wiggum4" );
	Game.AddStageWaypoint( "m4_wiggum_path8" );
	Game.AddStageWaypoint( "m4_wiggum_path10" );
	--AddStageWaypoint( "m4_wiggum_path11" );
	Game.AddObjective("follow", "neither");
		--AddNPC("snake", "m5_snake_sd");
		--SetDestination("m4_wiggum_path10");
		Game.SetObjTargetVehicle("wiggu_v");
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0, 150);
		Game.SetCondTargetVehicle("wiggu_v");
	Game.CloseCondition();
Game.CloseStage();

Game.CloseMission();
