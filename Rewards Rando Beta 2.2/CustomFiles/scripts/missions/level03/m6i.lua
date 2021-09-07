Game.SelectMission("m6");

Game.SetMissionResetPlayerInCar("m6_carstart");
Game.SetDynaLoadData("l3z3.p3d;l3r2.p3d;l3r3.p3d;");

Game.UsePedGroup(5);
Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(17);
	Game.SetHUDIcon( "fish" );
	Game.SetStageTime(115);
	Game.AddObjective("delivery");
		Game.AddCollectible("m6_fish_1","fish","fish");
		Game.AddCollectible("m6_fish_2","fish");
		Game.AddCollectible("m6_fish_3","fish","good");
		Game.AddCollectible("m6_fish_4","fish","plenty");
--AddCollectible("m6_fish_5","fish");
		Game.AddCollectible("m6_fish_6","fish");
		Game.AddCollectible("m6_fish_7","fish","tartar");
		Game.AddCollectible("m6_fish_8","fish");
		Game.AddCollectible("m6_fish_9","fish","nets");
		Game.AddCollectible("m6_fish_10","fish","wild");
		Game.AddCollectible("m6_fish_11","fish");
		Game.AddCollectible("m6_fish_12","fish");
		Game.AddCollectible("m6_fish_14","fish","brave");
		Game.AddCollectible("m6_fish_15","fish");
		Game.AddCollectible("m6_fish_16","fish");
		Game.AddCollectible("m6_fish_16a","fish","deep");
		Game.AddCollectible("m6_fish_13","fish");
		Game.AddCollectible("m6_fish_13a","fish");
		Game.AddCollectible("m6_fish_13b","fish");
		Game.AddCollectible("m6_fish_17","fish","savor");
		Game.AddCollectible("m6_fish_18","fish");
		Game.AddCollectible("m6_fish_19","fish");
		Game.AddCollectible("m6_fish_20","fish","ahab");
		Game.SetCollectibleEffect("carfish");
	Game.CloseObjective();
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.CloseMission();

c_level = 3
c_mission = 6

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end



