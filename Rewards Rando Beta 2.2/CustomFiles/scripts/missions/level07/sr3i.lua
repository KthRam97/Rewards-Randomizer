Game.SelectMission("sr3");

c_level = 7
c_mission = 10

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
--The CIRCUIT RACE (with AI cars)
--Script set up for multipkle laps

Game.SetMissionResetPlayerInCar("sr3_carstart");
--SetDynaLoadData("l7z3.p3d;l7r3.p3d;l7r2.p3d;");
Game.SetDynaLoadData("l7z3.p3d;l7r2.p3d;l7r3.p3d;");

Game.UsePedGroup(3);

Game.SetMissionStartCameraName( "race3camShape" );
Game.SetMissionStartMulticontName( "race3cam" );
Game.SetAnimatedCameraName( "race3camShape" );
Game.SetAnimCamMulticontName( "race3cam" );

--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l7_sr3p.p3d;");
Game.StreetRacePropsUnload("l7_sr3p.p3d:");


Game.AddStage(1);
Game.SetHUDIcon( "race" );
Game.DisableHitAndRun();
Game.PlacePlayerCar("current", "sr3_carstart");
Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 2000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 2000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 2000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 500 ); -- duration time in milliseconds
Game.SetStageMessageIndex(224);
Game.RESET_TO_HERE();
Game.NoTrafficForStage();

Game.AddStageVehicle("cHears","sr3_AI_carstart1","race","Missions/level07/sr3_1st.con");
	Game.SetVehicleAIParams( "cHears", 50, 51 );
	Game.SetStageAIRaceCatchupParams("cHears", 80, 0.8, 1.11, 1.75);
Game.AddStageVehicle("coffin","sr3_AI_carstart2","race","Missions/level07/sr3_2nd.con");
	Game.SetVehicleAIParams( "coffin", 50, 51);
	Game.SetStageAIRaceCatchupParams("coffin", 80, 0.75, 1.1, 1.5);
Game.AddStageVehicle("ship","sr3_AI_carstart3","race","Missions/level07/sr3_4th.con");
	Game.SetVehicleAIParams( "ship", 50, 51 );
	Game.SetStageAIRaceCatchupParams("ship", 80, 0.75, 1.1, 1.5);
--AddStageVehicle("hallo","sr3_AI_carstart4","race","Missions/level07/sr3_4th.con");
--	SetVehicleAIParams( "hallo", 50, 51 );
--	SetStageAIRaceCatchupParams("hallo", 80, 0.75, 1.1, 1.5);

--ActivateVehicle("cHears","NULL","race");
--ActivateVehicle("hallo","NULL","race");
--ActivateVehicle("coffin","NULL","race");
--ActivateVehicle("ship","NULL","race");
Game.AddStageWaypoint( "sr3_waypoint3" );
Game.AddStageWaypoint( "sr3_waypoint5" );
Game.AddStageWaypoint( "sr3_waypoint8" );
Game.AddStageWaypoint( "sr3_waypoint14" );

Game.AddObjective("race","neither" );
Game.AddNPC("zmale1", "sr3_patty");

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
Game.AddCollectible("sr3_waypoint7","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr3_waypoint8","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr3_waypoint9","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr3_waypoint10","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr3_waypoint11","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr3_waypoint12","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr3_waypoint13","carsphere");
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
Game.GoToPsScreenWhenDone();
Game.CloseStage();

Game.AddStage(2,"final");
	Game.AddObjective("dialogue");
		Game.AddNPC("zmale1", "sr3_patty");
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetDialogueInfo("zmale1","homer","success",0);
		Game.SetDialoguePositions("sr3_patty","sr3_homer_end","sr3_car_end");
	Game.CloseObjective();
Game.CloseStage();


Game.CloseMission();
