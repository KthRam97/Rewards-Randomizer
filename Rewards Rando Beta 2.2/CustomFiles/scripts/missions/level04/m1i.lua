Game.SelectMission("m1");

c_level = 4
c_mission = 1

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

--SetMissionResetPlayerInCar("level4_carstart");
Game.SetMissionResetPlayerOutCar("m6_marge_start","level4_carstart");
--SetDynaLoadData("l4z1.p3d;l4r1.p3d;l4r7.p3d;l4i07.p3d@", "bartroom");
Game.SetDynaLoadData("l4z1.p3d;l4r1.p3d;l4r7.p3d;");

Game.UsePedGroup(0);
--AddStage(0);
--	SetStageMessageIndex(250);
--	AddObjective("goto");
--		SetDestination("outside_Simpsons_house_locator");
--	CloseObjective();
--CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(12);
	Game.AddObjective("gooutside");
		Game.AddStageVehicle("cPolice","m1_police_carstart","NULL","Missions\\level04\\M1evade.con");
		Game.SetDestination("m1_police_trigger");
	Game.CloseObjective();
Game.CloseStage();

--AddStage(0);
--	SetStageMessageIndex(12);
--	AddObjective("getin", "neither");
--		SetObjTargetVehicle("current");
--		AddStageVehicle("cPolice","m1_police_carstart","NULL","Missions\level04\M1evade.con");
--	CloseObjective();
--CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon( "lardlads" );
	Game.SetStageMessageIndex(162);
	Game.ActivateVehicle("cPolice","NULL","evade");	--race makes it very easy, for a level 1 "tutorial" chase.
							--The difference is that 'race' has slow-down catch-up logic,
							-- 'evade' doesn't
	Game.SetVehicleAIParams( "cPolice", -10, -9 ); 		--  <=== name, min, max; 0,1 = really dumb, no shortcuts
	Game.AddStageWaypoint( "m1_police_end" );
	Game.AddObjective("follow","neither");
		Game.SetObjTargetVehicle("cPolice");
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0, 120);
		Game.SetCondTargetVehicle("cPolice");
	Game.CloseCondition();
	Game.SetIrisWipe( 0.1 );
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(104);
	Game.SetHUDIcon( "wiggum" );
	Game.AddObjective("talkto");
		Game.AddStageCharacter ("marge", "m1_marge2", "", "current", "mission1_carstart");
		Game.AddStageVehicle("cPolice","m1_cop_stop","NULL","Missions\\level04\\M1evade.con");
		Game.AddNPC("wiggum","m1_wiggum_place");
		Game.AddObjectiveNPCWaypoint( "wiggum", "m1_wiggum_walk1" );
		Game.AddObjectiveNPCWaypoint( "wiggum", "m1_wiggum_walk2" );
		Game.AddObjectiveNPCWaypoint( "wiggum", "m1_wiggum_place" );
		Game.SetTalkToTarget("wiggum", 0, 0); -- 0 - eclamation, 1 is gift, with optional hieight offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m1_bestside");
		Game.SetDialogueInfo("marge","wiggum","cure",0);
		Game.SetDialoguePositions("m1_wiggum_walk1","m1_wiggum_walk2","m5_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(22);
	Game.SetStageMessageIndex(134);
	Game.SetHUDIcon( "donuts" );
	Game.AddStageVehicle("cDonut","m1_donut_carstart","target","Missions\\level04\\M1dump.con");
	Game.SetVehicleAIParams( "cDonut", -10, -9 );   -- no shortcuts
	Game.AddStageWaypoint( "m1_donut_path2a" );
	Game.AddStageWaypoint( "m1_donut_path12" );
	Game.AddStageWaypoint( "m1_donut_path13" );
	Game.AddStageWaypoint( "m1_donut_path14" );
	Game.AddObjective("dump");
		Game.SetObjTargetVehicle("cDonut");
		Game.AddCollectible("m1_collectible_1","donut");
		Game.AddCollectible("m1_collectible_2","donut");
		Game.AddCollectible("m1_collectible_3","donut");
		Game.AddCollectible("m1_collectible_4","donut");
		Game.AddCollectible("m1_collectible_5","donut");
		Game.AddCollectible("m1_collectible_6","donut");
		Game.AddCollectible("m1_collectible_7","donut");
		Game.AddCollectible("m1_collectible_8","donut");
		Game.AddCollectible("m1_collectible_9","donut");
		Game.AddCollectible("m1_collectible_10","donut");
	Game.CloseObjective();
	Game.SetStageTime(120);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage();
	Game.SetStageMessageIndex(262);
	Game.SetHUDIcon( "lardlads" );
	Game.AddObjective("goto");
		Game.AddNPC("wiggum","m1_wiggum_place"); --wiggum should go here
		Game.SetDestination("m1_lardlads", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.AddStageTime(45);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(1);
	Game.SetStageMessageIndex(104);
	Game.SetHUDIcon( "wiggum" );
	Game.AddObjective("talkto");
		Game.AddNPC("wiggum","m1_wiggum_place");
		Game.AddObjectiveNPCWaypoint( "wiggum", "m1_wiggum_walk1" );
		Game.AddObjectiveNPCWaypoint( "wiggum", "m1_wiggum_walk2" );
		Game.AddObjectiveNPCWaypoint( "wiggum", "m1_wiggum_place" );
		Game.SetTalkToTarget("wiggum", 0, 0); -- 0 - eclamation, 1 is gift, with optional hieight offset
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0,"final");
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetCamBestSide("m1_bestside");
		Game.SetDialogueInfo("marge","wiggum","shack",0);
		Game.SetDialoguePositions("m1_marge","m1_wiggum","m1_donut_carstart",1);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
