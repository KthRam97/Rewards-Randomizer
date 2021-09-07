Game.SelectMission("m4");

c_level = 1
c_mission = 4

Game.SetMissionResetPlayerOutCar("m4_homer_start", "m4_carstart");
Game.SetDynaLoadData("l1r4a.p3d;l1z6.p3d;l1r6.p3d;");
Game.SetNumValidFailureHints( 2 );
Game.UsePedGroup(7);

Game.AddStage(0);
	Game.SetStageMessageIndex(252);
	Game.SetHUDIcon( "pwrplant" );
	Game.AddObjective( "goto" );
		Game.TurnGotoDialogOff();
		Game.SetDestination( "m4_start_sd", "triggersphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(10);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(10);
	Game.SetHUDIcon( "powercou" );
	Game.AddObjective("delivery","neither");
		Game.AddCollectible("PP_powerbox1");
		Game.AddCollectible("PP_powerbox2");
		Game.AddCollectible("PP_powerbox3");
		Game.AddCollectible("PP_powerbox4");
		Game.AddCollectible("PP_powerbox5");
		Game.AddCollectible("PP_powerbox6");
		Game.AddCollectible("PP_powerbox7");
		Game.AddCollectible("PP_powerbox8");
		Game.AddCollectible("PP_powerbox9");
	Game.CloseObjective();
	Game.SetStageTime(210);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.StageStartMusicEvent("M4_start");
	Game.SetStageMusicAlwaysOn();
	Game.ShowStageComplete();
Game.CloseStage();

--AddStage("final");
--	SetStageMessageIndex(11);
--	SetHUDIcon( "wstation" );
--	AddObjective("goto");
--		TurnGotoDialogOff();
--		SetDestination("m4_locator_sd","triggersphere");
--		SetCollectibleEffect("wrench_collect");
--	CloseObjective();
--	AddStageTime(30);
--	AddCondition("timeout");
--	CloseCondition();
--	SetCompletionDialog("sleep","burns");
--CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(11);
	Game.SetHUDIcon( "wstation" );
	Game.AddObjective("goto");
		Game.AddNPC("burns", "m4_carl_sd");
		Game.SetDestination("m4_locator_sd", "triggersphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetDialogueInfo("homer","burns","sleep",0);
	Game.CloseObjective();

Game.CloseStage();


Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
