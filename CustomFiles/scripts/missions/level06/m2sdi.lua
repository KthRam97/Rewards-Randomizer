Game.SelectMission("m2sd");

c_level = 6
c_mission = 2

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m2_bart_start","level6_carstart");
Game.SetDynaLoadData("l6z4.p3d;l6r3.p3d;l6r4.p3d;");

Game.UsePedGroup(6);

Game.SetMissionStartCameraName( "mission2camShape" );
Game.SetMissionStartMulticontName( "mission2cam" );
Game.SetAnimatedCameraName( "mission2camShape" );
Game.SetAnimCamMulticontName( "mission2cam" );

Game.AddStage(5);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(43);
	Game.SetHUDIcon("barneuni");
	Game.AddObjective("talkto");
		Game.AddNPC("brn_unf", "m2_barney_sd");
		Game.AddObjectiveNPCWaypoint( "brn_unf", "m2_barney_walk1" );
		Game.AddObjectiveNPCWaypoint( "brn_unf", "m2_barney_walk2" );
		Game.AddObjectiveNPCWaypoint( "brn_unf", "m2_barney_walk3" );
		Game.AddObjectiveNPCWaypoint( "brn_unf", "m2_barney_walk4" );
		Game.AddObjectiveNPCWaypoint( "brn_unf", "m2_barney_walk5" );
		Game.AddObjectiveNPCWaypoint( "brn_unf", "m2_barney_walk6" );
		Game.AddObjectiveNPCWaypoint( "brn_unf", "m2_barney_walk5" );
		Game.AddObjectiveNPCWaypoint( "brn_unf", "m2_barney_walk4" );
		Game.AddObjectiveNPCWaypoint( "brn_unf", "m2_barney_walk3" );
		Game.SetTalkToTarget("brn_unf", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["6"]["M1"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_02.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_near" );
		Game.SetConversationCam( 6, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide( "m2_bestside" );
		Game.SetDialogueInfo("bart","brn_unf","duff",0);
		Game.SetDialoguePositions("bart_barneytalk","m2_barney_sd","m2_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_02.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_near" );
		Game.SetConversationCam( 6, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide( "m2_bestside" );
		Game.SetDialogueInfo("bart","brn_unf","duff",0);
		Game.SetDialoguePositions("bart_barneytalk","m2_barney_sd","m2_carstart");
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
