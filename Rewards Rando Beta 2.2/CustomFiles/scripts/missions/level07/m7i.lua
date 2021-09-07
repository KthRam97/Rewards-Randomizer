Game.SelectMission("m7");

Game.SetMissionResetPlayerInCar("m7_grampa_carstart");
Game.SetDynaLoadData("l7z3.p3d;l7r2.p3d;l7r3.p3d;");
Game.InitLevelPlayerVehicle("gramR_v","m7_grampa_carstart","OTHER");
Game.SetNumValidFailureHints( 5 );
Game.UsePedGroup(3);

Game.AddCollectibleStateProp("bombbarrel","m7_barrel", 2);

--This is a forced car mission
Game.SetForcedCar();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(235);
	Game.SetHUDIcon( "pwrplant" );

	Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds

	Game.AddObjective( "goto" );
--		RemoveNPC( "grandpa" );
		Game.AddNPC( "grandpa", "m7_grampa_hide" );
		Game.AddStageVehicle("cBlbart","m7_blacksedan","NULL","Missions\\level07\\M7race.con");
		Game.SetDestination( "m7_race_start" );--<<- this should be m7_race_start
	Game.CloseObjective();
	Game.SetStageTime(90);--<<- this should be 90
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "gramR_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(249);
	Game.SetHUDIcon( "sports_v" );
	Game.AddStageWaypoint( "m7_waypoint1" );
	Game.AddStageWaypoint( "m7_waypoint2" );
	Game.AddStageWaypoint( "m7_race_finish" );
	Game.ActivateVehicle( "cBlbart","NULL","race" );
	Game.AddObjective( "race" );
		Game.AddCollectible( "m7_race_finish", "finish_line");
--		SetCollectibleEffect("finish_line_col");
	Game.CloseObjective();
	Game.AddCondition( "position" );
		Game.SetConditionPosition(1);
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "gramR_v" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(221);
	Game.SetHUDIcon( "barrel" );
	Game.SetStageTime(60);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddObjective( "pickupitem" );
		Game.SetPickupTarget("bombbarrel");
	Game.CloseObjective();
--	ShowStageComplete();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "gramR_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(202);
	Game.SetHUDIcon( "playgrou" );
	Game.AddStageVehicle("cBlbart","m7_blacksedan2","NULL","Missions\\level07\\M7race.con");
	Game.AddObjective( "goto" );
		Game.SetDestination( "m7_blacksedan2_trigger", "carsphere");
	Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(60);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "gramR_v" );
	Game.CloseCondition();
	Game.AddCondition("keepbarrel", 1);
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(265);
	Game.SetHUDIcon( "sports_v" );
	Game.ActivateVehicle( "cBlbart","NULL","chase" );
	Game.AddObjective( "losetail" );
		Game.SetObjTargetVehicle( "cBlbart" );
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.AddStageTime(40);-- <<--- Adding stage time so not too make is so hard
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "gramR_v" );
	Game.CloseCondition();
	Game.StageStartMusicEvent("L7_drama");
	Game.AddCondition("keepbarrel", 2);
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(202);
	Game.SetHUDIcon( "playgrou" );
	Game.AddObjective( "goto" );
		Game.SetDestination( "m2_playground", "carsphere");
	Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(30); -- setting stage time to make it hard
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "gramR_v" );
	Game.CloseCondition();
	Game.AddCondition("keepbarrel", 3);
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage("final");
	Game.SetStageMessageIndex(219);
	Game.SetHUDIcon( "ufo" );
	Game.AddObjective("destroyboss");
		Game.AddCondition("damage");
		Game.SetObjTargetBoss("Planet Express Ship");
		Game.CloseCondition();
	Game.CloseObjective();
	Game.AddCondition("keepbarrel", 4);
	Game.CloseCondition();
	Game.AddStageTime(10);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
Game.CloseStage();

Game.CloseMission();
