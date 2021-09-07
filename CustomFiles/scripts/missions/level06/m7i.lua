Game.SelectMission("m7");

c_level = 6
c_mission = 7

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m7_homer_carstart");
Game.SetDynaLoadData("l6z1.p3d;l6r1.p3d;l6r5.p3d;l6r5_dam.p3d;");
Game.InitLevelPlayerVehicle("homer_v","m7_homer_carstart","OTHER");
Game.SetNumValidFailureHints( 5 );
Game.UsePedGroup(0);

--This is a forced car mission
Game.SetForcedCar();

Game.AddStage("final");
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(94);
	Game.SetHUDIcon( "duff" );
	Game.SetMaxTraffic(5); --traffic off until we get AI vs Traffic mass advantage fix in code
	Game.AddStageVehicle("cSedan","m7_AI_carstart1","race","Missions\\level06\\M7race.con");
	Game.SetVehicleAIParams( "cSedan", 50, 51 ); --  <=== name, min, max; 50,51 = all shortcuts
--	SetStageAIRaceCatchupParams("cSedan", 80, 0.9, 1.5, 2.3);
	Game.SetStageAIRaceCatchupParams("cSedan", 80, 1.0, 1.7, 2.3);

	--AddNPC("homer", "m7_homer_hide");// WON"T WORK AND CRASHES THE GAME???

	Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3",  1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2",  1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1",  1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds

	Game.AddStageWaypoint( "m7_AI_path1" );
	Game.AddStageWaypoint( "m7_AI_path7" );
--	AddStageWaypoint( "m7_AI_pathadd" );
	Game.AddStageWaypoint( "m7_AI_path19" );
	Game.AddStageWaypoint( "m7_AI_path21" );
	Game.AddObjective( "race" );
		Game.AddNPC("homer", "m7_homer_hide");
--		AddCollectible("m7_AI_path1");
		Game.AddCollectible("m7_AI_path7");
		Game.AddCollectible("m7_AI_path9");
		Game.AddCollectible("m7_AI_path12");
		Game.AddCollectible("m7_AI_path19");
		Game.AddCollectible("m7_AI_path20");
		Game.AddCollectible("m7_AI_path21","finish_line");
	Game.CloseObjective();
	Game.AddCondition("position");
		Game.SetConditionPosition(1);
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "homer_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.CloseMission();
