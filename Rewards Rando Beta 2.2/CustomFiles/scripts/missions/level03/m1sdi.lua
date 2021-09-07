Game.SelectMission("m1sd");

c_level = 3
c_mission = 1

reward_giver(c_level,{c_mission,8,9,10,11})

-- Set up intro transition camera for Level 03
--
Game.SetMissionStartCameraName( "mission1camShape" );
Game.SetMissionStartMulticontName( "mission1cam" );
Game.SetAnimatedCameraName( "mission1camShape" );
Game.SetAnimCamMulticontName( "mission1cam" );

Game.SetMissionResetPlayerOutCar("level3_lisa_start","level3_carstart");
Game.SetDynaLoadData("l3z1.p3d;l3r1.p3d;l3r5.p3d;l3r5_dam.p3d;");

Game.UsePedGroup(0);

Game.SetInitialWalk("level3_lisa_walkto");

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(176);
	Game.SetHUDIcon( "android" );
	Game.AddObjective("interior");
		Game.SetDestination("Android");
		--AddStageVehicle("comic_v","m1_cbgcar_sd","NULL","EasyRace\AI_5th.con");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.SetStageMessageIndex(54);
	Game.SetHUDIcon( "cbg" );
	Game.AddObjective("talkto", "neither");
		Game.AddNPC("cbg", "m1_cbg_sd");
		Game.SetTalkToTarget("cbg", 0, -0.2, "3.0");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_01.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		--SetCamBestSide("bestside_m1");
		Game.SetDialogueInfo("lisa","cbg","brother",0);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

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
