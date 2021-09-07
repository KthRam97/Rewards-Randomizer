Game.SelectMission("bm1");

c_level = 7
c_mission = 11

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerOutCar("bm1_homer_start", "bm1_carstart");
Game.SetDynaLoadData("l7z2.p3d;l7r1.p3d;l7r2.p3d;");

Game.UsePedGroup(1);

Game.AddStage(16);
	Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_08.p3d" );
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(110);
	Game.SetHUDIcon( "sock" );
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("bm1_chat","sockg");
	Game.CloseObjective();
	Game.SetStageTime(25);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(111);
	Game.SetHUDIcon( "smithers" );
	Game.AddObjective("talkto");
		Game.SetTalkToTarget("smithers", 0, 0);
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
	Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
	Game.AmbientAnimationRandomize( 0, 0 );
	Game.AddAmbientNpcAnimation( "none" );
	Game.AddAmbientNpcAnimation( "dialogue_yes" );
	Game.AddAmbientNpcAnimation( "none" );
	Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
	Game.AddAmbientPcAnimation( "none" );
	Game.AddAmbientPcAnimation( "dialogue_yes" );
	Game.SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("homer","smithers","garters",0);
		Game.SetCamBestSide( "bm1_bestside" );
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(16);
	Game.SetStageMessageIndex(112);
	Game.SetHUDIcon( "tooth" );
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("bm1_chaps","tooth");
	Game.CloseObjective();
	Game.SetStageTime(15);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(111);
	Game.SetHUDIcon( "smithers" );
	Game.AddObjective("talkto");
		Game.SetTalkToTarget("smithers", 0, 0);
	Game.CloseObjective();
	Game.AddStageTime(20);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
	Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
	Game.AmbientAnimationRandomize( 0, 0 );
	Game.AddAmbientNpcAnimation( "none" );
	Game.AddAmbientNpcAnimation( "dialogue_yes" );
	Game.AddAmbientNpcAnimation( "none" );
	Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
	Game.AddAmbientPcAnimation( "none" );
	Game.AddAmbientPcAnimation( "dialogue_yes" );
	Game.SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("homer","smithers","tooth",0);
		Game.SetCamBestSide( "bm1_bestside" );
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(16);
	Game.SetStageMessageIndex(113);
	Game.SetHUDIcon( "record" );
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetDestination("bm1_bbook","record");
	Game.CloseObjective();
	Game.AddStageTime(45);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(111);
	Game.SetHUDIcon( "smithers" );
	Game.AddObjective("talkto");
		Game.SetTalkToTarget("smithers", 0, 0);
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
	Game.AmbientAnimationRandomize( 1, 0 );      --( pc=0, npc=1) (nonrandom=0, random=1)
	Game.AmbientAnimationRandomize( 0, 0 );
	Game.AddAmbientNpcAnimation( "none" );
	Game.AddAmbientNpcAnimation( "dialogue_yes" );
	Game.AddAmbientNpcAnimation( "none" );
	Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
	Game.AddAmbientPcAnimation( "none" );
	Game.AddAmbientPcAnimation( "dialogue_yes" );
	Game.SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("homer","smithers","muscles",0);
		Game.SetCamBestSide( "bm1_bestside" );
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
