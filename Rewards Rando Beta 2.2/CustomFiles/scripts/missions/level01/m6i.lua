Game.SelectMission("m6");

c_level = 1
c_mission = 6

Game.SetMissionResetPlayerInCar("m6_canyanaro_sd");
Game.SetDynaLoadData("l1z3.p3d;l1r3.p3d;l1r2.p3d;");
Game.InitLevelPlayerVehicle("marge_v","m6_canyanaro_sd","OTHER");

Game.SetNumValidFailureHints( 5 );

Game.UsePedGroup(3);

Game.SetForcedCar();

Game.AddStage(); -- destroy the video games!
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(16);
	Game.SetHUDIcon( "bonestor" );
	Game.AddStageVehicle("cBone","m6_video_carstart","target","Missions\\level01\\M6dump.con", "jasper");
	Game.SetVehicleAIParams( "cBone", -10, -9 );   -- no shortcuts
	Game.AddStageWaypoint( "m6_video_path8" );
	Game.AddStageWaypoint( "m6_video_path14" );
	Game.AddStageWaypoint( "m6_video_path15" );
	Game.SetStageTime(180);

	Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1",  1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO",  400 ); -- duration time in milliseconds

	Game.AddObjective("dump","neither");
		Game.AddNPC("marge", "m6_marge_hide");
		Game.SetObjTargetVehicle("cBone");
		Game.AddCollectible("m6_videogames1","bonestorm");
		Game.AddCollectible("m6_videogames2","bonestorm");
		Game.AddCollectible("m6_videogames3","bonestorm");
		Game.AddCollectible("m6_videogames4","bonestorm");
		Game.AddCollectible("m6_videogames5","bonestorm");
		Game.AddCollectible("m6_videogames6","bonestorm");
		Game.AddCollectible("m6_videogames7","bonestorm");
		Game.AddCollectible("m6_videogames8","bonestorm");
		Game.AddCollectible("m6_videogames9","bonestorm");
		Game.AddCollectible("m6_videogames10","bonestorm");
		Game.SetCollectibleEffect("bonestorm_explosion");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "marge_v" );
	Game.CloseCondition();
	--SetFadeOut(1.0);
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon("simpsons");
	Game.SetStageMessageIndex(217);
	Game.AddObjective( "goto", "both" );
		Game.SetDestination( "m2_simpsonhouse_sd", "carsphere" );
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "marge_v" );
	Game.CloseCondition();
	Game.SetFadeOut(1.0);
	Game.SwapInDefaultCar();
	Game.SetSwapDefaultCarLocator("m6_carstart");
	Game.SetSwapForcedCarLocator("m6_canyanaro_sd");
	Game.SetSwapPlayerLocator("level1_homer_walkto");
Game.CloseStage();

Game.AddStage(1);
	Game.AddObjective("timer");
		Game.AddNPC("marge", "m1_marge_sd");
		Game.StayInBlack();
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.AddNPC("marge", "m1_marge_sd");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_near" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("homer","marge","sharing",0);
		Game.SetCamBestSide("bestside_m1");
		Game.SetDialoguePositions("level1_homer_walkto","m1_marge_sd","m6_carstart",1);
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

--dialogue_hands_in_air
--dialogue_hands_on_hips
--dialogue_scratch_head
--dialogue_shaking_fist
--dialogue_thinking
--dialogue_yes
--dialogue_no
--dialogue_cross_arms
--dialogue_open_arm_hand_gesture
--dialogue_shake_hand_in_air
