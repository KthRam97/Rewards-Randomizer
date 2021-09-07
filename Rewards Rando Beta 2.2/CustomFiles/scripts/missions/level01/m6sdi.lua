Game.SelectMission("m6sd");

c_level = 1
c_mission = 6

reward_giver(c_level,{c_mission,8,9,10,11})

	Game.SetMissionStartCameraName( "mission6camShape" );
	Game.SetMissionStartMulticontName( "mission6cam" );
	Game.SetAnimatedCameraName( "mission6camShape" );
	Game.SetAnimCamMulticontName( "mission6cam" );

Game.SetMissionResetPlayerOutCar("m6_homer_start", "m6_carstart");
Game.SetDynaLoadData("l1z3.p3d;l1r3.p3d;l1r2.p3d;");

Game.UsePedGroup(3);

Game.AddStage(1);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetStageMessageIndex(161);
	Game.SetMaxTraffic(2);
	Game.SetHUDIcon("grocery");
	Game.AddObjective("goto");
		Game.AddNPC("marge", "m6_marge_sd");
		Game.SetDestination("m6_locator_sd", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AddStageVehicle("marge_v","m6_canyanaro_sd","NULL","EasyRace\\AI_5th.con");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(00);
	Game.SetHUDIcon("marage");
	Game.AddObjective("talkto");
		Game.AddNPC("marge", "m6_marge_sd");
		Game.AddObjectiveNPCWaypoint( "marge", "m6_marge_walk_2" );
		Game.AddObjectiveNPCWaypoint( "marge", "m6_marge_walk_1" );
		Game.SetTalkToTarget("marge", 0, 0.2);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["1"]["M5"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_06.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_near" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_near" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.SetCamBestSide( "m6_end");
		Game.SetDialogueInfo("homer","marge","violent",0);
		Game.SetDialoguePositions("m6_homer","m6_homer_start","m6_marge_walk_2");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.AddObjective("dialogue");
	Game.SetStageMessageIndex(19)
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_06.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_near" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_near" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.SetCamBestSide( "m6_end");
		Game.SetDialogueInfo("homer","marge","violent",0);
		Game.SetDialoguePositions("m6_homer","m6_homer_start","m6_marge_walk_2");
	Game.CloseObjective();
Game.CloseStage();


Game.AddStage(0);
	Game.SetStageMessageIndex(276);
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
