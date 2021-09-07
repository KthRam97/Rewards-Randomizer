Game.SelectMission("sr1");

c_level = 2
c_mission = 8
--The TIME TRIAL
--Script set up for multiple laps

Game.SetAnimatedCameraName( "race1camShape" );
Game.SetAnimCamMulticontName( "race1cam" );

Game.SetMissionResetPlayerInCar("sr1_carstart");
Game.SetDynaLoadData("l2z4.p3d;l2r3.p3d;l2r4.p3d;");

Game.UsePedGroup(5);

--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l2_sr1p.p3d;");
Game.StreetRacePropsUnload("l2_sr1p.p3d:");

Game.AddStage(0);
Game.SetHUDIcon( "race" );
Game.DisableHitAndRun();
Game.PlacePlayerCar("current", "sr1_carstart");
Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1200 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds
Game.SetStageMessageIndex(222);
Game.NoTrafficForStage();
Game.SetStageTime(80);
Game.RESET_TO_HERE();
Game.AddObjective( "race","neither" );
Game.AddNPC("patty", "sr1_patty");
Game.AddNPC("selma", "sr1_selma");
Game.AddCollectible("sr1_waypoint1","carsphere");
Game.SetCollectibleEffect("wrench_collect");
--AddCollectible("sr1_waypoint2");
Game.AddCollectible("sr1_waypoint3","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr1_waypoint4","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr1_waypoint5","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr1_waypoint6","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.SetRaceLaps(3);
Game.CloseObjective();
	Game.AddCondition("timeout");
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
		Game.AddNPC("patty", "sr1_patty");
		Game.AddNPC("selma", "sr1_selma");
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
		Game.SetDialoguePositions("sr1_patty","sr1_bart_end","sr1_carstart");
	Game.CloseObjective();

Game.CloseStage();


Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
