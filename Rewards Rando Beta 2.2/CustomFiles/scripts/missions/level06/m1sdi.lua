Game.SelectMission("m1sd");

c_level = 6
c_mission = 1

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("level6_bart_start","level6_carstart");
Game.SetDynaLoadData("l6z1.p3d;l6r1.p3d;l6r5.p3d;l6r5_dam.p3d;");

Game.UsePedGroup(0);

Game.SetMissionStartCameraName( "mission1camShape" );
Game.SetMissionStartMulticontName( "mission1cam" );
Game.SetAnimatedCameraName( "mission1camShape" );
Game.SetAnimCamMulticontName( "mission1cam" );

Game.SetInitialWalk("l6_bart_walkto");

Game.AddStage(5);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(157);
	Game.SetHUDIcon("apu");
	Game.AddObjective("talkto");
		Game.AddStageVehicle("otto_v","m1_otto_carstart","NULL", "Missions\\level06\\M1otto_v.con", "none");
		Game.AddNPC("otto", "m1_otto_sd");
		Game.AddNPC("apu", "m1_apu_sd");
		Game.SetTalkToTarget("apu", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AllowMissionAbort( "false" );
	Game.AddObjective("dialogue");
		Game.SetCamBestSide( "bestside_m1" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m1_bestside" );
		Game.SetDialogueInfo("bart","apu","scared",0);
		Game.SetDialoguePositions("l6_bart_walkto","m1_apu_sd","level6_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(4);
	Game.SetStageMessageIndex(160);
	Game.SetHUDIcon("otto");
	Game.AddObjective("talkto");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_01.p3d" );
		Game.AddNPC("otto", "m1_otto_sd"); --h
		Game.AddObjectiveNPCWaypoint( "otto", "m1_otto_walk1" );
		Game.AddObjectiveNPCWaypoint( "otto", "m1_otto_walk2" );
		Game.AddObjectiveNPCWaypoint( "otto", "m1_otto_walk3" );
		Game.AddObjectiveNPCWaypoint( "otto", "m1_otto_walk4" );
		Game.AddObjectiveNPCWaypoint( "otto", "m1_otto_walk5" );
		Game.AddObjectiveNPCWaypoint( "otto", "m1_otto_walk6" );
		Game.SetTalkToTarget("otto", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetCamBestSide( "m1_bestside" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m1_bestside" );
		Game.SetDialogueInfo("bart","otto","krustylu",0);
		Game.SetDialoguePositions("bart_ottotalk","m1_otto_sd","level6_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
