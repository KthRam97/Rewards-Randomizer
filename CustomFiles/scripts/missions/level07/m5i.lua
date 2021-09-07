Game.SelectMission("m5");

c_level = 7
c_mission = 5

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerOutCar("m5_homertalk", "m5_carstart");
Game.SetDynaLoadData("l7z6.p3d;l7r6.p3d;");

Game.UsePedGroup(5);

Game.AddStage(1);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(220);
	Game.SetHUDIcon( "map" );
	Game.AddObjective("goto");
		Game.SetDestination("m5_map", "map");
	Game.CloseObjective();
--	AddObjective( "delivery" );
--		AddCollectible( "m5_map", "map" );
--	CloseObjective();
	Game.SetStageTime(30);
	Game.AddCondition("timeout");
	Game.CloseCondition();
--	ShowStageComplete();
Game.CloseStage();

Game.AddStage(2);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
	Game.SetStageTime(30);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(3);
	Game.AddCollectibleStateProp("bombbarrel","m5_barrel1", 2);
	Game.SetStageMessageIndex(221);
	Game.SetHUDIcon( "barrel" );
	Game.AddObjective( "pickupitem" );
		Game.SetPickupTarget("bombbarrel");
	Game.CloseObjective();
	Game.SetStageTime(100);
	Game.AddCondition("timeout");
	Game.CloseCondition();
--	ShowStageComplete();
Game.CloseStage();

Game.AddStage(4);
	Game.SetStageMessageIndex(202);
	Game.SetHUDIcon( "playgrou" );
	Game.AddObjective( "goto" );
		Game.AddNPC("snake", "m2_cbg_sd");
--		AddStageVehicle("snake_v","m6_snake_carstart","NULL","HardRace\AI_2nd.con");
		Game.SetDestination( "m2_playground", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AllowRockOut();
	Game.CloseObjective();
	Game.AddCondition( "keepbarrel", 1 );
	Game.CloseCondition();
	Game.SetStageTime(100);
	Game.AddCondition( "timeout" );
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
	Game.SetCompletionDialog("ashtray");
Game.CloseStage();

Game.CloseMission();

