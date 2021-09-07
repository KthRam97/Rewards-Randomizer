Game.SelectMission("m3");

c_level = 1
c_mission = 3

Game.SetMissionResetPlayerInCar("m3_carstart");
Game.SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;");

Game.SetNumValidFailureHints( 5 );

Game.UsePedGroup( 1 );

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(253);
	Game.SetHUDIcon("kburger");
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.AddNPC("lenny", "m3_lenny");
		Game.SetDestination("m3_lardlads", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(8);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(131);
	Game.SetHUDIcon( "kwike" );
	Game.AddStageVehicle("smith_v","m4_smithers_carstart","NULL","Missions\\level01\\M3dest.con", "smithers");
	Game.AddObjective("goto");
		Game.SetDestination("m3_smithers_chase_start", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(90);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(7, "final");
	Game.SetStageMessageIndex(7);
	Game.SetHUDIcon( "smith_v" );
	Game.ActivateVehicle("smith_v","NULL","target");
	Game.SetVehicleAIParams( "smith_v", -10, -9 );   -- no shortcuts

	Game.AddStageWaypoint( "m4_smithers_path3" );
	Game.AddStageWaypoint( "m4_smithers_path6" );
	Game.AddObjective("destroy","neither");
		Game.SetObjTargetVehicle("smith_v");
	Game.CloseObjective();
	Game.AddCondition("race");
		Game.SetCondTargetVehicle("smith_v");
	Game.CloseCondition();
	Game.AddStageMusicChange();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.StageStartMusicEvent("M3_drama");
	Game.SetCompletionDialog("convertible", "smithers");

Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

