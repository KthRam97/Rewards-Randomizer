Game.SelectMission("m2");

c_level = 7
c_mission = 2

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m2_carstart");
Game.SetDynaLoadData("l7z3.p3d;l7r2.p3d;l7r3.p3d;");

Game.UsePedGroup(3);

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(202);
	Game.SetHUDIcon( "playgrou" );
	Game.AddObjective( "goto" );
		Game.AddNPC("cbg", "m2_cbg_sd");
		Game.SetDestination( "m2_playground", "carsphere");
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

Game.AddStage("final");
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(84);
	Game.SetHUDIcon( "sports_v" );
	Game.SetMaxTraffic(3);
	Game.AddStageVehicle("cBlbart","m2_AI_carstart","evade","Missions\\level07\\M2chase.con");
	Game.SetVehicleAIParams( "cBlbart", 50, 51 ); -- all vehicles

--	AddStageVehicle("cBlbart","m2_AI_carstart","evade","Missions\level06\M3chase.con");
--	AddStageVehicle("skinn_v","m2_AI_carstart","evade","Missions\level07\M2chase.con");
	Game.AddStageWaypoint( "m2_AI_path19" );
	Game.AddStageWaypoint( "m2_AI_path1" );
	Game.AddStageWaypoint( "m2_AI_path10" );
	Game.AddStageWaypoint( "m2_AI_path" );
	Game.AddStageWaypoint( "m2_AI_path18" );
	Game.AddObjective("follow");
		Game.AddNPC("frink", "m3_frink_sd");
--		AddStageVehicle("frink_v","m3_frink_carstart","NULL","HardRace\AI_2nd.con");
--		AttachStatePropCollectible( "frink_v", "bombbarrel" );
		--SetDestination("m2_AI_path18");
		Game.SetObjTargetVehicle("cBlbart");
--		SetObjTargetVehicle("skinn_v");
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0, 200);
		Game.SetCondTargetVehicle("cBlbart");
--		SetCondTargetVehicle("skinn_v");
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.SetCompletionDialog("plant");
Game.CloseStage();

Game.CloseMission();

