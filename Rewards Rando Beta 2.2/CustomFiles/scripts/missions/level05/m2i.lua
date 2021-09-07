Game.SelectMission("m2");

c_level = 5
c_mission = 2

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m2_carstart");
Game.SetDynaLoadData("l5z2.p3d;l5r1.p3d;l5r2.p3d;");

Game.UsePedGroup(2);
--AddStage(0);
--	SetStageMessageIndex(12);
--	AddObjective("getin");
--		SetObjTargetVehicle("current");
--	CloseObjective();
--CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(71);
	Game.SetHUDIcon( "hospital" );
	Game.SetStageTime(45);
	Game.AddObjective("goto");
		Game.RemoveNPC( "louie" );
		Game.AddStageVehicle("cLimo","m2_limo1","NULL","Missions\\level05\\M2evade.con", "louie");
		Game.SetDestination("m2_limostart", "carsphere");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon( "blimo_v" );
	Game.SetStageMessageIndex(258);
	Game.ActivateVehicle("cLimo","NULL","chase");
	Game.AddObjective("losetail");
		Game.SetObjTargetVehicle("cLimo");
		Game.AddNPC("hibbert", "m3_hibbert_sd");
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.AddStageMusicChange();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.AddStageTime(45);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();


Game.AddStage(0);
	Game.SetStageMessageIndex(71);
	Game.SetHUDIcon( "hospital" );
	Game.SetStageTime(45);
	Game.AddObjective("goto");
		Game.AddStageVehicle("cLimo","m2_sedan_carstart1","NULL","Missions\\level05\\M2evade.con", "louie");
		Game.SetDestination("m2_dest_derby_loc1", "carsphere");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon( "blimo_v" );
	Game.SetStageMessageIndex(258);
	Game.ActivateVehicle("cLimo","NULL","chase");
	Game.AddObjective("losetail");
		Game.SetObjTargetVehicle("cLimo");
		Game.AddNPC("hibbert", "m3_hibbert_sd");
		Game.SetObjDistance(200);
	Game.CloseObjective();
	Game.AddStageMusicChange();
	Game.AddCondition( "damage" );
		Game.SetCondMinHealth( 0.0 );
		Game.SetCondTargetVehicle( "current" );
	Game.CloseCondition();
	Game.AddStageTime(45);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(1);
	Game.SetStageMessageIndex(71);
	Game.SetHUDIcon( "hospital" );
	Game.SetMaxTraffic(5);
	Game.AddStageTime(15);
	Game.AddObjective("goto");
		Game.AddNPC("hibbert", "m3_hibbert_sd");
		Game.SetDestination("m2_hospital", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("timer");
		Game.SetDurationTime(0.5);
	Game.CloseObjective();

Game.CloseStage();
