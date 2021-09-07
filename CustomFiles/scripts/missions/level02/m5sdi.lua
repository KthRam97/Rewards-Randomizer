Game.SelectMission("m5sd");

c_level = 2
c_mission = 5

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission5camShape" );
Game.SetMissionStartMulticontName( "mission5cam" );
Game.SetAnimatedCameraName( "mission5camShape" );
Game.SetAnimCamMulticontName( "mission5cam" );

Game.SetInitialWalk("m5_bart_start");
Game.SetMissionResetPlayerOutCar("m5_bart_run","m5_carstart");
Game.SetDynaLoadData("l2z1.p3d;l2r1.p3d;l2z2.p3d;");

Game.UsePedGroup(1);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetStageMessageIndex(171);
	Game.SetHUDIcon( "kburger" );
	Game.SetMaxTraffic(4);
	Game.AddObjective("goto");
		Game.AddNPC("cletus", "m5_cletus_sd");
		Game.SetDestination("m5_krustyburger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AddStageVehicle("cletu_v","m5_cletustruck_sd","NULL","EasyRace\\AI_5th.con");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(25);
	Game.SetHUDIcon( "cletus" );
	Game.AddObjective("talkto");
		Game.AddNPC("cletus", "m5_cletus_sd");
		Game.AddObjectiveNPCWaypoint( "cletus", "m5_cletus_walk1" );
		Game.AddObjectiveNPCWaypoint( "cletus", "m5_cletus_walk2" );
		Game.AddObjectiveNPCWaypoint( "cletus", "m5_cletus_walk1" );
		Game.AddObjectiveNPCWaypoint( "cletus", "m5_cletus_sd" );
		Game.SetTalkToTarget("cletus", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["2"]["M4"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_05.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m5_bestside");
		Game.SetDialogueInfo("bart","cletus","slack",0);
		Game.SetDialoguePositions("m5_bart_run","m5_cletus_walk1","m5_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.AddObjective("dialogue");
	Game.SetStageMessageIndex(19);
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_05.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m5_bestside");
		Game.SetDialogueInfo("bart","cletus","slack",0);
		Game.SetDialoguePositions("m5_bart_run","m5_cletus_walk1","m5_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(19);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "beeman");
	Game.CloseObjective();
Game.CloseStage();
end

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
