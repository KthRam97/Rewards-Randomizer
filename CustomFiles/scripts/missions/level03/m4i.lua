Game.SelectMission("m4");

Game.SetMissionResetPlayerInCar("m4_carstart");
Game.SetDynaLoadData("l3z5.p3d;l3r5.p3d;l3r4.p3d;l3r5_dam.p3d;");

Game.SetNumValidFailureHints( 5 );

Game.UsePedGroup(4);


Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(181);
	Game.SetHUDIcon( "observ" );
	Game.AddObjective("goto");
		Game.SetDestination("m4_observatory_sd", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(184);
	Game.SetHUDIcon( "redhat" );
	Game.AddStageVehicle("cSedan","m4_AI_carstart_1","NULL","Missions\\level03\\M4dest.con");
	Game.AddObjective("goto");
		Game.SetDestination("m4_redhat","rhat");
		Game.TurnGotoDialogOff();
	Game.CloseObjective();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(97);
	Game.SetHUDIcon( "bsedan_v");
	Game.SetStageTime(120);
	Game.ActivateVehicle("cSedan","NULL","target");
	Game.SetVehicleAIParams( "cSedan", -10, -9 );   -- very dumb - no shortcuts
	Game.AddStageWaypoint( "m4_AI_1_path8" );
	Game.AddStageWaypoint( "m4_AI_2_path2" );
	Game.AddStageWaypoint( "m4_AI_1_path3" );
	Game.AddStageWaypoint( "m4_AI_2_path2" );
	Game.AddObjective("destroy", "neither");
		Game.SetObjTargetVehicle("cSedan");
	Game.CloseObjective();
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(185);
	Game.SetHUDIcon( "aztec" );
	Game.AddObjective("goto");
		Game.AddStageVehicle("cSedan","m4_AI_carstart_8","NULL","Missions\\level03\\M4dest.con");
		Game.SetDestination("m4_AI_carstart_2", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(97);
	Game.SetHUDIcon( "bsedan_v");
	Game.SetStageTime(90);
	Game.ActivateVehicle("cSedan","NULL","target");
	Game.AddStageWaypoint( "m4_AI_2_path2" );
	Game.AddStageWaypoint( "m4_AI_2_path8" );
	Game.AddStageWaypoint( "m4_AI_3_path9" );
	Game.AddObjective("destroy");
		Game.SetObjTargetVehicle("cSedan");
	Game.CloseObjective();
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition( "damage", "neither");
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(186);
	Game.SetHUDIcon( "planethy" );
	Game.AddObjective("goto");
		Game.AddStageVehicle("cSedan","m4_AI_carstart_3","NULL","Missions\\level03\\M4dest.con");
		Game.SetDestination("m4_carstart_3", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage("final");
	Game.SetMaxTraffic(3); --for this race, reduce traffic to prevent overwhelming the user
	Game.SetStageMessageIndex(97);
	Game.SetHUDIcon( "bsedan_v" );
	Game.SetStageTime(75);
	Game.ActivateVehicle("cSedan","NULL","target");
	Game.AddStageWaypoint( "m4_AI_2_path2" );
	Game.AddStageWaypoint( "m4_AI_1_path3" );
	Game.AddStageWaypoint( "m4_AI_3_path9" );
	Game.AddObjective("destroy", "neither");
		Game.SetObjTargetVehicle("cSedan");
	Game.CloseObjective();
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.SetCompletionDialog("empty");
Game.CloseStage();

Game.CloseMission();

c_level = 3
c_mission = 4

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
