Game.SelectMission("sr3");
--The CIRCUIT RACE (with AI cars)
--Script set up for multipkle laps

Game.SetAnimatedCameraName( "race3camShape" );
Game.SetAnimCamMulticontName( "race3cam" );

Game.SetMissionResetPlayerInCar("sr3_carstart");
Game.SetDynaLoadData("l3z4.p3d;l3r3.p3d;l3r4.p3d;");

Game.UsePedGroup(6);

--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l3_sr3p.p3d;");
Game.StreetRacePropsUnload("l3_sr3p.p3d:");


Game.AddStage(0);
Game.SetHUDIcon( "race" );
Game.DisableHitAndRun();
Game.PlacePlayerCar("current", "sr3_carstart");
Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.

Game.StartCountdown("count");
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 900 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds

Game.SetStageMessageIndex(224);
Game.RESET_TO_HERE();
Game.NoTrafficForStage();

Game.AddStageVehicle("marge_v","sr3_AI_carstart1","waypoint","Missions\\level03\\sr3_1st.con","marge");
	Game.SetVehicleAIParams( "marge_v", 50, 51 );
	Game.SetStageAIRaceCatchupParams("marge_v", 80, 0.9, 1.1, 2.2);
Game.AddStageVehicle("sportsA","sr3_AI_carstart2","waypoint","Missions\\level03\\sr3_2nd.con");
	Game.SetVehicleAIParams( "sportsA", 50, 51 );
	Game.SetStageAIRaceCatchupParams("sportsA", 80, 0.8, 1.0, 2.0);
--AddStageVehicle("compactA","sr3_AI_carstart3","waypoint","Missions\level03\sr3_3rd.con");
--	SetVehicleAIParams( "compactA", 50, 51 );
--	SetStageAIRaceCatchupParams("compactA", 80, 0.8, 1.0, 2.0);
Game.AddStageVehicle("pickupA","sr3_AI_carstart4","waypoint","Missions\\level03\\sr3_4th.con");
	Game.SetVehicleAIParams( "pickupA", 50, 51 );
	Game.SetStageAIRaceCatchupParams("pickupA", 80, 0.8, 1.0, 2.0);

Game.AddStageWaypoint( "sr3_waypoint1" );
Game.AddStageWaypoint( "sr3_navpoint1" );
--AddStageWaypoint( "sr3_stairs" );
--AddStageWaypoint( "sr3_topstairs" );
Game.AddStageWaypoint( "sr3_navpoint2" );

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

Game.AddCollectible("sr3_waypoint5","finish_line");
	Game.SetCollectibleEffect("wrench_collect");
Game.CloseObjective();

Game.AddCondition( "damage" );
	Game.SetCondMinHealth( 0.0 );
	Game.SetCondTargetVehicle( "current");
Game.CloseCondition();
Game.AddCondition("outofvehicle");
	Game.SetCondTime( 10000 );
Game.CloseCondition();

Game.AddCondition("position");
Game.SetConditionPosition(1);
Game.CloseCondition();
Game.CloseStage();

Game.AddStage(1,"final");
	Game.AddObjective("dialogue");
		Game.AddNPC("patty", "sr3_patty");
		Game.AddNPC("selma", "sr3_selma");
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetDialogueInfo("patty","lisa","success",0);
		Game.SetDialoguePositions("sr3_patty","sr3_lisa_end","sr3_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

c_level = 3
c_mission = 10

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
