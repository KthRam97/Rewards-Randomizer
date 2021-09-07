Game.SelectMission("m7");
c_level = 1
c_mission = 7

Game.SetMissionResetPlayerInCar("m7_car_start");
Game.SetDynaLoadData("l1z6.p3d;l1r6.p3d;");

Game.UsePedGroup(7);

--Chuck: StreetRace Prop Load and Unload Setup - used here to load power plant door to block he shortcut
Game.StreetRacePropsLoad("l1m7door.p3d;");
Game.StreetRacePropsUnload("l1m7door.p3d:");


--AddStage(0);
--	SetStageMessageIndex(12);
--	AddObjective("getin","neither");
--		SetObjTargetVehicle("current");
--	CloseObjective();
--CloseStage();

--AddStage();
--	RESET_TO_HERE();
--	SetHUDIcon( "mansion" );
--	SetStageMessageIndex(18);
--	SetMaxTraffic(2); //for this race, reduce traffic to prevent overwhelming the user
--	AddStageVehicle("smith_v","m7_smithers_carstart","NULL","Missions\level01\M7race.con", "smithers");
--	AddObjective("goto","nearest here");
--		SetDestination("limo_start", "carsphere");
--		SetCollectibleEffect("wrench_collect");
--	CloseObjective();
--CloseStage();

Game.AddStage(1);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(2); --for this race, reduce traffic to prevent overwhelming the user
	Game.SetStageMessageIndex(18);
	Game.SetHUDIcon( "mansion" );
	Game.ShowStageComplete();
	--ActivateVehicle("smith_v","NULL","race");
	Game.AddStageVehicle("smith_v","m7_smithers_carstart","race","Missions\\level01\\M7race.con", "smithers");
--SetStageAIRaceCatchupParams(
--	STAGEVEHICLENAME,
--      ALONGROADDISTFROMPLAYER_TO_APPLYMAXCATCHUP, // default = 80
--      FRACTIONPLAYERSPEED_MINCATCHUP,   // default = 0.5
--      FRACTIONPLAYERSPEED_NOCATCHUP,    // default = 1.1
--      FRACTIONPLAYERSPEED_MAXCATCHUP )  // default = 1.7	AddStageWaypoint( "m7_smithers_race1" );
--SetStageAIRaceCatchupParams("smith_v", 80, 0.5, 1.1, 1.7);
--SetStageAIRaceCatchupParams("smith_v", 80, 0.75, 1.1, 2.3);
Game.SetStageAIRaceCatchupParams("smith_v", 80, 0.5, 1.0, 1.5);
--	SetVehicleAIParams( "smith_v", -10, -9 );   // no shortcuts
	Game.AddStageWaypoint( "m7_smithers_race1" );
	Game.AddStageWaypoint( "m5_smithers_nav1" );
	Game.AddStageWaypoint( "m7_smithers_race1b" );
	Game.AddStageWaypoint( "m7_smithers_race9" );
	Game.AddObjective( "race","both");
		Game.AddNPC("burns", "m7_burns_place");
		Game.AddCollectible("m7_smithers_race1");
		Game.AddCollectible("m7_smithers_race2");
		Game.AddCollectible("m7_smithers_race3");
		--AddCollectible("m7_smithers_race4");
		Game.AddCollectible("m7_smithers_race5");
		Game.AddCollectible("m7_smithers_race6");
		Game.AddCollectible("m7_smithers_race7");
		Game.AddCollectible("m7_smithers_race9");
	Game.CloseObjective();
	Game.AddCondition("race");
		Game.SetCondTargetVehicle("smith_v");
	Game.CloseCondition();
	Game.StageStartMusicEvent("M7_drama");
Game.CloseStage();

Game.AddStage();
	Game.SetMaxTraffic(2);
	Game.SetStageMessageIndex(19);
	Game.SetHUDIcon( "burns" );
	Game.AddObjective("talkto");
		Game.AddNPC("burns", "m7_burns_place");
		Game.AddObjectiveNPCWaypoint( "burns", "m7_burns_walk_1" );
		Game.SetTalkToTarget("burns");
	Game.CloseObjective();
	Game.SetCompletionDialog("there");
Game.CloseStage();

Game.AddStage(0, "final");
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_far" );

		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );

		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetCamBestSide("m7_bestside2" );
		Game.SetDialogueInfo("homer","burns","accuse",0);
		Game.SetDialoguePositions("m7_homer_burns","m7_burns_place","race_finish",1);
	Game.CloseObjective();

Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

--dialogue_hands_in_air
--dialogue_hands_on_hips
--dialogue_scratch_head
--dialogue_shaking_fist
--dialogue_thinking
--dialogue_yes
--dialogue_no
--dialogue_cross_arms
--dialogue_open_arm_hand_gesture
--dialogue_shake_hand_in_air
