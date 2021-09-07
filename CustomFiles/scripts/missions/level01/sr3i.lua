Game.SelectMission("sr3");

c_level = 1
c_mission = 10

--The CIRCUIT RACE (with AI cars)
--Script set up for multipkle laps

Game.SetAnimatedCameraName( "race3camShape" );
Game.SetAnimCamMulticontName( "race3cam" );

Game.SetMissionResetPlayerInCar("sr3_carstart");
Game.SetDynaLoadData("l1z2.p3d;l1r2.p3d;l1z3.p3d;");

Game.UsePedGroup(2);

--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l1_sr3p.p3d;");
Game.StreetRacePropsUnload("l1_sr3p.p3d:");

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
Game.AddStageVehicle("honor_v","sr3_AI_carstart2","evade","Missions\\level01\\sr3_1st.con","bart");
Game.SetStageAIRaceCatchupParams("honor_v", 80, 0.6, 1.0, 1.75);
Game.AddStageVehicle("schoolbu","sr3_AI_carstart3","target","Missions\\level01\\sr3_4th.con");
Game.SetStageAIRaceCatchupParams("schoolbu", 80, 0.6, 0.9, 1.25);
Game.AddStageVehicle("minivanA","sr3_AI_carstart1","race","Missions\\level01\\sr3_2nd.con");
Game.SetStageAIRaceCatchupParams("minivanA", 80, 0.6, 0.9, 1.25);
--AddStageVehicle("pickupA","sr3_AI_carstart4","target`","Missions\level01\sr3_2nd.con");
--SetStageAIRaceCatchupParams("pickupA", 80, 0.6, 0.9, 1.25);

Game.AddStageWaypoint( "sr3_navpoint1" );
Game.AddStageWaypoint( "sr3_navpoint2" );
Game.AddStageWaypoint( "sr3_navpoint3" );
Game.AddStageWaypoint( "sr3_navpoint4" );

Game.AddObjective( "race","intersection" );
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
Game.AddCollectible("sr3_finish","carsphere");
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
		Game.SetDialogueInfo("patty","homer","success",0);
		Game.SetDialoguePositions("sr3_patty","sr3_homer_end","sr3_car_end");
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
