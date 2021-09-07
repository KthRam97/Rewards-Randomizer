Game.SelectMission("sr3");

c_level = 2
c_mission = 10
--The CIRCUIT RACE (with AI cars)
--Script set up for multiple laps

Game.SetAnimatedCameraName( "race3camShape" );
Game.SetAnimCamMulticontName( "race3cam" );

Game.SetMissionResetPlayerInCar("sr3_carstart");
Game.SetDynaLoadData("l2z1.p3d;l2r1.p3d;l2r4.p3d;");

Game.UsePedGroup(0);

--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l2_sr3p.p3d;");
Game.StreetRacePropsUnload("l2_sr3p.p3d:");


Game.AddStage(0);
Game.SetHUDIcon( "race" );
Game.DisableHitAndRun();
Game.PlacePlayerCar("current", "sr3_carstart");
Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
Game.StartCountdown("count");
	Game.AddToCountdownSequence( "5", 800 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "5", 800 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "5", 800 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "4", 400 ); -- duration time in milliseconds

Game.SetStageMessageIndex(224);
Game.RESET_TO_HERE();
Game.NoTrafficForStage();
Game.AddStageVehicle("lisa_v","sr3_lisa_carstart1","race","Missions\\level02\\sr3_1st.con","lisa");
	Game.SetVehicleAIParams( "lisa_v", 50, 51 );
	Game.SetStageAIRaceCatchupParams("lisa_v", 80, 1, 1.25, 2.5);
Game.AddStageVehicle("sportsA","sr3_AI_carstart2","race","Missions\\level02\\sr3_2nd.con");
	Game.SetVehicleAIParams( "sportsA", 50, 51 );
	Game.SetStageAIRaceCatchupParams("sportsA", 80, 0.7, 1.0, 1.5);
Game.AddStageVehicle("taxiA","sr3_AI_carstart3","race","Missions\\level02\\sr3_3rd.con");
	Game.SetVehicleAIParams( "taxiA", 50, 51 );
	Game.SetStageAIRaceCatchupParams("taxiA", 80, 0.7, 1.0, 1.5);
--AddStageVehicle("sedanB","sr3_AI_carstart4","race","Missions\level02\sr3_4th.con");
--	SetVehicleAIParams( "sedanB", 50, 51 );
--	SetStageAIRaceCatchupParams("sedanB", 80, 0.7, 1.0, 1.5);
Game.AddStageWaypoint( "sr3_nav1" );
Game.AddStageWaypoint( "sr3_nav2" );
Game.AddStageWaypoint( "sr3_nav3" );
Game.AddStageWaypoint( "sr3_nav4" );

Game.AddObjective( "race","neither" );
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
		--AmbientAnimationRandomize( 1, 0 );      // ( pc=0, npc=1) (nonrandom=0, random=1)
		--AmbientAnimationRandomize( 0, 0 );      <<<===---  ASK IAN ABOUT THIS COMMAND
		--AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
		--AddAmbientNpcAnimation( "none" );
		--AddAmbientNpcAnimation( "dialogue_thinking" );
		--AddAmbientPcAnimation( "none" );
		--AddAmbientPcAnimation( "dialogue_yes" );
		--AddAmbientPcAnimation( "none" );
		--AddAmbientPcAnimation( "dialogue_hands_in_air" );
		--SetConversationCam( 3, "pc_far" );
		--SetConversationCamNpcName("npc_near");
		--SetConversationCamPcName("pc_near");            <<<===--- ASK IAN ABOUT THIS COMMAND.
		Game.SetDialogueInfo("patty","bart","success",0);
		Game.SetDialoguePositions("sr3_patty","sr3_bart_end","sr3_car_end");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
