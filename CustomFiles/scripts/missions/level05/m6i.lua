Game.SelectMission("m6");

c_level = 5
c_mission = 6

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m6_carstart");
Game.SetDynaLoadData("l5z3.p3d;l5r2.p3d;l5r3.p3d;");
Game.InitLevelPlayerVehicle("snake_v","m6_snakecar","OTHER");

Game.UsePedGroup(4);
Game.SetForcedCar();
Game.SetNumValidFailureHints( 5 );

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetHUDIcon( "google" );
	Game.SetStageMessageIndex(260);
	Game.SetStageTime(60);
	Game.AddObjective("goto");
		Game.AddNPC("snake", "m6_snakehide");
		Game.SetDestination("m6_wiggumtrigger", "carsphere");
		--SetCollectibleEffect("wrench_collect");
		Game.AddStageVehicle("cPolice","m6_wiggumstart","NULL", "Missions\\level05\\M4chase.con", "wiggum");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(48);
	Game.SetHUDIcon( "wiggu_v" );
	Game.ActivateVehicle( "cPolice","NULL","chase" );
	Game.AddObjective( "losetail" );
		Game.SetObjTargetVehicle( "cPolice" );
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.AddStageTime(45);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
	Game.StageStartMusicEvent("L6_drama");
	Game.ShowStageComplete();
	Game.AddStageVehicle("cArmor","m6_armor_carstart","NULL","Missions\\level05\\M6dest.con", "eddie");
Game.CloseStage();

Game.AddStage(0); -- find the armored car
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(167);
	Game.SetHUDIcon( "google" );
	Game.AddObjective("goto");
		Game.SetDestination("m6_armor_start", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(79);
	Game.SetHUDIcon( "arm_v" );
	Game.SetMaxTraffic(3);
	Game.ActivateVehicle("cArmor","NULL","target");
	Game.SetVehicleAIParams( "cArmor", -10, -9 ); --  <=== name, min, max; 0,1 = really dumb, no shortcuts
	Game.AddStageWaypoint( "m6_armor_path1" );
	Game.AddStageWaypoint( "m6_armor_path2" );
	Game.AddStageWaypoint( "m6_armor_path3" );
	Game.AddStageWaypoint( "m6_armor_path4" );
	Game.AddStageWaypoint( "m6_armor_path5" );
	Game.AddStageWaypoint( "m6_armor_path7" );
	Game.AddStageWaypoint( "m6_armor_path8" );
	Game.AddStageWaypoint( "m6_armor_path1" );
	Game.AddStageWaypoint( "m6_armor_path2" );
	Game.AddStageWaypoint( "m6_armor_path3" );
	Game.AddStageWaypoint( "m6_armor_path4" );
	Game.AddStageWaypoint( "m6_armor_path5" );
	Game.AddStageWaypoint( "m6_armor_path7" );
	Game.AddStageWaypoint( "m6_armor_path8" );
	Game.AddObjective("destroy");
		Game.SetObjTargetVehicle("cArmor");
	Game.CloseObjective();
--	AddStageTime(210);
--	AddCondition("timeout");
--		//SetHitNRun();
--	CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
	Game.AddStageMusicChange();
	Game.ShowStageComplete();
	Game.SetCompletionDialog("hideout","snake");
Game.CloseStage();


Game.AddStage(0);
	Game.SetHUDIcon( "lexicon" );
	Game.SetStageMessageIndex(80);
	Game.AddObjective("goto");
		Game.SetDestination("m6_snake_hideout", "carsphere");
--		SetCollectibleEffect("wrench_collect");
		Game.AddStageVehicle("cPolice","m6_wiggumstart2","NULL", "level05\\M4chase.con", "wiggum");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0); -- Oh Oh there's wiggum again
	Game.SetStageMessageIndex(48);
	Game.SetHUDIcon( "wiggu_v" );
	Game.ActivateVehicle( "cPolice","NULL","chase" );
	Game.AddObjective( "losetail" );
		Game.SetObjTargetVehicle( "cPolice" );
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.AddStageTime(45);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
	Game.StageStartMusicEvent("L6_drama");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0); -- get back to snake's hidout
	Game.SetStageMessageIndex(80);
	Game.SetHUDIcon( "lexicon" );
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.AddNPC("bart", "m7_bart_sd");
		Game.AddStageVehicle("bart_v","m7_carstart","NULL","Pursuit\\Hardcop.con");
		Game.SetDestination("m6_snake_hideout", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "snake_v" );
	Game.CloseCondition();
--	Game.SetCompletionDialog("profanity","snake");
	Game.SetFadeOut( 0.1 );
	Game.SwapInDefaultCar();
	Game.SetSwapDefaultCarLocator("level5_carstart");
	Game.SetSwapForcedCarLocator("m5_carstart");
	Game.SetSwapPlayerLocator("m7_apu_start");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0); -- gets APU out of the Car rand hides the car
	Game.AddObjective("timer");
		Game.RemoveDriver("snake");
		Game.AddNPC("snake", "m7_bart_walk1");
		Game.StayInBlack();
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.AddNPC("snake", "m7_bart_walk1");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.SetCamBestSide("lenny_walk1");
		Game.SetDialogueInfo("apu","snake","profanity",0);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
