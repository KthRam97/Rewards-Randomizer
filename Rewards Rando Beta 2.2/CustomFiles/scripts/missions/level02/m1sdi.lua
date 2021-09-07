Game.SelectMission("m1sd");

c_level = 2
c_mission = 1

reward_giver(c_level,{c_mission,8,9,10,11})

-- Set up intro transition camera for Level 02
--
Game.SetMissionStartCameraName( "mission1camShape" );
Game.SetMissionStartMulticontName( "mission1cam" );
Game.SetAnimatedCameraName( "mission1camShape" );
Game.SetAnimCamMulticontName( "mission1cam" );

Game.SetMissionResetPlayerOutCar("l2_bartwalk","level2_carstart");
Game.SetDynaLoadData("l2z1.p3d;l2r1.p3d;l2r4.p3d;");

Game.UsePedGroup(0);

Game.SetInitialWalk("level2_bartstart");

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetStageMessageIndex(163);
	Game.SetHUDIcon( "milhouse" );
	Game.SetMaxTraffic(5);
	Game.AddObjective("talkto","neither");
		Game.AddNPC("milhouse", "m1_milhouse_sd");
		Game.AddObjectiveNPCWaypoint( "milhouse", "level2_bartstart" );
		Game.AddObjectiveNPCWaypoint( "milhouse", "m1_milhouse_walk1" );
		Game.AddObjectiveNPCWaypoint( "milhouse", "m1_milhouse_walk2" );
		--AddObjectiveNPCWaypoint( "milhouse", "m1_milhouse_walk3" );

		Game.SetTalkToTarget("milhouse", 0, -0.5);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_01.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide("m1_bestside");
		Game.SetDialogueInfo("bart","milhouse","bonestorm",0);
		Game.SetDialoguePositions("m1_milhouse_walk1","m1_milhouse_sd","level2_carstart");
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
