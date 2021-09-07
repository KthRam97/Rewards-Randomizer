Game.SelectMission("sr1");
	--The TIME TRIAL
	--Script set up for multiple laps
	c_level = 5
c_mission = 8

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

	Game.SetMissionResetPlayerInCar("sr1_carstart");
	Game.SetDynaLoadData("l5z2.p3d;l5r2.p3d;l5r1.p3d;");
	Game.PlacePlayerCar("current", "sr1_carstart");

	Game.UsePedGroup(4);

	Game.SetMissionStartCameraName( "race1camShape" );
	Game.SetMissionStartMulticontName( "race1cam" );
	Game.SetAnimatedCameraName( "race1camShape" );
	Game.SetAnimCamMulticontName( "race1cam" );

	--Chuck: StreetRace Prop Load and Unload Setup
	Game.StreetRacePropsLoad("l5_sr1p.p3d;");
	Game.StreetRacePropsUnload("l5_sr1p.p3d:");

	Game.AddStage(0);
		Game.SetHUDIcon( "race");
		Game.DisableHitAndRun();
		Game.StartCountdown("count");
			Game.AddToCountdownSequence( "3", 1200 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "2", 800 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "1", 600 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "DRIVE", 400 ); -- duration time in milliseconds
		Game.SetStageMessageIndex(222);
		Game.NoTrafficForStage();
		Game.SetStageTime(80);
		Game.RESET_TO_HERE();
		Game.AddObjective( "race","neither");
			Game.AddNPC("patty", "sr1_patty");
			Game.AddNPC("selma", "sr1_selma");
			Game.AddCollectible("sr1_waypoint1","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr1_waypoint2","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr1_waypoint3","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr1_waypoint4","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.SetRaceLaps(5);
		Game.CloseObjective();
		Game.AddCondition("timeout");
		Game.CloseCondition();
		Game.AddCondition( "damage" );
			Game.SetCondMinHealth( 0.0 );
			Game.SetCondTargetVehicle( "current");
		Game.CloseCondition();
		Game.AddCondition("outofvehicle");
			Game.SetCondTime( 10000 );
		Game.CloseCondition();
	Game.CloseStage();

Game.AddStage(1, "final");
	Game.AddObjective("dialogue");
		Game.AddNPC("patty", "sr1_patty");
		Game.AddNPC("selma", "sr1_selma");
		Game.SetDialogueInfo("patty","apu","success",0);
		Game.SetDialoguePositions("sr1_patty","sr1_apu_end","sr1_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
