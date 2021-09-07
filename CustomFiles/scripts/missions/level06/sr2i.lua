Game.SelectMission("sr2");

c_level = 6
c_mission = 9

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
	--The CIRCUIT RACE (with AI cars)
	--Script set up for multipkle laps

	Game.SetMissionResetPlayerInCar("sr2_carstart");
	Game.SetDynaLoadData("l6z2.p3d;l6r2.p3d;l6r1.p3d;");

	Game.UsePedGroup(3);

	Game.SetAnimatedCameraName( "race2camShape" );
	Game.SetAnimCamMulticontName( "race2cam" );

	--Chuck: StreetRace Prop Load and Unload Setup
	Game.StreetRacePropsLoad("l6_sr2p.p3d;");
	Game.StreetRacePropsUnload("l6_sr2p.p3d:");


	Game.AddStage(0);
		Game.SetHUDIcon( "race");
		Game.DisableHitAndRun();
		Game.PlacePlayerCar("current", "sr2_carstart");
		Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
		Game.StartCountdown("count");
			Game.AddToCountdownSequence( "3", 1200 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "2", 800 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "1", 700 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "!!!", 400 ); -- duration time in milliseconds
		Game.SetStageMessageIndex(223);
		Game.RESET_TO_HERE();
		Game.NoTrafficForStage();
		Game.AddStageVehicle("homer_v","sr2_AI_carstart1","race","Missions\\level06\\sr2_1st.con","homer");
			Game.SetVehicleAIParams( "homer_v", -50, -49 );
			Game.SetStageAIRaceCatchupParams("homer_v", 80, 1, 1.25, 2.5);
		--AddStageVehicle("burnsarm","sr2_AI_carstart2","race","Missions\level06\sr2_2nd.con");
		--AddStageVehicle("compactA","sr2_AI_carstart3","race","Missions\level06\sr2_3rd.con");
		--AddStageVehicle("pickupA","sr2_AI_carstart4","race","Missions\level06\sr2_4th.con");
		Game.AddStageWaypoint( "sr2_waypoint1" );
		Game.AddStageWaypoint( "sr2_waypoint1b" );
		Game.AddStageWaypoint( "sr2_waypoint1c" );
		Game.AddStageWaypoint( "sr2_waypoint1d" );
		Game.AddStageWaypoint( "sr2_waypoint2" );
		Game.AddStageWaypoint( "sr2_waypoint3" );
		Game.AddStageWaypoint( "sr2_waypoint4" );
		Game.AddStageWaypoint( "sr2_waypoint5" );
		--AddStageWaypoint( "sr2_waypoint6" );
		Game.AddStageWaypoint( "sr2_waypoint6b" );
		--AddStageWaypoint( "sr2_waypoint6c" );
		--AddStageWaypoint( "sr2_waypoint7" );
		Game.AddStageWaypoint( "sr2_waypoint8" );

		Game.AddObjective( "race", "neither" );
			Game.AddNPC("patty", "sr2_patty");
			Game.AddNPC("selma", "sr2_selma");
			Game.AddCollectible("sr2_waypoint1","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint4","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint7","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint9","carsphere");
			Game.SetCollectibleEffect("wrench_collect");
			Game.SetRaceLaps(5);
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
		Game.AddNPC("patty", "sr2_patty");
		Game.AddNPC("selma", "sr2_selma");
		Game.SetDialogueInfo("patty","bart","success",0);
		Game.SetDialoguePositions("sr2_patty","sr2_bar_end","sr2_AI_carstart1");
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();
