Game.SelectMission("bm1");

c_level = 4
c_mission = 11

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_08.p3d" );
Game.SetMissionResetPlayerInCar("bm1_carstart");
Game.SetDynaLoadData("l4r7.p3d;l4z1.p3d;l4r1.p3d;");
Game.UsePedGroup(6);

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(3);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(128);
	Game.SetHUDIcon( "school" );
	Game.AddObjective("goto");
		Game.SetDestination("bm1_waypoint3", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(80);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(16);
	Game.ShowStageComplete();
	Game.SetStageMessageIndex(236);
	Game.SetHUDIcon( "heart" );
	Game.AddObjective("delivery");
		Game.AddCollectible("bm1_object1","r_choco");
		Game.AddCollectible("bm1_object2","r_dent");
		Game.AddCollectible("bm1_object3","r_diaper");
		Game.AddCollectible("bm1_object4","r_onions");
		Game.AddCollectible("bm1_object5","r_tomb");
		Game.AddCollectible("bm1_item6","r_choco");
		Game.AddCollectible("bm1_item7","r_dent");
		Game.AddCollectible("bm1_item8","r_diaper");
	Game.CloseObjective();
	Game.AddStageTime(50);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(130);
	Game.SetHUDIcon( "cbg" );
	Game.AddObjective( "goto" );
		Game.SetDestination( "bm_end", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(70);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(54);
	Game.SetHUDIcon( "cbg" );
	Game.AddObjective("talkto");
		Game.SetTalkToTarget("cbg", 0, 0); -- 0 - eclamation, 1 is gift, with optional hieight offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0,"final");
	Game.AddObjective("dialogue");
		Game.SetCamBestSide( "bm1_bestside" );
		Game.SetDialogueInfo("marge","cbg","done",0);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
