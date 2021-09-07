Game.SelectMission("sr3");
--The CIRCUIT RACE (with AI cars)
--Script set up for multipkle laps

c_level = 4
c_mission = 10

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("sr3_carstart");
Game.SetDynaLoadData("l4r7.p3d;l4z1.p3d;l4r1.p3d;l4z2.p3d;");

Game.UsePedGroup(6);

Game.SetAnimatedCameraName( "race3camShape" );
Game.SetAnimCamMulticontName( "race3cam" );


--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l4_sr3p.p3d;");
Game.StreetRacePropsUnload("l4_sr3p.p3d:");

Game.AddStage(0);
Game.SetHUDIcon( "race" );
Game.PlacePlayerCar("current", "sr3_carstart");
Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
Game.StartCountdown("count");
	Game.AddToCountdownSequence( "6", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "12", 800 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 800 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds
Game.SetStageMessageIndex(224);
Game.RESET_TO_HERE();
Game.NoTrafficForStage();

Game.AddStageVehicle("frink_v","sr3_AI_carstart3","race","Missions\\level04\\sr3_1st.con","frink");
Game.SetVehicleAIParams( "frink_v", 15, 20 );
Game.SetStageAIRaceCatchupParams("frink_v", 80, 0.9, 1.2, 2.5);

Game.AddStageWaypoint( "sr3_waypoint1" );
Game.AddStageWaypoint( "sr3_waypoint2" );
Game.AddStageWaypoint( "sr3_waypoint3" );

Game.AddObjective( "race" );
Game.DisableHitAndRun();
Game.AddNPC("patty", "sr3_patty");
Game.AddNPC("selma", "sr3_selma");
Game.AddCollectible("sr3_waypoint1","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr3_waypoint2","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr3_waypoint3","carsphere");
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

Game.AddStage(1,"final");
	Game.AddObjective("dialogue");
		Game.AddNPC("patty", "sr3_patty");
		Game.AddNPC("selma", "sr3_selma");
		Game.SetDialogueInfo("patty","marge","success",0);
		Game.SetDialoguePositions("sr3_patty","sr3_marge","sr3_car_end");
	Game.CloseObjective();
Game.CloseStage();


Game.CloseMission();
