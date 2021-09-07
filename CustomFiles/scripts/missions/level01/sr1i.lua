Game.SelectMission("sr1");

c_level = 1
c_mission = 8

--The TIME TRIAL
--Script set up for multiple laps

Game.SetAnimatedCameraName( "race1camShape" );
Game.SetAnimCamMulticontName( "race1cam" );

Game.SetMissionResetPlayerInCar("sr1_carstart");
Game.SetDynaLoadData("l1z7.p3d;l1r7.p3d;l1r6.p3d;");

Game.UsePedGroup(5);

--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l1_sr1p.p3d;");
Game.StreetRacePropsUnload("l1_sr1p.p3d:");

Game.AddStage(0);
Game.DisableHitAndRun();
Game.SetHUDIcon( "race" );
Game.PlacePlayerCar("current", "sr1_carstart");
Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1500 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 900 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds
Game.SetStageTime(95);
Game.SetStageMessageIndex(222);
--SetStageTime(150);
Game.RESET_TO_HERE();
Game.NoTrafficForStage();
Game.AddObjective( "race","neither");
--SetParTime(150);
Game.AddNPC("patty", "sr1_patty");
Game.AddNPC("selma", "sr1_selma");
Game.AddCollectible("sr1_waypoint1","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr1_waypoint2a","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr1_waypoint2b","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr1_waypoint3","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr1_waypoint4","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.SetRaceLaps(5);
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
		Game.SetDialogueInfo("patty","homer","success",0);
		Game.SetDialoguePositions("sr1_patty","sr1_homer","sr1_carstart");
	Game.CloseObjective();

Game.CloseStage();



Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
