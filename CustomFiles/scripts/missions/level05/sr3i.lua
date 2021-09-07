Game.SelectMission("sr3");

c_level = 5
c_mission = 10

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
	--The CIRCUIT RACE (with AI cars)


	Game.SetMissionResetPlayerInCar("sr3_carstart");
	Game.SetDynaLoadData("l5r1.p3d;l5z1.p3d;l5r4.p3d;");
	Game.PlacePlayerCar("current", "sr3_carstart");

	Game.UsePedGroup(0);

	Game.SetMissionStartCameraName( "race3camShape" );
	Game.SetMissionStartMulticontName( "race3cam" );
	Game.SetAnimatedCameraName( "race3camShape" );
	Game.SetAnimCamMulticontName( "race3cam" );

	--Chuck: StreetRace Prop Load and Unload Setup
	Game.StreetRacePropsLoad("l5_sr3p.p3d;");
	Game.StreetRacePropsUnload("l5_sr3p.p3d:");


	Game.AddStage(0);
		Game.SetHUDIcon( "race" );
		Game.DisableHitAndRun();
		Game.StartCountdown("count");
			Game.AddToCountdownSequence( "6", 800 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "12", 800 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "1", 600 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds
		Game.SetStageMessageIndex(224);
		Game.RESET_TO_HERE();
		Game.NoTrafficForStage();
		Game.AddStageVehicle("bart_v","sr3_bart_carstart1","race","Missions\\level05\\sr3_1st.con","bart");
			Game.SetVehicleAIParams( "bart_v", -50, -49 );
			Game.SetStageAIRaceCatchupParams("bart_v", 80, 0.95, 1.2, 2.0);

		Game.AddStageWaypoint( "sr3_waypoint1" );
		Game.AddStageWaypoint( "sr3_navpoint1" );
		Game.AddStageWaypoint( "sr3_navpoint2" );
		Game.AddStageWaypoint( "sr3_navpoint3" );
		Game.AddObjective( "race","neither" );
			Game.AddNPC("patty", "sr3_patty");
			Game.AddNPC("selma", "sr3_selma");
			Game.AddCollectible("sr3_waypoint1","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr3_waypoint2","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr3_waypoint3","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr3_waypoint4","finish_line");
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
		Game.SetDialogueInfo("patty","apu","success",0);
		Game.SetDialoguePositions("sr3_patty","sr3_apu_end","level5_carstart");
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();
