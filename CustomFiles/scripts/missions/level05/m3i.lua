Game.SelectMission("m3");

c_level = 5
c_mission = 3

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m3_carstart");
Game.SetDynaLoadData("l5z1.p3d;l5r1.p3d;l5r4.p3d;");

Game.UsePedGroup(0);
Game.AddStage(0);
--	RESET_TO_HERE();
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
		Game.AddStageVehicle("cNonup","m3_diaper_carstart","NULL","Missions\\level05\\M3dump.con");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(71);
	Game.SetHUDIcon( "hospital" );
	Game.AddObjective("goto");
		Game.SetDestination("m2_startpoint", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(73);
	Game.SetHUDIcon( "diaper" );
	Game.SetMaxTraffic(2);
	Game.ActivateVehicle("cNonup","NULL","target");
	Game.SetVehicleAIParams( "cNonup", -10, -9 ); --  <=== name, min, max; 0,1 = really dumb, no shortcuts
	Game.AddStageWaypoint( "m3_path1" );
	Game.AddStageWaypoint( "m3_path2" );
	Game.AddStageWaypoint( "m3_path3" );
	Game.AddStageWaypoint( "m3_path4" );
	Game.AddStageWaypoint( "m3_path5" );
	Game.AddStageWaypoint( "m3_path6" );
	Game.AddStageWaypoint( "m3_path7" );
	Game.AddStageWaypoint( "m3_path1" );
	Game.AddStageWaypoint( "m3_path8" );
	Game.AddStageWaypoint( "m3_path9" );
	Game.AddStageWaypoint( "m3_path2" );
	Game.AddStageWaypoint( "m3_path3" );
	Game.AddStageWaypoint( "m3_path4" );
	Game.AddStageWaypoint( "m3_path7" );
	Game.AddObjective("dump", "neither");
		Game.SetObjTargetVehicle("cNonup");
		Game.AddCollectible("m3_diapers1","diaper");
		Game.AddCollectible("m3_diapers2","diaper");
		Game.AddCollectible("m3_diapers3","diaper");
		Game.AddCollectible("m3_diapers4","diaper");
		Game.AddCollectible("m3_diapers5","diaper");
		Game.AddCollectible("m3_diapers6","diaper");
		Game.AddCollectible("m3_diapers7","diaper");
		Game.AddCollectible("m3_diapers8","diaper");
		Game.AddCollectible("m3_diapers9","diaper");
		Game.AddCollectible("m3_diapers10","diaper");
	Game.CloseObjective();
	Game.AddStageTime(90);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
--	AddCondition("race");
--		SetCondTargetVehicle("cNonup");
--	CloseCondition();

	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "carhom_v" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
--	AddCondition("race");
--		SetCondTargetVehicle("cNonup");
--	CloseCondition();

	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage();
	Game.SetStageMessageIndex(71);
	Game.SetHUDIcon( "hospital" );
	Game.AddObjective("goto");
		Game.AddNPC("hibbert", "m3_hibbert_sd");
		Game.SetDestination("m3_hospital", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(20);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "carhom_v" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(72);
	Game.SetHUDIcon( "drhibert" );
	Game.AddObjective("talkto");
		Game.AddNPC("hibbert", "m3_hibbert_sd");
			Game.AddObjectiveNPCWaypoint( "hibbert", "m3_hibbert_walk1" );
			Game.AddObjectiveNPCWaypoint( "hibbert", "m3_hibbert_walk2" );
			Game.AddObjectiveNPCWaypoint( "hibbert", "m3_hibbert_walk1" );
			Game.AddObjectiveNPCWaypoint( "hibbert", "m3_hibbert_sd" );
		Game.SetTalkToTarget("hibbert", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m3_bestside");
		Game.SetDialogueInfo("apu","hibbert","tushie",0);
		Game.SetDialoguePositions("m3_apu_start","m3_hibbert_walk2","m3_carstart",1);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
