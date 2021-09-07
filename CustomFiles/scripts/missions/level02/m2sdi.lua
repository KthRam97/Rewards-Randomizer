Game.SelectMission("m2sd");

c_level = 2
c_mission = 2

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission2camShape" );
Game.SetMissionStartMulticontName( "mission2cam" );
Game.SetAnimatedCameraName( "mission2camShape" );
Game.SetAnimCamMulticontName( "mission2cam" );

Game.SetMissionResetPlayerOutCar("m2_bart_start","m2_carstart");
Game.SetDynaLoadData("l2z3.p3d;l2r2.p3d;l2r3.p3d;");

Game.UsePedGroup(4);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetStageMessageIndex(57);
	Game.SetHUDIcon( "hermans" );
	Game.SetMaxTraffic(4);
	Game.AddObjective("goto");
		Game.AddNPC("kearney", "m2_kearney_sd");
		Game.SetDestination("m2_start", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(164);
	Game.SetHUDIcon( "kearney" );
	Game.AddObjective("talkto");
		Game.AddNPC("kearney", "m2_kearney_sd");
		Game.AddObjectiveNPCWaypoint( "kearney", "m2_kearney_walk1" );
		Game.AddObjectiveNPCWaypoint( "kearney", "m2_kearney_walk2" );
		Game.AddObjectiveNPCWaypoint( "kearney", "m2_kearney_walk1" );
		--AddObjectiveNPCWaypoint( "kearney", "m2_kearney_sd" );
		Game.SetTalkToTarget("kearney", 0, -0.5);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["2"]["M1"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_02.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m2_bestside");
		Game.SetDialogueInfo("bart","kearney","fireworks",0);
		Game.SetDialoguePositions("m2_bart_talk","m2_kearney_sd","m2_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(19);
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_02.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m2_bestside");
		Game.SetDialogueInfo("bart","kearney","fireworks",0);
		Game.SetDialoguePositions("m2_bart_talk","m2_kearney_sd","m2_carstart");
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
