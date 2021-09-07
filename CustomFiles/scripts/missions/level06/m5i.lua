Game.SelectMission("m5");

c_level = 6
c_mission = 5

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m5_carstart");
Game.SetDynaLoadData("l6z4.p3d;l6r3.p3d;l6r4.p3d;");

Game.UsePedGroup(5);
Game.AddStage(0, "final");
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(92);
	Game.SetHUDIcon( "skinn_v" );

	Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds

	Game.AddStageWaypoint( "m5_skinner_path5" );
	Game.AddStageWaypoint( "m5_skinner_path4" );
	Game.AddStageWaypoint( "m5_skinner_path3" );
	Game.AddStageWaypoint( "m5_skinner_path2" );
	Game.AddStageWaypoint( "m5_skinner_path1" );
	Game.AddObjective("dump");
		Game.AddNPC("skinner", "m5_skinner_hide");
		Game.AddStageCharacter("bart", "", "", "current", "m5_carstart" );
		Game.AddStageVehicle("skinn_v","m5_skinner_carstart","target","Missions\\level06\\M5dest.con", "skinner");
		Game.SetStageAITargetCatchupParams( "skinn_v", 50, 100);
--		SetVehicleAIParams( "skinn_v", -10, -9 ); //  no shortcuts
		Game.SetObjTargetVehicle("skinn_v");
		Game.AddCollectible("m5_lasergun_1","lasergun");
	Game.CloseObjective();
	Game.SetStageTime(210);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddStageMusicChange();
	Game.SetCompletionDialog("proof");
Game.CloseStage();

Game.CloseMission();
