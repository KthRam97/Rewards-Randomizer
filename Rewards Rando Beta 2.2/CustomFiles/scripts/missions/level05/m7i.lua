Game.SelectMission("m7");

c_level = 5
c_mission = 7

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m7_carstart");
Game.SetDynaLoadData("l5z2.p3d;l5r1.p3d;l5r2.p3d;");
Game.InitLevelPlayerVehicle("bart_v","m7_carstart","OTHER");

Game.UsePedGroup(2);

--This is a forced car mission
Game.SetForcedCar();
Game.SetNumValidFailureHints( 5 );

Game.AddStage();
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(125);
	Game.SetHUDIcon( "museum" );
	Game.AddObjective("goto");
		Game.AddNPC("bart", "m7_bart_hide");
		Game.SetDestination("m7_AI_path4", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(30);
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "bart_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage();
 	Game.SetMaxTraffic(2);
	Game.SetStageMessageIndex(257);
	Game.SetHUDIcon( "key" );
	Game.AddStageVehicle("cCurator","m7_AI_1start","target","Missions\\level05\\M7dest.con");
	Game.SetVehicleAIParams( "cCurator", 15, 25 ); --  no shorctuts
	Game.SetStageAITargetCatchupParams( "cCurator", 50, 100);
--	crowflydistofwhenAIisnearenoughplayer, // when we'll apply no catchup (drive normally)
--	crowflydistofwhenAIistoofarfromplayer ); // when we'll perform most poorly for player to catchup

	Game.AddStageWaypoint( "m7_AI_path0" );
	Game.AddStageWaypoint( "m7_AI_path2" );
	Game.AddStageWaypoint( "m7_AI_path1" );
	Game.AddStageWaypoint( "m7_AI_path3" );
	Game.AddObjective("dump");
		Game.SetObjTargetVehicle("cCurator");
		Game.AddCollectible("m7_redkey","key");
	Game.CloseObjective();
	Game.AddStageTime(135);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "bart_v" );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage("final");
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(125);
	Game.SetHUDIcon( "museum" );
	Game.AddObjective("goto");
		Game.SetDestination("m7_AI_path4", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(30);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "bart_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.CloseMission();
