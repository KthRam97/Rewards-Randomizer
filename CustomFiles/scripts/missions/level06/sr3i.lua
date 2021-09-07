Game.SelectMission("sr3");

c_level = 6
c_mission = 10

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
	--The CIRCUIT RACE (with AI cars)
	--Script set up for multipkle laps

	Game.SetMissionResetPlayerInCar("sr3_carstart");
	Game.SetDynaLoadData("l6z5.p3d;l6r4.p3d;l6r5.p3d;l6r5_dam.p3d;");

	Game.UsePedGroup(5);

	Game.SetMissionStartCameraName( "race3camShape" );
	Game.SetMissionStartMulticontName( "race3cam" );
	Game.SetAnimatedCameraName( "race3camShape" );
	Game.SetAnimCamMulticontName( "race3cam" );


	--Chuck: StreetRace Prop Load and Unload Setup
	Game.StreetRacePropsLoad("l6_sr3p.p3d;");
	Game.StreetRacePropsUnload("l6_sr3p.p3d:");


	Game.AddStage(0);
		Game.SetHUDIcon( "race" );
		Game.DisableHitAndRun();
		Game.PlacePlayerCar("current", "sr3_carstart");
		Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
		Game.StartCountdown("count");
			Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "2", 600 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "1", 600 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "!!!", 400 ); -- duration time in milliseconds
		Game.SetStageMessageIndex(224);
		Game.RESET_TO_HERE();
		Game.NoTrafficForStage();
		Game.AddStageVehicle("homer_v","sr3_AI_carstart1","race","Missions\\level06\\sr3_1st.con","homer");
			Game.SetVehicleAIParams( "homer_v", 50, 51 );
		Game.AddStageWaypoint( "sr3_navpoint1" );
		Game.AddStageWaypoint( "sr3_navpoint2" );
		Game.AddStageWaypoint( "sr3_navpoint3" );
		Game.AddObjective( "race", "neither" );
			Game.AddNPC("patty", "sr3_patty");
			Game.AddNPC("selma", "sr3_selma");
			Game.AddCollectible("sr3_waypoint1","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr3_waypoint2","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr3_waypoint3","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr3_waypoint4","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr3_waypoint5","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr3_waypoint6","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
		Game.CloseObjective();
		Game.AddCondition("position");
			Game.SetConditionPosition(1);
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
		Game.AddNPC("patty", "sr3_patty");
		Game.AddNPC("selma", "sr3_selma");
		Game.SetDialogueInfo("patty","bart","success",0);
		Game.SetDialoguePositions("sr3_patty","sr3_bart_end","race_finish");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
