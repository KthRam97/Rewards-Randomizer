Game.SelectMission("m6sd");

c_level = 2
c_mission = 6

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission6camShape" );
Game.SetMissionStartMulticontName( "mission6cam" );
Game.SetAnimatedCameraName( "mission6camShape" );
Game.SetAnimCamMulticontName( "mission6cam" );

Game.SetMissionResetPlayerOutCar("m4_bart_start","m4_carstart");  --reusing mission 4 locator
Game.SetDynaLoadData("l2z4.p3d;l2z1.p3d;l2r4.p3d;");

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
		Game.AddNPC("frink", "m4_frink_sd");  --reusing mission 4 locator
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk1" );
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk2" );
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_sd" );
		Game.SetTalkToTarget("frink", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["2"]["M5"] == true then
Game.AddStage(1);
	Game.AllowMissionAbort( "false" );
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_06.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_near" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.SetCamBestSide("m4_bestside");
		--SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("bart","frink","blender",0);
		Game.SetDialoguePositions("m4_bart_start","m4_frink_sd","m4_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(173);
	Game.SetHUDIcon( "scream" );
	Game.AddObjective("goto");
		Game.AddNPC("nriviera", "m6_drnick");
		Game.SetDestination("screaming_monkey", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(62);
	Game.SetHUDIcon( "drnick" );
	Game.AddObjective("talkto");
		Game.AddNPC("nriviera", "m6_drnick");
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick_walk1" );
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick_walk2" );
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick_walk3" );
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick" );
		Game.SetTalkToTarget("nriviera", 0, 0);
	Game.CloseObjective();
	Game.AddStageMusicChange();
	Game.SetStageMusicAlwaysOn();
	Game.CloseCondition();
Game.CloseStage();

--LOCKED STAGE FOR MR PLOW
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","car","mrplo_v");
	Game.SetStageMessageIndex(1);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_near" );

		Game.AddAmbientNpcAnimation( "none" );

		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );

		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );

		Game.SetCamBestSide("m6_bestside");
		Game.SetDialogueInfo("bart","nriviera","monkey",0);
		Game.SetDialoguePositions("m6_bart_talk","m6_drnick_walk2","level2_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(242);
	Game.SetHUDIcon( "homer" );
	Game.AddObjective("buycar", "mrplo_v");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.AllowMissionAbort( "false" );
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_06.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_near" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.SetCamBestSide("m4_bestside");
		--SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("bart","frink","blender",0);
		Game.SetDialoguePositions("m4_bart_start","m4_frink_sd","m4_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(19);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "beeman");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(173);
	Game.SetHUDIcon( "scream" );
	Game.AddObjective("goto");
		Game.AddNPC("nriviera", "m6_drnick");
		Game.SetDestination("screaming_monkey", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(62);
	Game.SetHUDIcon( "drnick" );
	Game.AddObjective("talkto");
		Game.AddNPC("nriviera", "m6_drnick");
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick_walk1" );
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick_walk2" );
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick_walk3" );
		Game.AddObjectiveNPCWaypoint( "nriviera", "m6_drnick" );
		Game.SetTalkToTarget("nriviera", 0, 0);
	Game.CloseObjective();
	Game.AddStageMusicChange();
	Game.SetStageMusicAlwaysOn();
	Game.CloseCondition();
Game.CloseStage();

--LOCKED STAGE FOR MR PLOW
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","car","mrplo_v");
	Game.SetStageMessageIndex(1);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_near" );

		Game.AddAmbientNpcAnimation( "none" );

		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );

		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );

		Game.SetCamBestSide("m6_bestside");
		Game.SetDialogueInfo("bart","nriviera","monkey",0);
		Game.SetDialoguePositions("m6_bart_talk","m6_drnick_walk2","level2_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(242);
	Game.SetHUDIcon( "homer" );
	Game.AddObjective("buycar", "mrplo_v");
	Game.CloseObjective();
Game.CloseStage();
end

Game.CloseMission();
