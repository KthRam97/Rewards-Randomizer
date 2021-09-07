Game.SelectMission("m3");

c_level = 4
c_mission = 3

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m2_cletustruck_2");
Game.SetDynaLoadData("l4z2.p3d;l4r1.p3d;l4r2.p3d;");
Game.InitLevelPlayerVehicle("cletu_v","m2_cletustruck_2","OTHER");

Game.UsePedGroup(1);
--This is a forced car mission.
Game.SetForcedCar();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(5);
	Game.SetHUDIcon( "ketchup" );

	Game.StartCountdown("count");
		Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "1", 1000 ); -- duration time in milliseconds
		Game.AddToCountdownSequence( "GO", 400 ); -- duration time in milliseconds

	Game.AddObjective("delivery");
		Game.AddNPC("cletus","m3_cletus_hide");
		Game.AddCollectible("m3_ketchup1","ketchup","winter");
		Game.AddCollectible("m3_ketchup2","ketchup");
		Game.AddCollectible("m3_ketchup3","ketchup","dumpster");
		Game.AddCollectible("m3_ketchup4","ketchup");
		Game.AddCollectible("m3_ketchup5","ketchup");
		Game.AddCollectible("m3_ketchup6","ketchup");
		Game.AddCollectible("m3_ketchup7", "ketchup","ketchup","cletus");
		Game.AddCollectible("m3_ketchup8","ketchup");
		Game.AddCollectible("m3_ketchup9","ketchup");
--		Game.AddCollectible("m3_ketchup10","ketchup");
		Game.AddCollectible("m3_ketchup11","ketchup");
		Game.AddCollectible("m3_ketchup12","ketchup");
		Game.AddCollectible("m3_ketchup13","ketchup");
		Game.AddCollectible("m3_ketchup14","ketchup");
		Game.AddCollectible("m3_ketchup15","ketchup");
		Game.AddCollectible("m3_ketchup16","ketchup");
		Game.AddCollectible("m3_ketchup17","ketchup");
		Game.AddCollectible("m3_ketchup18","ketchup");
		Game.AddCollectible("m3_ketchup19","ketchup");
	Game.CloseObjective();
	Game.SetStageTime(120);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "cletu_v" );
	Game.CloseCondition();
	Game.SetCompletionDialog("pappy","cletus");
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(215);
	Game.SetHUDIcon( "cletushs" );
	Game.AddObjective("goto");
		Game.SetDestination("m3_wiggumtrigger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AddStageVehicle("cSedan","m3_wiggumstart","NULL", "Missions\\level04\\M3evade.con");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "cletu_v" );
	Game.CloseCondition();
	Game.SetStageTime(45);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();


Game.AddStage(0);
	Game.SetStageMessageIndex(178);
	Game.SetHUDIcon( "bsedan_v" );
	Game.ActivateVehicle( "cSedan","NULL","chase" );
	Game.AddObjective( "losetail" );
		Game.SetObjTargetVehicle( "cSedan" );
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.SetStageTime(60);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "cletu_v" );
	Game.CloseCondition();
	Game.StageStartMusicEvent("L4_drama");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(215);
	Game.SetHUDIcon( "cletushs" );
	Game.AddObjective("goto");
		Game.SetDestination("m3_cletushouse", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "cletu_v" );
	Game.CloseCondition();
	Game.SetFadeOut( 1.0);
	Game.SwapInDefaultCar();
	Game.SetSwapDefaultCarLocator("m2_carstart");
	Game.SetSwapForcedCarLocator("m2_cletustruck_sd");
	Game.SetSwapPlayerLocator("m2_marge");
	Game.SetIrisWipe( 0.1 );
Game.CloseStage();

Game.AddStage(1);
	Game.AddObjective("timer");
		Game.AddNPC("cletus","m2_cletus_walk1");
		Game.AddStageCharacter("marge", "m2_marge", "", "cletu_v", "m2_cletustruck_sd" );
		Game.RemoveDriver("cletus");
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_near" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetConversationCam( 3, "pc_far" );
		--SetCamBestSide("bestside_m1");
		Game.SetDialogueInfo("marge","cletus","pappy",0);
		Game.SetDialoguePositions("m2_marge","m2_cletus_walk1","m2_carstart",1);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
