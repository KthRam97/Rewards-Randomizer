Game.SelectMission("bm1");

c_level = 1
c_mission = 11

Game.SetMissionResetPlayerInCar("bm1_carstart");
Game.SetDynaLoadData("l1z7.p3d;l1r6.p3d;l1r7.p3d;");

Game.UsePedGroup(5);

Game.AddStage(0);
	Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_08.p3d" );
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(16);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(145);
	Game.SetHUDIcon( "cardboar" );
	Game.AddObjective("delivery");
		Game.AddCollectible("bm1_cardboard","poster_t");
		Game.AddCollectible("bm1_cardboard4","poster_t");
		Game.AddCollectible("bm1_cardboard1","poster_t");
		Game.AddCollectible("bm1_cardboard2","poster_t");
		Game.AddCollectible("bm1_cardboard3","poster_t");
		--SetCollectibleEffect("bonestorm_explosion");
	Game.CloseObjective();
	Game.SetStageTime(150);
	Game.AddCondition("timeout");
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(273);
	Game.SetHUDIcon( "tamacco" );
	Game.AddObjective( "goto" );
		Game.AddNPC("cletus","bm1_cletus_sd");
		Game.SetDestination( "l1_tommaco", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();



Game.AddStage(16);
	Game.SetStageMessageIndex(146);
	Game.SetHUDIcon( "tamacco" );
	Game.AddObjective("delivery");
		Game.AddCollectible("bm1_tomaco","tomat");
		Game.AddCollectible("bm1_tomaco1","tomat");
		Game.AddCollectible("bm1_tomaco2","tomat");
		Game.AddCollectible("bm1_tomaco3","tomat");
		Game.AddCollectible("bm1_tomaco4","tomat");
		Game.AddCollectible("bm1_tomaco5","tomat");
		Game.AddCollectible("bm1_tomaco6","tomat");
		Game.AddCollectible("bm1_tomaco7","tomat");
		Game.AddCollectible("bm1_tomaco8","tomat");
		Game.AddCollectible("bm1_tomaco9","tomat");
		Game.AddCollectible("bm1_tomaco10","tomat");
		Game.AddCollectible("bm1_tomaco11","tomat");
		Game.SetCollectibleEffect("bonestorm_explosion");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(215);
	Game.SetHUDIcon( "cletushs" );
	Game.AddObjective( "goto" );
		Game.AddNPC("cletus","bm1_cletus_sd");
		Game.SetDestination( "bm_cletushouse", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(0);
	Game.AddCondition("timeout");
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(25);
	Game.SetHUDIcon( "cletus" );
	Game.AddObjective("talkto");
		Game.AddNPC("cletus","bm1_cletus_sd");
		Game.AddObjectiveNPCWaypoint( "cletus", "bm1_cletus_walk1" );
		Game.SetTalkToTarget("cletus", 0, 0); -- 0 - eclamation, 1 is gift, with optional hieight offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0,"final");
	Game.AddObjective("dialogue");
		Game.SetDialogueInfo("homer","cletus","cityboy",0);
		Game.SetCamBestSide( "bm1_bestside" );
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();


CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
