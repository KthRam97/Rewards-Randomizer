Game.SelectMission("sr2");
--The CIRCUIT RACE (with AI cars)
--Script set up for multipkle laps

Game.SetAnimatedCameraName( "race2camShape" );
Game.SetAnimCamMulticontName( "race2cam" );

Game.SetMissionResetPlayerInCar("sr2_carstart");
Game.SetDynaLoadData("l3z1.p3d;l3r1.p3d;l3r5.p3d;l3z2.p3d;");

Game.UsePedGroup(1);

--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l3_sr2p.p3d;");
Game.StreetRacePropsUnload("l3_sr2p.p3d:");

Game.AddStage(0);
	Game.DisableHitAndRun();
	Game.SetHUDIcon( "race" );
	Game.PlacePlayerCar("current", "sr2_carstart");
	Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
	Game.StartCountdown("count","lisa");
		Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "2", 4000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds
	Game.SetStageMessageIndex(223);
	Game.RESET_TO_HERE();
	Game.NoTrafficForStage();

	Game.AddStageVehicle("marge_v","sr2_AI_carstart1","waypoint","Missions\\level03\\sr2_1st.con","marge");
	Game.SetStageAIRaceCatchupParams("marge_v", 80, 1.0, 1.2, 2.5);
	Game.AddStageVehicle("sportsA","sr2_AI_carstart2","waypoint","Missions\\level03\\sr2_2nd.con");
	Game.SetStageAIRaceCatchupParams("sportsA", 80, 0.8, 1.0, 2.0);
	Game.AddStageVehicle("compactA","sr2_AI_carstart3","waypoint","Missions\\level03\\sr2_3rd.con");
	Game.SetStageAIRaceCatchupParams("compactA", 80, 0.8, 1.0, 2.0);
--	AddStageVehicle("pickupA","sr2_AI_carstart4","waypoint","Missions\level03\sr2_4th.con");
--	SetStageAIRaceCatchupParams("pickupA", 80, 0.8, 1.0, 2.0);
	Game.AddStageWaypoint( "sr2_waypoint1" );
	--AddStageWaypoint( "sr2_waypoint2" );
	Game.AddStageWaypoint( "sr2_waypoint3" );
	Game.AddStageWaypoint( "sr2_waypoint4" );
	Game.AddStageWaypoint( "sr2_waypoint5" );
	Game.AddStageWaypoint( "sr2_waypoint5b" );
	Game.AddStageWaypoint( "sr2_waypoint5c" );
	Game.AddStageWaypoint( "sr2_waypoint6" );
	Game.AddObjective( "race", "neither");
		Game.AddNPC("patty", "sr2_patty");
		Game.AddNPC("selma", "sr2_selma");
		Game.AddCollectible("sr2_waypoint1","carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AddCollectible("sr2_waypoint3","carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AddCollectible("sr2_waypoint4","carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AddCollectible("sr2_waypoint5","carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AddCollectible("sr2_waypoint6","carsphere");
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

Game.AddStage(1,"final");
	Game.AddObjective("dialogue");
		Game.AddNPC("patty", "sr2_patty");
		Game.AddNPC("selma", "sr2_selma");
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetDialogueInfo("patty","lisa","success",0);
		Game.SetDialoguePositions("sr2_patty","sr2_lisa_end","sr2_carstart");
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();

c_level = 3
c_mission = 9

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
