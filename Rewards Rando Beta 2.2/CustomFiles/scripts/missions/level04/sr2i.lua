Game.SelectMission("sr2");
--The CIRCUIT RACE (with AI cars)
--Script set up for multipkle laps

c_level = 4
c_mission = 9

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetAnimatedCameraName( "race2camShape" );
Game.SetAnimCamMulticontName( "race2cam" );

Game.SetMissionResetPlayerInCar("sr2_carstart");
Game.SetDynaLoadData("l4r3.p3d;l4z4.p3d;l4r4b.p3d;");

Game.UsePedGroup(4);

--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l4_sr2p.p3d;");
Game.StreetRacePropsUnload("l4_sr2p.p3d:");

Game.AddStage(0);
Game.SetHUDIcon( "race" );
Game.DisableHitAndRun();
Game.PlacePlayerCar("current", "sr2_carstart");
Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1200 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds
Game.SetStageMessageIndex(223);
Game.RESET_TO_HERE();
Game.NoTrafficForStage();

Game.AddStageVehicle("apu_v","sr2_AI_carstart1","race","Missions\\level04\\sr2_1st.con","apu");
	Game.SetVehicleAIParams( "apu_v", 50, 51 );
	Game.SetStageAIRaceCatchupParams("apu_v", 80, 0.9, 1.2, 2.5);
Game.AddStageVehicle("nuctruck","sr2_AI_carstart2","race","Missions\\level04\\sr2_2nd.con");
	Game.SetVehicleAIParams( "nuctruck", 50, 51 );
	Game.SetStageAIRaceCatchupParams("nuctruck", 80, 0.8, 1.0, 2.0);
--AddStageVehicle("compactA","sr2_AI_carstart3","race","Missions\level04\sr2_3rd.con");
--	SetVehicleAIParams( "compactA", 50, 51 );
--	SetStageAIRaceCatchupParams("compactA", 80, 0.8, 1.0, 2.0);
Game.AddStageVehicle("garbage","sr2_AI_carstart4","race","Missions\\level04\\sr2_4th.con");
	Game.SetVehicleAIParams( "garbage", 50, 51 );
	Game.SetStageAIRaceCatchupParams("garbage", 80, 0.8, 1.0, 2.0);


Game.AddStageWaypoint( "sr2_waypoint1" );
Game.AddStageWaypoint( "sr2_waypoint2" );
Game.AddStageWaypoint( "sr2_waypoint3" );
Game.AddStageWaypoint( "sr2_waypoint3b" );
Game.AddStageWaypoint( "sr2_waypoint4" );
Game.AddStageWaypoint( "sr2_waypoint5" );

Game.AddObjective( "race", "neither");
Game.DisableHitAndRun();
Game.AddNPC("patty", "sr2_patty");
Game.AddNPC("selma", "sr2_selma");

Game.AddCollectible("sr2_waypoint1","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr2_waypoint2","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr2_waypoint3","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr2_waypoint3b","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr2_waypoint5","carsphere");
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

Game.AddStage(1, "final");
	Game.AddObjective("dialogue");
		Game.AddNPC("patty", "sr2_patty");
		Game.AddNPC("selma", "sr2_selma");
		Game.SetDialogueInfo("patty","marge","success",0);
		Game.SetDialoguePositions("sr2_patty","sr2_marge","sr2_AI_carstart2");
	Game.CloseObjective();
Game.CloseStage();


Game.CloseMission();
