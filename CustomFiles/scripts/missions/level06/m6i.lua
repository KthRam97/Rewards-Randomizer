Game.SelectMission("m6");

c_level = 6
c_mission = 6

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m6_carstart");
Game.SetDynaLoadData("l6z4.p3d;l6r3.p3d;l6r4.p3d;");
Game.SetNumValidFailureHints( 5 );
Game.UsePedGroup(6);

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(209);
	Game.SetHUDIcon("krustylu");
	Game.AddObjective( "goto" );
		Game.AddNPC("krusty", "m6_krusty_sd");
		Game.SetDestination( "m6_krustylu", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0); -- destroy the laser stands
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(93);
	Game.SetHUDIcon( "lasersta" );
	Game.AddObjective("delivery", "neither");
		Game.AddCollectible("m7_lasers1","lasrstnd");
		Game.AddCollectible("m7_lasers2","lasrstnd");
		Game.AddCollectible("m7_lasers3","lasrstnd");
		Game.AddCollectible("m7_lasers4","lasrstnd");
		Game.AddCollectible("m7_lasers5","lasrstnd");
		Game.AddCollectible("m7_lasers6","lasrstnd");
		Game.AddCollectible("m7_lasers7","lasrstnd");
		Game.AddCollectible("m7_lasers8","lasrstnd");
		Game.AddCollectible("m7_lasers9","lasrstnd");
		Game.AddCollectible("m7_lasers10","lasrstnd");
		Game.AddCollectible("m7_lasers11","lasrstnd");
		Game.AddCollectible("m7_lasers12","lasrstnd");
		Game.AddCollectible("m7_lasers13","lasrstnd");
		Game.AddCollectible("m7_lasers14","lasrstnd");
		Game.AddCollectible("m7_lasers15","lasrstnd");
		Game.AddCollectible("m7_lasers16","lasrstnd");
		Game.AddCollectible("m7_lasers17","lasrstnd");
		Game.AddCollectible("m7_lasers18","lasrstnd");
		Game.AddCollectible("m7_lasers19","lasrstnd");
		Game.AddCollectible("m7_lasers20","lasrstnd");
		Game.AddCollectible("m7_lasers21","lasrstnd");
		Game.AddCollectible("m7_lasers22","lasrstnd");
		Game.AddCollectible("m7_lasers23","lasrstnd");
		Game.AddCollectible("m7_lasers24","lasrstnd");
		Game.AddCollectible("m7_lasers25","lasrstnd");
		Game.SetCollectibleEffect("lsrexpld");
	Game.CloseObjective();
	Game.SetStageTime(100);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
--	SetCompletionDialog("showgirl","krusty");
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(209);
	Game.SetHUDIcon("krustylu");
	Game.AddObjective( "goto" );
		Game.AddNPC("krusty", "m6_krusty_sd");
		Game.SetDestination( "m6_krustylu", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(50);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
		Game.AddCondition("outofvehicle");
		Game.SetCondTime( 10000 );
	Game.CloseCondition();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(5);
	Game.SetStageMessageIndex(191);
	Game.SetHUDIcon("krusty");
	Game.AddObjective("talkto");
		Game.AddNPC("krusty", "m6_krusty_sd");
		Game.AddObjectiveNPCWaypoint( "krusty", "m6_krusty_walk1" );
		Game.SetTalkToTarget("krusty", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.SetCamBestSide( "m6_bestside" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("bart","krusty","showgirl",0);
		Game.SetDialoguePositions("m6_bart_krustytalk","m6_krusty_sd","m6_carstart",1);
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();
