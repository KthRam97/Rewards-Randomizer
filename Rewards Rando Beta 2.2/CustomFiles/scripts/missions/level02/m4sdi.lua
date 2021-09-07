Game.SelectMission("m4sd");

c_level = 2
c_mission = 4

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission4camShape" );
Game.SetMissionStartMulticontName( "mission4cam" );
Game.SetAnimatedCameraName( "mission4camShape" );
Game.SetAnimCamMulticontName( "mission4cam" );

Game.SetMissionResetPlayerOutCar("m4_bart_start","m4_carstart");
Game.SetDynaLoadData("l2z1.p3d;l2r1.p3d;l2r4.p3d;");

Game.UsePedGroup(6);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetStageMessageIndex(55);
	Game.SetHUDIcon( "stadium" );
	Game.SetMaxTraffic(4);
	Game.AddObjective("goto");
		Game.AddNPC("frink", "m4_frink_sd");
		Game.SetDestination("stadium", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(66);
	Game.SetHUDIcon( "frink" );
	Game.AddObjective("talkto");
		Game.AddNPC("frink", "m4_frink_sd");
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk1" );
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk2" );
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_sd" );
		Game.SetTalkToTarget("frink", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["2"]["M3"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_04.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide("m4_bestside");
		Game.SetDialogueInfo("bart","frink","gimme",0);
		Game.SetDialoguePositions("m4_bart_start","m4_frink_sd","m4_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.AddObjective("dialogue");
	Game.SetStageMessageIndex(19);
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_04.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide("m4_bestside");
		Game.SetDialogueInfo("bart","frink","gimme",0);
		Game.SetDialoguePositions("m4_bart_start","m4_frink_sd","m4_carstart");
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
