Game.SelectMission("m3sd");

c_level = 2
c_mission = 3

reward_giver(c_level,{c_mission,8,9,10,11})
Game.SetMissionStartCameraName( "mission3camShape" );
Game.SetMissionStartMulticontName( "mission3cam" );
Game.SetAnimatedCameraName( "mission3camShape" );
Game.SetAnimCamMulticontName( "mission3cam" );

Game.SetMissionResetPlayerOutCar("m3_bart_start","m3_carstart");
Game.SetDynaLoadData("l2z4.p3d;l2r3.p3d;l2r4.p3d;");

Game.UsePedGroup(5);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetStageMessageIndex(167);
	Game.SetHUDIcon( "google" );
	Game.SetMaxTraffic(4);
	Game.AddObjective("goto");
		Game.AddNPC("cbg", "m3_cbg_sd");
		Game.SetDestination("googleplex", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.AddStageVehicle("comic_v","m3_cbgcar_sd","NULL","EasyRace\\AI_5th.con");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(54);
	Game.SetHUDIcon( "cbg" );
	Game.AddObjective("talkto");
		Game.AddNPC("cbg", "m3_cbg_sd");
		Game.AddObjectiveNPCWaypoint( "cbg", "m3_cbg_walk1" );
		--AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk2" );
		Game.SetTalkToTarget("cbg", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["2"]["M2"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );

		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );

		Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );

		Game.SetCamBestSide("m3_bestside");
		Game.SetDialogueInfo("bart","cbg","jabba",0);
		Game.SetDialoguePositions("m3_bart_start","m3_cbg_sd","m3_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.AddObjective("dialogue");
	Game.SetStageMessageIndex(19);
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );

		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );

		Game.AddAmbientPcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );

		Game.SetCamBestSide("m3_bestside");
		Game.SetDialogueInfo("bart","cbg","jabba",0);
		Game.SetDialoguePositions("m3_bart_start","m3_cbg_sd","m3_carstart");
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
