Game.SelectMission("sr2");

c_level = 7
c_mission = 9

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
--The CIRCUIT RACE (with AI cars)
--Script set up for multipkle laps


Game.SetMissionResetPlayerInCar("sr2_carstart");
Game.SetDynaLoadData("l7z3.p3d;l7r2.p3d;l7r3.p3d;");

Game.UsePedGroup(2);

Game.SetMissionStartCameraName( "race2camShape" );
Game.SetMissionStartMulticontName( "race2cam" );
Game.SetAnimatedCameraName( "race2camShape" );
Game.SetAnimCamMulticontName( "race2cam" );

--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l7_sr2p.p3d;");
Game.StreetRacePropsUnload("l7_sr2p.p3d:");

Game.AddStage(1);
Game.SetHUDIcon( "race" );
Game.DisableHitAndRun();
Game.PlacePlayerCar("current", "sr2_carstart");
Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 2000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 2000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 2000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 500 ); -- duration time in milliseconds
Game.SetStageMessageIndex(223);
Game.RESET_TO_HERE();

Game.NoTrafficForStage();

Game.AddStageVehicle("cHears","sr2_AI_carstart1","race","Missions/level07/sr2_1st.con");
Game.SetVehicleAIParams( "cHears", -49, -50 );
Game.SetStageAIRaceCatchupParams("cHears", 80, 0.8, 1.11, 1.75);

Game.AddStageVehicle("ship","sr2_AI_carstart2","race","Missions/level07/sr2_2nd.con");
Game.SetVehicleAIParams( "ship", -49, -50 );
Game.SetStageAIRaceCatchupParams("ship", 80, 0.75, 1.1, 1.5);

Game.AddStageVehicle("coffin","sr2_AI_carstart3","race","Missions/level07/sr2_3rd.con");
Game.SetVehicleAIParams( "coffin", -49, -50 );
Game.SetStageAIRaceCatchupParams("coffin", 80, 0.75, 1.1, 1.5);

Game.AddStageWaypoint( "sr2_waypoint0" );
Game.AddStageWaypoint( "sr2_waypoint4" );
Game.AddStageWaypoint( "sr2_waypoint3" );
Game.AddStageWaypoint( "sr2_waypoint3a" );
Game.AddStageWaypoint( "sr2_waypoint3b" );
Game.AddStageWaypoint( "sr2_waypoint6" );
Game.AddStageWaypoint( "sr2_waypoint7" );

Game.AddObjective( "race","neither" );
Game.AddNPC("zfem1", "sr2_patty");


Game.AddCollectible("sr2_waypoint1","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr2_waypoint2","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr2_waypoint4","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr2_waypoint4a","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr2_waypoint4b","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr2_waypoint5","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr2_waypoint6","carsphere");
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

Game.GoToPsScreenWhenDone();
Game.CloseStage();

Game.AddStage(2,"final");
	Game.AddObjective("dialogue");
		Game.AddNPC("zfem1", "sr2_patty");
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetDialogueInfo("zfem1","homer","success",0);
		Game.SetDialoguePositions("sr2_patty","sr2_homer_end","sr2_carstart");
	Game.CloseObjective();
Game.CloseStage();


Game.CloseMission();
