Game.SelectMission("m5");

c_level = 5
c_mission = 5

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerOutCar("m5_apu_start","m5_carstart");
Game.SetDynaLoadData("l5z3.p3d;l5r2.p3d;l5r3.p3d;");

Game.UsePedGroup(4);
Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
		Game.AddStageVehicle("garbage","m5_garbagestart","NULL", "Missions\\level05\\M5dump.con", "none");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(259);
	Game.SetHUDIcon( "litter" );
	Game.ActivateVehicle("garbage","NULL","evade");
	Game.AddStageWaypoint( "m5_waypoint1" );
	Game.AddStageWaypoint( "m5_waypoint3" );
	Game.AddStageWaypoint( "m5_waypoint5" );
	Game.AddStageWaypoint( "m5_waypoint7" );
	Game.AddStageWaypoint( "m5_waypoint9" );
	Game.AddStageWaypoint( "m5_truckend" );
	Game.AddObjective("dump");
		Game.SetObjTargetVehicle("garbage");
		Game.AddCollectible("m5_truck1","litter");
		Game.AddCollectible("m5_truck2","litter");
		Game.AddCollectible("m5_truck3","litter");
		Game.AddCollectible("m5_truck4","litter");
		Game.AddCollectible("m5_truck5","litter");
		Game.BindCollectibleTo(0, 0);
		Game.BindCollectibleTo(1, 1);
		Game.BindCollectibleTo(2, 2);
		Game.BindCollectibleTo(3, 3);
		Game.BindCollectibleTo(4, 4);
	Game.CloseObjective();
	--AddCondition("followdistance");
	--	SetFollowDistances(0, 150);
	--	SetCondTargetVehicle("garbage");
	--CloseCondition();
	Game.SetStageTime(255);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(16);
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(76);
	Game.SetHUDIcon( "litter" );
	Game.AddObjective("delivery", "neither");
		Game.AddCollectible("m5_garbage1","litter");
		Game.AddCollectible("m5_garbage2","litter");
		Game.AddCollectible("m5_garbage21","litter");
		Game.AddCollectible("m5_garbage3","litter");
		Game.AddCollectible("m5_garbage4","litter");
		Game.AddCollectible("m5_garbage20","litter");
		Game.AddCollectible("m5_garbage19","litter");
		Game.AddCollectible("m5_garbage5","litter");
		Game.AddCollectible("m5_garbage22","litter");
		Game.AddCollectible("m5_garbage18","litter");
		Game.AddCollectible("m5_garbage6","litter");
		Game.AddCollectible("m5_garbage7","litter");
		Game.AddCollectible("m5_garbage8","litter");
		Game.AddCollectible("m5_garbage9","litter");
		Game.AddCollectible("m5_garbage10","litter");
		Game.AddCollectible("m5_garbage17","litter");
		Game.AddCollectible("m5_garbage11","litter");
		Game.AddCollectible("m5_garbage16","litter");
		Game.AddCollectible("m5_garbage12","litter");
		Game.AddCollectible("m5_garbage13","litter");
		Game.AddCollectible("m5_garbage14","litter");
		Game.AddCollectible("m5_garbage15","litter");
		Game.AddCollectible("m5_garbage23","litter");
		Game.AddCollectible("m5_garbage24","litter");
		Game.AddCollectible("m5_garbage25","litter");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(206);
	Game.SetHUDIcon( "dmv" );
	Game.AddObjective( "goto" );
		Game.AddNPC("snake", "m6_snake_sd");
		Game.SetDestination( "m5_dmv", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(60);
	Game.SetHUDIcon( "snake" );
	Game.AddObjective("talkto");
		Game.AddNPC("snake", "m6_snake_sd");
		Game.AddObjectiveNPCWaypoint( "snake", "m6_snake_walk1" );
		Game.SetTalkToTarget("snake", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_05.p3d" );
			Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
			Game.AmbientAnimationRandomize( 0, 0 );
			Game.AddAmbientNpcAnimation( "dialogue_yes" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide( "m6_bestside" );
		Game.SetDialogueInfo("apu","snake","dmv",0);
		Game.SetDialoguePositions("m6_apu_talk","m6_snake_walk1","m5_carstart");
	Game.CloseObjective();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(192);
	Game.SetHUDIcon( "dmv" );
	Game.AddObjective( "interior" );
		Game.SetDestination("dmv", "dmv_mission_doorstar");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.SetStageMessageIndex(77);
	Game.SetHUDIcon( "folder" );
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("m5_folder","i_folder");
	Game.CloseObjective();
	Game.SetCompletionDialog("victim");
Game.CloseStage();

Game.CloseMission();
