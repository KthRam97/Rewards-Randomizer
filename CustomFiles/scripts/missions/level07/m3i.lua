Game.SelectMission("m3");

c_level = 7
c_mission = 3

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m3_frink_carstart");
Game.SetDynaLoadData("l7z6.p3d;l7r6.p3d;");
Game.InitLevelPlayerVehicle("frink_v","m3_frink_carstart","OTHER");
Game.SetNumValidFailureHints( 5 );
Game.UsePedGroup(5);

--This is a forced car mission
Game.SetForcedCar();

Game.AddStage(3);
	Game.RESET_TO_HERE();
	Game.AddCollectibleStateProp("bombbarrel","m3_barrel_1", 2);
	--AddNPC("frink", "m3_frink_hide");
	Game.SetStageMessageIndex(221);
	Game.SetHUDIcon( "barrel" );
	Game.AddObjective( "pickupitem" );
		Game.AddNPC("frink", "m3_frink_hide");
		Game.SetPickupTarget("bombbarrel");
	Game.CloseObjective();
	Game.SetStageTime(120);
	Game.AddCondition("timeout");
	Game.CloseCondition();
--	ShowStageComplete();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "frink_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(1);
	Game.SetStageMessageIndex(202);
	Game.SetHUDIcon( "playgrou" );
	Game.SetMaxTraffic(4);
	Game.AddObjective( "goto" );
		Game.TurnGotoDialogOff();
		--AttachStatePropCollectible( "frink_v", "bombbarrel" );
		Game.SetDestination( "m2_playground", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(100);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "frink_v" );
	Game.CloseCondition();
	Game.AddCondition( "keepbarrel", 1 );
	Game.CloseCondition();
	--SetFadeOut( 1.0);
	--SwapInDefaultCar();
	--SetSwapDefaultCarLocator("m3_carstart");
	--SetSwapForcedCarLocator("m3_frink_carstart");
	--SetSwapPlayerLocator("m3_homer_start");
	Game.ShowStageComplete();
	Game.SetCompletionDialog("beam");
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
	Game.SetCompletionDialog("toxic","frink");
Game.CloseStage();

Game.CloseMission();
