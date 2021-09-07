Game.SelectMission("m5");

c_level = 1
c_mission = 5

Game.SetMissionResetPlayerInCar("m5_carstart");
Game.SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;");
Game.UsePedGroup( 0 );

Game.AddStage(0);
	Game.SetStageMessageIndex(250);
	Game.AddObjective("gooutside");
		Game.SetDestination("outside_Simpsons_house_locator");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage();
	Game.SetHUDIcon( "cvan_v" );
	Game.SetStageMessageIndex(158);
	Game.AddStageVehicle("cVan","m5_van_carstart","NULL","Missions\\level01\\M5evade.con");
	Game.AddObjective("goto","nearest road");
		Game.SetDestination("van_start", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		--MustActionTrigger();
	Game.CloseObjective();
Game.CloseStage();

--AddStage(0);
--	SetStageMessageIndex(12);
--	AddObjective("getin");
--		SetObjTargetVehicle("current");
--	CloseObjective();
--CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetHUDIcon( "cvan_v" );
	Game.SetStageMessageIndex(13);
	Game.ActivateVehicle("cVan","NULL","target");	--race makes it very easy, for a level 1 "tutorial" chase.
						--The difference is that 'race' has slow-down catch-up logic,
						-- 'evade' doesn't
	Game.SetVehicleAIParams( "cVan", 50, 51 ); --  <=== name, min, max; 0,1 = really dumb, no shortcuts
	--SetStageAIRaceCatchupParams("smith_v", 80, 0.5, 1.1, 1.7); --defaults
--	SetStageAIRaceCatchupParams("cVan", 40, 0.1, 1.4, 2.3);
	Game.SetStageAITargetCatchupParams( 	"cVan", 20, 70);

	Game.AddStageWaypoint( "m5_van_path3" );
	Game.AddStageWaypoint( "m5_van_path2" );
	Game.AddStageWaypoint( "m5_van_path6");
	Game.AddObjective("follow","neither");
		Game.SetObjTargetVehicle("cVan");
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0, 250);
		Game.SetCondTargetVehicle("cVan");
	Game.CloseCondition();
	--SetCompletionDialog("skeleton");
	Game.SetFadeOut(1.0);
Game.CloseStage();

Game.AddStage(1);
	Game.AddObjective("timer");
		Game.AddNPC("npd", "m5_marge_end");
		Game.StayInBlack();
		Game.AddStageCharacter( "homer", "m5_homer_end", "", "current", "m5_car_end" );
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );

		Game.SetConversationCam( 0, "pc_near" );

		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );

		Game.SetDialogueInfo("homer","npd","skeleton",0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("timer");
		--AddNPC("ralph", "ambient_ralph");
		--StayInBlack();
		--AddStageCharacter( "homer", "m5_homer_end", "", "current", "m5_car_end" );
		Game.SetDurationTime(1);
	Game.CloseObjective();


Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end
