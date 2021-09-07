Game.SelectMission("m3");

c_level = 6
c_mission = 3

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerOutCar("bart_krustytalk","m3_carstart");
Game.SetDynaLoadData("l6z3.p3d;l6r2.p3d;l6r3.p3d;");
Game.UsePedGroup(5);

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(90);
	Game.SetMaxTraffic(3);
	Game.SetHUDIcon( "frink_v" );
	Game.AddStageVehicle("frink_v","m3_frink_carstart","evade","Missions\\level06\\M3chase.con","frink");
	Game.AddStageWaypoint( "m3_frink_path1" );
	Game.AddStageWaypoint( "m3_frink_path2" );
	Game.AddStageWaypoint( "m3_frink_path3" );
	Game.AddStageWaypoint( "m3_frink_path4" );
	Game.AddStageWaypoint( "m3_frink_path7" );
	Game.AddStageWaypoint( "m3_frink_path8" );
	Game.AddStageWaypoint( "m3_frink_path9" );
	Game.AddStageWaypoint( "m3_frink_path3" );
	Game.AddStageWaypoint( "m3_frink_path5" );
	Game.AddStageWaypoint( "m3_frink_path2" );
	Game.AddStageWaypoint( "m3_frink_path10" );
	Game.AddObjective("follow", "neither");
		Game.SetObjTargetVehicle("frink_v");
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0, 150);
		Game.SetCondTargetVehicle("frink_v");
	Game.CloseCondition();
	Game.SetFadeOut( 1.0 );
Game.CloseStage();

Game.AddStage("final");
	Game.AddStageCharacter("bart", "m4_bart_start", "", "current", "m4_carstart" );
	Game.AddObjective("timer");
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();
Game.CloseMission();
