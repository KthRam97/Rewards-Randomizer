Game.SelectMission("m4");

c_level = 7
c_mission = 4

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m4_carstart");
Game.SetDynaLoadData("l7z3.p3d;l7r2.p3d;l7r3.p3d;l7i00.p3d@", "SpringfieldElementary");

Game.UsePedGroup(3);

Game.AddStage(0);
	Game.SetStageMessageIndex(268);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
	Game.SetStageTime(30);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.SetMusicState("Mission4", "Stage1");
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(8);
	Game.SetHUDIcon( "pwrplant" );
	Game.AddObjective( "goto" );
		Game.TurnGotoDialogOff();
		Game.AddStageVehicle("cBlbart","m4_AI_carstart","NULL","Missions\\level07\\M4chase.con");
		Game.SetDestination( "m4_carspawn", "carsphere");
--	SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(100);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.SetCompletionDialog("boss");
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(9);
	Game.SetHUDIcon( "sports_v" );
	Game.ActivateVehicle( "cBlbart","NULL","chase" );
	Game.AddObjective( "losetail" );
		Game.SetObjTargetVehicle( "cBlbart" );
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.ShowStageComplete();
	Game.StageStartMusicEvent("L4_drama");
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(8);
	Game.SetHUDIcon( "pwrplant" );
	Game.AddObjective( "goto" );
		Game.SetDestination( "m4_powerplant", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage("final");
	Game.SetStageMessageIndex(148);
	Game.SetHUDIcon( "pwrplant" );
	Game.AddObjective( "goto" );
		Game.AddNPC("burns", "m5_burns_sd");
		Game.SetDestination( "m4_burns_location" );
	Game.CloseObjective();
--	AddStageTime(90);
--	AddCondition( "timeout" );
--	CloseCondition();
	Game.SetMusicState("Mission4", "Stage2");
Game.CloseStage();

Game.CloseMission();
