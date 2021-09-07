Game.SelectMission("m7");

Game.SetMissionResetPlayerInCar("m7_carstart");
Game.SetDynaLoadData("l3z3.p3d;l3r2.p3d;l3r3.p3d;");

Game.UsePedGroup(5);

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageTime(120);
	Game.SetStageMessageIndex(98);
	Game.SetHUDIcon( "blimo_v" );
	Game.SetMaxTraffic(2);
	Game.AddStageVehicle("cLimo","m7_limo_carstart","target","Missions\\level03\\M7dest.con", "eddie");
	Game.SetVehicleAIParams( "cLimo", -10, -9 );   -- very dumb - no shortcuts
	Game.AddStageWaypoint( "m7_AI_path_3" );
	Game.AddStageWaypoint( "m7_AI_path_5" );
	Game.AddStageWaypoint( "m7_AI_path_6" );
	Game.AddStageWaypoint( "m7_AI_path_8a" );
	Game.AddObjective("destroy");
		Game.SetObjTargetVehicle("cLimo");
	Game.CloseObjective();
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.StageStartMusicEvent("M7_drama");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(196);
	Game.SetHUDIcon( "chum" );
	Game.AddObjective("goto");
		Game.AddNPC("captain", "m6_captain_sd");
		Game.SetDestination("m6_fishstore_sd", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.StageStartMusicEvent("M7_start");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(5);
	Game.SetStageMessageIndex(197);
	Game.SetHUDIcon( "scaptain" );
	Game.AddObjective("talkto");
		Game.AddNPC("captain", "m6_captain_sd");
		Game.AddObjectiveNPCWaypoint( "captain", "m6_captain_walk1_sd" );
		Game.SetTalkToTarget("captain", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m6_bestside" );
		Game.SetDialogueInfo("lisa","captain","destroy",0);
		Game.SetDialoguePositions("m6_lisa_loc","m6_captain_walk1_sd","m7_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(198);
	Game.SetHUDIcon( "ship" );
	Game.AddObjective("goto");
		Game.AddNPC("bart", "m7_bart");
		Game.SetDestination("m7_ship", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.ShowStageComplete();
	Game.SetStageTime(75);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(5);
	Game.SetStageMessageIndex(199);
	Game.SetHUDIcon( "bart" );
	Game.AddObjective("talkto");
		Game.AddNPC("bart", "m7_bart");
		Game.SetTalkToTarget("bart", 0, -0.5);
	Game.CloseObjective();
	Game.SetStageTime(120);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.SetCamBestSide( "m7_bestside" );
		Game.SetDialogueInfo("lisa","bart","found",0);
		Game.SetDialoguePositions("m7_lisa_loc2","m7_bart","m7_carstart",1);
	Game.CloseObjective();

Game.CloseStage();


Game.CloseMission();

c_level = 3
c_mission = 7

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
