Game.SelectMission("m4");

c_level = 4
c_mission = 4

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerOutCar("m4_marge_start","m4_carstart");
Game.SetDynaLoadData("l4z1.p3d;l4z7.p3d;l4r7.p3d;");

Game.UsePedGroup(6);

Game.AddStage("final");

--SetStageAIRaceCatchupParams(
--	STAGEVEHICLENAME,
--      ALONGROADDISTFROMPLAYER_TO_APPLYMAXCATCHUP, // default = 80
--      FRACTIONPLAYERSPEED_MINCATCHUP,   // default = 0.5
--      FRACTIONPLAYERSPEED_NOCATCHUP,    // default = 1.1
--      FRACTIONPLAYERSPEED_MAXCATCHUP )  // default = 1.7	AddStageWaypoint( "m7_smithers_race1" );
--SetStageAIRaceCatchupParams("wiggu_v", 80, 0.5, 1.1, 1.7);

	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(100);
	Game.SetHUDIcon( "retire" );
	Game.AddStageVehicle("wiggu_v","m4_wiggum_start","race","Missions\\level04\\M4race.con", "wiggum");
	Game.SetStageAIRaceCatchupParams("wiggu_v", 80, 0.9, 1.5, 2.3);
	Game.SetVehicleAIParams( "wiggu_v", 50, 51 );   -- no shortcuts
	Game.AddStageWaypoint( "m4_race_finish" );
	Game.AddObjective( "race" );
--		SetHitAndRunMeter(100);
		Game.AddNPC("grandpa", "m5_grampa_sd");
		Game.AddCollectible("m4_race_finish","finish_line");
--		SetCollectibleEffect("finish_line_col");
	Game.CloseObjective();
	Game.AddCondition("race");
		Game.SetCondTargetVehicle("wiggu_v");
	Game.CloseCondition();
	Game.StageStartMusicEvent("L4_drama");
Game.CloseStage();

Game.CloseMission();


