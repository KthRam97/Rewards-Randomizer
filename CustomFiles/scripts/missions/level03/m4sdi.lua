Game.SelectMission("m4sd");

c_level = 3
c_mission = 4

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetAnimatedCameraName( "mission4camShape" );
Game.SetAnimCamMulticontName( "mission4cam" );
Game.SetMissionStartCameraName( "mission4camShape" );
Game.SetMissionStartMulticontName( "mission4cam" );
Game.SetMissionResetPlayerOutCar("m4_lisa_start", "m4_carstart");
Game.SetDynaLoadData("l3z5.p3d;l3r5.p3d;l3r4.p3d;l3r5_dam.p3d;");

Game.UsePedGroup(4);
--AddStage(0);
--	SetMaxTraffic(3);
--	SetStageMessageIndex(183);
--	SetHUDIcon( "observ" );
--	AddObjective("goto");
--		AddNPC("grandpa", "m4_grampa_sd");
--		SetDestination("m4_lookoutpoint_sd", "triggersphere");
--		SetCollectibleEffect("wrench_collect");
--	CloseObjective();
--CloseStage();

Game.AddStage(5);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(29);
	Game.SetHUDIcon( "grampa" );
	Game.AddObjective("talkto");
		Game.AddNPC("grandpa", "m4_grampa_sd");
		Game.AddObjectiveNPCWaypoint( "grandpa", "m4_grampa_walk1" );
		Game.AddObjectiveNPCWaypoint( "grandpa", "m4_grampa_walk2" );
		Game.AddObjectiveNPCWaypoint( "grandpa", "m4_grampa_walk3" );
		Game.AddObjectiveNPCWaypoint( "grandpa", "m4_lisa_start" );
		Game.SetTalkToTarget("grandpa", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["3"]["M3"] == true then
--LOCKED STAGE FOR SCHOOL BUS
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","car","otto_v");
	Game.SetStageMessageIndex(2);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_04.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide( "m4_bestside" );
		Game.SetDialogueInfo("lisa","grandpa","kaiser",0);
		Game.SetDialoguePositions("m4_lisa_loc","m4_grampa_sd","m4_carstart");
	Game.CloseObjective();
Game.CloseStage();

--THIS DIALOGUE WILL NOT INCLUDE THE GATED LINES AND WILL START THE MISSION
--AddStage(0);
--	AddObjective("dialogue");
--		SetPresentationBitmap( "art/frontend/dynaload/images/mis03_04.p3d" );
--		AmbientAnimationRandomize( 1, 0 );      // ( pc=0, npc=1) (nonrandom=0, random=1)
--		AmbientAnimationRandomize( 0, 0 );
--		SetConversationCam( 0, "pc_far" );
--		SetConversationCam( 1, "npc_near" );
--		SetConversationCam( 2, "pc_far" );
--		SetConversationCam( 3, "npc_far" );
--		AddAmbientNpcAnimation( "none" );
--		AddAmbientNpcAnimation( "dialogue_cross_arms" );
--		AddAmbientNpcAnimation( "none" );
--		AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
--		AddAmbientPcAnimation( "none" );
--		AddAmbientPcAnimation( "dialogue_yes" );
--		SetCamBestSide( "m4_bestside" );
--		SetDialogueInfo("lisa","grandpa","kaiser2",0);
--		SetDialoguePositions("m4_lisa_loc","m4_grampa_sd","m4_carstart");
--	CloseObjective();
--CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(194);
	Game.SetHUDIcon( "otto" );
	Game.AddObjective("buycar", "otto_v");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_04.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide( "m4_bestside" );
		Game.SetDialogueInfo("lisa","grandpa","kaiser",0);
		Game.SetDialoguePositions("m4_lisa_loc","m4_grampa_sd","m4_carstart");
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
