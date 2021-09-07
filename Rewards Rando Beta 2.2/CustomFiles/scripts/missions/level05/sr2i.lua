Game.SelectMission("sr2");

c_level = 5
c_mission = 9

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
	--The CIRCUIT RACE (with AI cars)
	--Script set up for multile laps

	Game.SetMissionResetPlayerInCar("sr2_carstart");
	Game.SetDynaLoadData("l5r4.p3d;l5r3.p3d;l5z4.p3d;");
	Game.PlacePlayerCar("current", "sr2_carstart");

	Game.UsePedGroup(5);

	Game.SetMissionStartCameraName( "race2camShape" );
	Game.SetMissionStartMulticontName( "race2cam" );
	Game.SetAnimatedCameraName( "race2camShape" );
	Game.SetAnimCamMulticontName( "race2cam" );

	--Chuck: StreetRace Prop Load and Unload Setup
	Game.StreetRacePropsLoad("l5_sr2p.p3d;");
	Game.StreetRacePropsUnload("l5_sr2p.p3d:");


	Game.AddStage(0);
		Game.SetHUDIcon( "race");
		Game.DisableHitAndRun();
		Game.StartCountdown("count");
			Game.AddToCountdownSequence( "3", 1200 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "1", 600 ); -- duration time in milliseconds
			Game.AddToCountdownSequence( "???", 400 ); -- duration time in milliseconds
		Game.SetStageMessageIndex(223);
		Game.RESET_TO_HERE();
		Game.NoTrafficForStage();
		Game.AddStageVehicle("bart_v","sr2_AI_carstart1","race","Missions\\level05\\sr2_1st.con","bart");
			Game.SetStageAIRaceCatchupParams("bart_v", 80, 1.0, 1.2, 2.5);
		Game.AddStageVehicle("ambul","sr2_AI_carstart3","race","Missions\\level05\\sr2_3rd.con");
			Game.SetStageAIRaceCatchupParams("ambul", 80, 0.75, 1.1, 2.0);
		Game.AddStageVehicle("votetruc","sr2_AI_carstart4","race","Missions\\level05\\sr2_4th.con");
			Game.SetStageAIRaceCatchupParams("votetruc", 80, 0.75, 1.1, 2.0);
		Game.AddStageWaypoint( "sr2_waypoint0" );
		Game.AddStageWaypoint( "sr2_waypoint1" );
		Game.AddStageWaypoint( "sr2_waypoint2" );
		Game.AddStageWaypoint( "sr2_waypoint3" );
		--AddStageWaypoint( "sr2_waypoint3b" );
		Game.AddStageWaypoint( "sr2_waypoint4" );
		Game.AddStageWaypoint( "sr2_waypoint5" );
		Game.AddStageWaypoint( "sr2_waypoint5b" );
		Game.AddStageWaypoint( "sr2_waypoint6" );
		--AddStageWaypoint( "sr2_waypoint6b" );
		Game.AddStageWaypoint( "sr2_waypoint7" );
		Game.AddStageWaypoint( "sr2_waypoint8" );
		Game.AddObjective( "race", "neither" );
			Game.AddNPC("patty", "sr2_patty");
			Game.AddNPC("selma", "sr2_selma");
			Game.AddCollectible("sr2_waypoint1","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint2","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint3","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint4","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint5","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint5b","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint6","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint7","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.AddCollectible("sr2_waypoint8","carsphere");
				Game.SetCollectibleEffect("wrench_collect");
			Game.SetRaceLaps(3);
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

Game.AddStage(1,"final");
	Game.AddObjective("dialogue");
		Game.AddNPC("patty", "sr2_patty");
		Game.AddNPC("selma", "sr2_selma");
		Game.SetDialogueInfo("patty","apu","success",0);
		Game.SetDialoguePositions("sr2_patty","sr2_apu_end","sr2_AI_carstart1");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
