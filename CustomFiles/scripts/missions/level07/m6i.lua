Game.SelectMission("m6");

c_level = 7
c_mission = 6

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m6_snake_carstart");
Game.SetDynaLoadData("l7z3.p3d;l7r2.p3d;l7r3.p3d;");
Game.InitLevelPlayerVehicle("snake_v","m6_snake_carstart","OTHER");
Game.SetNumValidFailureHints( 5 );
Game.UsePedGroup(3);

Game.AddCollectibleStateProp("bombbarrel","m6_barrel1", 2);

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
		Game.AddNPC("snake", "m6_snake_hide");
		Game.AddStageVehicle("cBlbart","m6_AI_carstart","NULL","Missions\\level07\\M6race.con");
		Game.SetDestination( "m6_AI_spawn", "carsphere");
--		SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(100);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(265);
	Game.SetMaxTraffic(3);
	Game.SetHUDIcon( "sports_v" );
	Game.AddStageWaypoint( "m6_waypoint" );
	Game.ActivateVehicle( "cBlbart","NULL","chase" );
	Game.AddObjective( "losetail" );
		Game.SetObjTargetVehicle("cBlbart");
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.ShowStageComplete();
	Game.StageStartMusicEvent("L6_drama");
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(221);
	Game.SetHUDIcon( "barrel" );
	Game.AddObjective( "pickupitem" );
		Game.SetPickupTarget("bombbarrel");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
	Game.SetStageTime(70);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(202);
	Game.SetHUDIcon( "playgrou" );
	Game.AddObjective( "goto" );
		Game.AddNPC("grandpa", "m2_cbg_sd");
--		AddStageVehicle("gramR_v","m7_grampa_carstart","NULL","HardRace\AI_2nd.con");
-- NO MEMORY for gramR_v - an AI car is already loaded
		Game.SetDestination( "m2_playground", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(95);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
	Game.AddCondition( "keepbarrel", 1 );
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
	Game.AddCondition( "keepbarrel", 2 );
	Game.CloseCondition();
	Game.AddStageTime(10);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.SetCompletionDialog("sayonara","snake");
Game.CloseStage();

Game.CloseMission();
