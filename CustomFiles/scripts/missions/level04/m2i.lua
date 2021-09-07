Game.SelectMission("m2");

c_level = 4
c_mission = 2

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m2_carstart");
Game.SetDynaLoadData("l4z7.p3d;l4r6.p3d;l4r7.p3d;");

Game.UsePedGroup(6);
Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(24);
	Game.SetHUDIcon( "cletus_v" );
	Game.AddStageVehicle("cletu_v","m2_cletustruck_sd","NULL","Missions\\level04\\M2chase.con","cletus");
	Game.AddStageCharacter("marge", "", "", "current", "m2_carstart" );
	Game.AddStageWaypoint( "m2_waypoint1" );
	Game.AddStageWaypoint( "m2_waypoint1b" );
	Game.AddStageWaypoint( "m2_waypoint2" );
	Game.AddStageWaypoint( "m2_waypoint2a" );
	Game.AddStageWaypoint( "m2_waypoint3" );
	Game.AddStageWaypoint( "m2_waypoint4" );
	Game.AddStageWaypoint( "m2_waypoint5" );
	Game.AddStageWaypoint( "m2_waypoint6" );
	Game.StartCountdown("count");
		Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds
	Game.AddObjective("dump", "neither");
		Game.ActivateVehicle("cletu_v","m2_cletustruck_sd","evade");
		Game.SetVehicleAIParams( "cletu_v", 10, 20 );   -- random shortcuts
		Game.AddNPC("cletus","cletus_hide");
		Game.SetObjTargetVehicle("cletu_v");
		Game.AddCollectible("m2_stuff1","cola");
		Game.AddCollectible("m2_stuff1b","tomat");
		Game.AddCollectible("m2_stuff2","donut");
		Game.AddCollectible("m2_stuff3","wplanks");
		Game.AddCollectible("m2_stuff4","lwnchair");
		Game.AddCollectible("m2_stuff5","cola");
		Game.AddCollectible("m2_stuff6","donut");
		Game.BindCollectibleTo(0, 0);
		Game.BindCollectibleTo(1, 1);
		Game.BindCollectibleTo(2, 2);
		Game.BindCollectibleTo(3, 4);
		Game.BindCollectibleTo(4, 5);
		Game.BindCollectibleTo(5, 6);
		Game.BindCollectibleTo(6, 7);
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0,200);
		Game.SetCondTargetVehicle("cletu_v");
	Game.CloseCondition();
	Game.SetIrisWipe( 0.1 );
Game.CloseStage();


Game.AddStage("final"); -- gets Marge out of the Cra ready for dialogue in M3
	Game.AddObjective("timer");
		Game.AddStageCharacter("marge", "m2_marge_2", "", "current", "m2_marge_car2" );
		Game.AddNPC("cletus","m2_cletus_2");
		Game.RemoveDriver("cletus");
		Game.AddStageVehicle("cletu_v","m2_cletustruck_2","NULL","Missions\\level04\\M2chase.con");
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();


Game.CloseMission();
