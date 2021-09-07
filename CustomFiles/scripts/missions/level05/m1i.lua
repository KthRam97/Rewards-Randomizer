Game.SelectMission("m1");

c_level = 5
c_mission = 1

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m1_apu_carstart");
Game.SetDynaLoadData("l5z2.p3d;l5r2.p3d;l5z3.p3d;");

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin", "neither");
		Game.AddNPC("moe", "ambient_moe");
		Game.SetObjTargetVehicle("current");
		Game.AddStageVehicle("cCola","m1_cola_carstart","NULL","Missions\\level05\\M1chase.con","male2");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(68);
	Game.SetHUDIcon( "cola_v" );
	Game.SetMaxTraffic(3);
	Game.ActivateVehicle("cCola","NULL","evade");
	Game.AddStageWaypoint( "m1_start");
	Game.AddStageWaypoint( "m1_dump_1");
	Game.AddStageWaypoint( "m1_dump_2");
	Game.AddStageWaypoint( "m1_dump_3");
	Game.AddStageWaypoint( "m1_dump_4");
	Game.AddStageWaypoint( "m1_dump_5");
	Game.AddStageWaypoint( "m1_dump_6");
	Game.AddStageWaypoint( "m1_dump_7");
	Game.AddStageWaypoint( "m1_dump_8");
	Game.AddStageWaypoint( "m1_dump_9");
	Game.AddStageWaypoint( "m1_dump_10");
	Game.AddStageWaypoint( "m1_dump_11");
	Game.AddObjective("dump");
		Game.AddNPC("louie", "m2_louie_sd");
		Game.SetObjTargetVehicle("cCola");
		Game.AddCollectible("m1_crate_1","cola");
		Game.AddCollectible("m1_crate_2","cola");
		Game.AddCollectible("m1_crate_3","cola");
		Game.AddCollectible("m1_crate_4","cola");
		Game.AddCollectible("m1_crate_5","cola");
		Game.AddCollectible("m1_crate_6","cola");
		Game.AddCollectible("m1_crate_7","cola");
		Game.AddCollectible("m1_crate_8","cola");
		Game.AddCollectible("m1_crate_9","cola");
		Game.AddCollectible("m1_crate_10","cola");
		Game.AddCollectible("m1_crate_11","cola");
		Game.SetCollectibleEffect("bonestorm_explosion");
		Game.BindCollectibleTo(0, 1);
		Game.BindCollectibleTo(1, 2);
		Game.BindCollectibleTo(2, 3);
		Game.BindCollectibleTo(3, 4);
		Game.BindCollectibleTo(4, 5);
		Game.BindCollectibleTo(5, 6);
		Game.BindCollectibleTo(6, 7);
		Game.BindCollectibleTo(7, 8);
		Game.BindCollectibleTo(8, 9);
		Game.BindCollectibleTo(9, 10);
		Game.BindCollectibleTo(10, 11);
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0, 200);
		Game.SetCondTargetVehicle("cCola");
	Game.CloseCondition();
--	ShowStageComplete();
	Game.SetIrisWipe( 0.1 );
	Game.SetCompletionDialog("mob");
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("timer");
		Game.AddStageCharacter("apu", "m1_apuend", "", "current", "m1_carend");
--		PutMFPlayerInCar();
		Game.AddStageVehicle("cCola","m1_colaend","NULL","Missions\\level05\\M1chase.con");
		Game.AddNPC("louie", "m2_louie_sd");
		Game.SetDurationTime(1);
	Game.CloseObjective();

Game.CloseStage();
