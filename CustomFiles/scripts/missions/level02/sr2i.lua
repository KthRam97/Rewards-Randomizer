Game.SelectMission("sr2");

c_level = 2
c_mission = 9
--The CIRCUIT RACE (with AI cars)
--Script set up for multiple laps

Game.SetAnimatedCameraName( "race2camShape" );
Game.SetAnimCamMulticontName( "race2cam" );

Game.SetMissionResetPlayerInCar("sr2_carstart");
Game.SetDynaLoadData("l2z1.p3d;l2r1.p3d;l2r4.p3d;");

Game.UsePedGroup(0);


--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l2_sr2p.p3d;");
Game.StreetRacePropsUnload("l2_sr2p.p3d:");


Game.AddStage(0);
Game.SetHUDIcon( "race" );
Game.DisableHitAndRun();
Game.PlacePlayerCar("current", "sr2_carstart");
--PlacePlayerCar("current", "sr2_AI_carstart4");
Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1300 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "PSYCHE", 1400 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1200 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "PSYCHE", 1400 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 800 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds
Game.SetStageMessageIndex(223);
Game.RESET_TO_HERE();
Game.NoTrafficForStage();
--sr2_lisa_carstart1
Game.AddStageVehicle("lisa_v","sr2_AI_carstart2","race","Missions\\level02\\sr2_1st.con","lisa");
Game.SetStageAIRaceCatchupParams("lisa_v", 80, 1, 1.25, 2.5);
Game.AddStageVehicle("sportsA","sr2_AI_carstart3","race","Missions\\level02\\sr2_2nd.con");
Game.SetStageAIRaceCatchupParams("sportsA", 80, 0.7, 1.0, 2.0);
--AddStageVehicle("taxiA","sr2_AI_carstart4","race","Missions\level02\sr2_3rd.con");
Game.AddStageVehicle("sedanB","sr2_AI_carstart4","race","Missions\\level02\\sr2_4th.con");
Game.SetStageAIRaceCatchupParams("sedanB", 80, 0.7, 1.0, 2.0);
--AddStageWaypoint( "sr2_waypoint1" );
Game.AddStageWaypoint( "sr2_waypoint2" );
Game.AddStageWaypoint( "sr2_waypoint3" );
Game.AddStageWaypoint( "sr2_waypoint4" );
Game.AddStageWaypoint( "sr2_waypoint5" );
Game.AddStageWaypoint( "sr2_waypoint6" );

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
	Game.AddCollectible("sr2_waypoint6","carsphere");
	Game.SetCollectibleEffect("wrench_collect");
	Game.SetRaceLaps(4);
Game.CloseObjective();
Game.AddCondition("position");
	Game.SetConditionPosition(2);
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
		Game.SetDialoguePositions("sr2_patty","sr2_bart_end","sr2_carstart_end");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
