Game.SelectMission("m6");

c_level = 4
c_mission = 6

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

--SetMissionResetPlayerInCar("level4_carstart");
--SetDynaLoadData("l4z1.p3d;l4r1.p3d;l4r7.p3d;");
Game.SetNumValidFailureHints( 3 );
Game.SetMissionResetPlayerOutCar("m6_marge_restart","level4_carstart");
Game.SetDynaLoadData("l4z1.p3d;l4r1.p3d;l4r7.p3d;");

Game.UsePedGroup(0);

Game.AddStage("final"); -- destroy the cans of cola
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(101);
	Game.SetHUDIcon( "buzzcola" );
	Game.AddObjective("delivery", "neither");
		Game.AddCollectible("m6_cola_crate1","i_soda");
		Game.AddCollectible("m6_cola_crate2","i_soda");
		Game.AddCollectible("m6_cola_crate3","i_soda");
		Game.AddCollectible("m6_cola_crate5","i_soda");
		Game.AddCollectible("m6_cola_crate4","i_soda");
		Game.AddCollectible("m6_cola_crate7","i_soda");
		Game.AddCollectible("m6_cola_crate6","i_soda");
		Game.AddCollectible("m6_cola_crate8","i_soda");
		Game.AddCollectible("m6_cola_crate9","i_soda");
		Game.AddCollectible("m6_cola_crate10","i_soda");
		Game.AddCollectible("m6_cola_crate11","i_soda");
		Game.AddCollectible("m6_cola_crate12","i_soda");
		Game.AddCollectible("m6_cola_crate13","i_soda");
		Game.AddCollectible("m6_cola_crate14","i_soda");
		Game.AddCollectible("m6_cola_crate15","i_soda");
		Game.AddCollectible("m6_cola_crate16","i_soda");
		Game.AddCollectible("m6_cola_crate17","i_soda");
		Game.AddCollectible("m6_cola_crate18","i_soda");
		Game.AddCollectible("m6_cola_crate19","i_soda");
		Game.AddCollectible("m6_cola_crate20","i_soda");
		Game.AddCollectible("m6_cola_crate21","i_soda");
		Game.AddCollectible("m6_cola_crate22","i_soda");
		Game.AddCollectible("m6_cola_crate23","i_soda");
		Game.AddCollectible("m6_cola_crate24","i_soda");
		Game.AddCollectible("m6_cola_crate25","i_soda");
		Game.AddCollectible("m6_cola_crate26","i_soda");
		Game.AddCollectible("m6_cola_crate27","i_soda");
		Game.AddCollectible("m6_cola_crate28","i_soda");
		Game.AddCollectible("m6_cola_crate29","i_soda");
		Game.AddCollectible("m6_cola_crate30","i_soda");
	--	SetCollectibleEffect("bonestorm_explosion");
	Game.CloseObjective();
	Game.SetStageTime(150);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.StageStartMusicEvent("M6_start");
	Game.SetStageMusicAlwaysOn();
	Game.SetCompletionDialog("selling");
Game.CloseStage();

Game.CloseMission();
