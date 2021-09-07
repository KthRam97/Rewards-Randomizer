Game.SelectMission("m3");

Game.SetMissionResetPlayerInCar("m3_apucarstart_sd");
Game.SetDynaLoadData("l3z1.p3d;l3r1.p3d;l3r5.p3d;l3r5_dam.p3d;");
Game.InitLevelPlayerVehicle("apu_v","m3_apucarstart_sd","OTHER");

Game.SetNumValidFailureHints( 5 );

Game.UsePedGroup(0);

Game.SetForcedCar();

Game.AddStage(16);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(118);
	Game.SetHUDIcon( "flatmeat" );
	Game.AddStageVehicle("cletu_v","m3_cletus_carstart","target","Missions\\level03\\M3dump.con", "cletus");
	Game.SetVehicleAIParams( "cletu_v", -10, -9 );   -- very dumb - no shortcuts
	Game.AddStageWaypoint( "m3_cletus_path5" );
	Game.AddStageWaypoint( "m3_cletus_path9" );
	Game.AddStageWaypoint( "m3_cletus_path1" );

	Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds

	Game.AddObjective("dump", "neither");
		Game.SetObjTargetVehicle("cletu_v");
		Game.AddNPC("apu", "m3_apu_hide");
		Game.AddCollectible("m3_flatmeat_1","roadkill");
		Game.AddCollectible("m3_flatmeat_2","roadkill");
		Game.AddCollectible("m3_flatmeat_3","roadkill");
		Game.AddCollectible("m3_flatmeat_4","roadkill");
		Game.AddCollectible("m3_flatmeat_5","roadkill");
		Game.AddCollectible("m3_flatmeat_6","roadkill");
		Game.AddCollectible("m3_flatmeat_7","roadkill");
		Game.AddCollectible("m3_flatmeat_8","roadkill");
		Game.AddCollectible("m3_flatmeat_9","roadkill");
		Game.AddCollectible("m3_flatmeat_10","roadkill");
		Game.AddCollectible("m3_flatmeat_11","roadkill");
		Game.AddCollectible("m3_flatmeat_12","roadkill");
		Game.AddCollectible("m3_flatmeat_13","roadkill");
		Game.AddCollectible("m3_flatmeat_14","roadkill");
		Game.AddCollectible("m3_flatmeat_15","roadkill");
	Game.CloseObjective();
	Game.SetStageTime(120);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "apu_v" );
	Game.CloseCondition();
	Game.SetCompletionDialog("jerkwater","apu");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(181);
	Game.SetHUDIcon( "observ" );
	Game.AddObjective("goto", "both");
		Game.SetDestination("m3_observatory", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "apu_v" );
	Game.CloseCondition();
	Game.SetStageTime(80);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.SetFadeOut( 1.0 );
	Game.SwapInDefaultCar();
	Game.SetSwapDefaultCarLocator("m3_carend");
	Game.SetSwapForcedCarLocator("m3_apu_carend");
	Game.SetSwapPlayerLocator("m3_lisa_observatory");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(182);
	Game.SetHUDIcon( "observ" );
	Game.AddObjective("interior");
		Game.AddNPC("frink", "m3_frink");
		Game.SetDestination("Observatory", "obsv_mission_doorstar");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(66);
	Game.SetHUDIcon( "frink" );
	Game.AddObjective("talkto", "neither");
		Game.AddNPC("frink", "m3_frink");
		Game.AddObjectiveNPCWaypoint( "frink", "m3_frink_walk_1" );
		Game.SetTalkToTarget("frink", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0, "final");
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetDialogueInfo("lisa","frink","conspiracy",0);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

c_level = 3
c_mission = 3

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
