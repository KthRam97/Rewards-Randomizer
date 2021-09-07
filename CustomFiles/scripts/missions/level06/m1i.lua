Game.SelectMission("m1");

c_level = 6
c_mission = 1

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m1_otto_carstart");
Game.SetDynaLoadData("l6z1.p3d;l6r1.p3d;l6r5.p3d;l6r5_dam.p3d;");
Game.InitLevelPlayerVehicle("otto_v","m1_otto_carstart","OTHER");
Game.SetNumValidFailureHints( 5 );
Game.UsePedGroup(0);

Game.SetForcedCar();

Game.AddStage(3);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(69);
	Game.SetHUDIcon( "kids" );

	Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds

	Game.AddObjective("delivery", "neither");
		Game.AddNPC("otto", "m1_otto_hide");
		Game.AddCollectible( "m1_waypoint_0", "s_girl1");
		Game.AddCollectible( "m1_waypoint_1", "s_boy1");
		Game.AddCollectible( "m1_waypoint_2", "s_boy2");
		Game.AddCollectible( "m1_waypoint_2b", "s_girl2");
		Game.AddCollectible( "m1_waypoint_2c", "s_boy1");
		Game.AddCollectible( "m1_waypoint_3", "s_girl1");
		Game.AddCollectible( "m1_waypoint_4", "s_girl2");
		Game.AddCollectible( "m1_waypoint_4b", "s_girl2");
		Game.AddCollectible( "m1_waypoint_5", "s_boy1");
		Game.AddCollectible( "m1_waypoint_5a", "s_boy1");
		Game.AddCollectible( "m1_waypoint_6", "s_boy2");
		Game.AddCollectible( "m1_waypoint_6b", "s_boy2");
		Game.AddCollectible( "m1_waypoint_6c", "s_boy2");
		Game.AddCollectible( "m1_waypoint_7", "s_girl2");
		Game.AddCollectible( "m1_waypoint_7b", "s_girl2");
	Game.CloseObjective();
	Game.SetStageTime(105);
	Game.AddCondition( "timeout" );
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "otto_v" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(209);
	Game.SetHUDIcon( "krustylu" );
	Game.AddObjective( "goto" );
		Game.AddNPC( "brn_unf", "m2_barney_sd" );
		Game.SetDestination( "m1_waypoint_8", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition( "timeout" );
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "otto_v" );
	Game.CloseCondition();
	Game.SetFadeOut(1.0);
	Game.SwapInDefaultCar();
	Game.SetSwapDefaultCarLocator("level6_carstart");
	Game.SetSwapForcedCarLocator("m1_otto_carend");
	Game.SetSwapPlayerLocator("m1_bart_end");
Game.CloseStage();

Game.AddStage("final");
 Game.AddObjective("timer");
  Game.SetDurationTime(3);
 Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();


