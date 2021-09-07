Game.SelectMission("m7");

c_level = 2
c_mission = 7

Game.SetMissionResetPlayerInCar("m4_carstart");
Game.SetDynaLoadData("l2z4.p3d;l2r4.p3d;l2z1.p3d;");

Game.UsePedGroup(6);
Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
		Game.AddStageVehicle("cCellA","m7_cellstart1","NULL","Missions\\level02\\M7dest.con");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageTime(120);
	Game.SetMaxTraffic(2);
	Game.SetStageMessageIndex(64);
	Game.SetHUDIcon( "celph_v" );
	Game.ActivateVehicle("cCellA","NULL","target");
	Game.SetVehicleAIParams( "cCellA", -10, -9 );   -- no shortcuts
	Game.AddStageWaypoint( "m7_cell1" );
	Game.AddStageWaypoint( "m7_cell2" );
	Game.AddStageWaypoint( "m7_cell3" );
	Game.AddStageWaypoint( "m7_cell3b" );
	Game.AddObjective("destroy","neither");
		Game.SetObjTargetVehicle("cCellA");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();


Game.AddStage(0);
	Game.SetMaxTraffic(3);
	Game.AddStageTime(115);
	Game.SetStageMessageIndex(64);
	Game.SetHUDIcon( "celph_v" );
	Game.AddStageVehicle("cCellA","m7_cellstart2","target","Missions\\level02\\M7dest.con");
	Game.SetVehicleAIParams( "cCellA", -10, -9 );   -- no shortcuts
	Game.AddStageWaypoint( "m7_cell4" );
	Game.AddStageWaypoint( "m7_cell3" );
	Game.AddStageWaypoint( "m7_cell3b" );
	Game.AddStageWaypoint( "m7_cell1" );
	Game.AddStageWaypoint( "m7_cell2" );
	Game.AddStageWaypoint( "m7_cell5" );
	Game.AddStageWaypoint( "m7_cell5b" );
	Game.AddStageWaypoint( "m7_cell6" );
	Game.AddObjective("destroy","neither");
		Game.SetObjTargetVehicle("cCellA");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();


Game.AddStage(0);
	Game.SetMaxTraffic(4);
	Game.AddStageTime(90);
	Game.SetStageMessageIndex(64);
	Game.SetHUDIcon( "celph_v" );
	Game.AddStageVehicle("cCellA","m7_cellstart3","target","Missions\\level02\\M7dest.con");
	Game.SetVehicleAIParams( "cCellA", -10, -9 );   -- no shortcuts
	Game.AddStageWaypoint( "m7_cell2" );
	Game.AddStageWaypoint( "m7_cell5" );
	Game.AddStageWaypoint( "m7_cell5b" );
	Game.AddStageWaypoint( "m7_cell6" );
	Game.AddStageWaypoint( "m7_cell4" );
	Game.AddStageWaypoint( "m7_cell3" );
	Game.AddStageWaypoint( "m7_cell3b" );
	Game.AddStageWaypoint( "m7_cell1" );
	Game.AddObjective("destroy","neither");
		Game.SetObjTargetVehicle("cCellA");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(5);
	Game.AddStageTime(75);
	Game.SetStageMessageIndex(64);
	Game.SetHUDIcon( "celph_v" );
	Game.AddStageVehicle("cCellA","m7_cellstart4","target","Missions\\level02\\M7dest.con");
	Game.SetVehicleAIParams( "cCellA", -10, -9 );   -- no shortcuts
	Game.AddStageWaypoint( "m4_cell7" );
	Game.AddStageWaypoint( "m7_cell8" );
	Game.AddStageWaypoint( "m7_cell1" );
	Game.AddStageWaypoint( "m7_cell3b" );
	Game.AddStageWaypoint( "m7_cell9" );
	Game.AddStageWaypoint( "m7_cell10" );
	Game.AddStageWaypoint( "m7_cell5b" );
	Game.AddObjective("destroy","neither");
		Game.SetObjTargetVehicle("cCellA");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.AddStageTime(60);
	Game.SetStageMessageIndex(55);
	Game.SetHUDIcon( "stadium" );
	Game.SetMaxTraffic(5);
	Game.AddObjective("goto","both");
		Game.AddNPC("frink", "m4_frink_sd");
		Game.SetDestination("stadium", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(66);
	Game.SetHUDIcon( "frink" );
	Game.AddObjective("talkto","neither");
		Game.AddNPC("frink", "m4_frink_sd"); --reusing mission 4 start locator
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk1" );
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk2" );
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_sd" );
		Game.SetTalkToTarget("frink", 0, 0);
	Game.CloseObjective();
--	AddCondition("timeout");
--		//SetHitNRun();
--	CloseCondition();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_near" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_near" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m4_bestside");
		--SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("bart","frink","smash",0);
		Game.SetDialoguePositions("m4_bart_start","m4_frink_sd","m4_carstart",1);
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
