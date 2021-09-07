Game.SelectMission("sr1");

c_level = 7
c_mission = 8

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
--The TIME TRIAL
--Script set up for multipkle laps

Game.SetMissionResetPlayerInCar("sr1_carstart");
Game.SetDynaLoadData("l7z2.p3d;l7r1.p3d;l7r2.p3d;");

Game.UsePedGroup(1);

Game.SetMissionStartCameraName( "race1camShape" );
Game.SetMissionStartMulticontName( "race1cam" );
Game.SetAnimatedCameraName( "race1camShape" );
Game.SetAnimCamMulticontName( "race1cam" );

--Chuck: StreetRace Prop Load and Unload Setup
Game.StreetRacePropsLoad("l7_sr1p.p3d;");
Game.StreetRacePropsUnload("l7_sr1p.p3d:");


Game.AddStage(1);
Game.SetHUDIcon( "race" );
Game.DisableHitAndRun();
Game.PlacePlayerCar("current", "sr1_carstart");
Game.PutMFPlayerInCar( );  -- This makes the play auto reset into their car for this stage.
Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds
Game.NoTrafficForStage();
Game.SetStageMessageIndex(222);
Game.SetStageTime(70);
Game.RESET_TO_HERE();
Game.AddObjective( "race","neither");
		Game.AddNPC("zmale3", "sr1_patty");
		--AddNPC("selma", "sr1_selma");
Game.AddCollectible("sr1_waypoint1","carsphere");
Game.SetCollectibleEffect("wrench_collect");
Game.AddCollectible("sr1_waypoint2","carsphere");
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
Game.GoToPsScreenWhenDone();
Game.CloseStage();

Game.AddStage(2,"final");
	Game.AddObjective("dialogue");
		Game.AddNPC("zmale3", "sr1_patty");
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetDialogueInfo("zmale3","homer","success",0);
		Game.SetDialoguePositions("sr1_patty","sr1_homer_end","sr1_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
