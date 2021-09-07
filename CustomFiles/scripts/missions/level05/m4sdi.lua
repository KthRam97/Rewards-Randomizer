Game.SelectMission("m4sd");

c_level = 5
c_mission = 4

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m4_apu_start","m4_carstart");
Game.SetDynaLoadData("l5r1.p3d;l5z1.p3d;l5z2.p3d;");

Game.UsePedGroup(0);

Game.SetMissionStartCameraName( "mission5camShape" );
Game.SetMissionStartMulticontName( "mission5cam" );
Game.SetAnimatedCameraName( "mission5camShape" );
Game.SetAnimCamMulticontName( "mission5cam" );

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(171);
	Game.SetHUDIcon( "kburger" );
	Game.AddObjective( "goto" );
		Game.AddNPC("krusty", "m4_krusty_sd");
		Game.SetDestination( "m4_krustyburger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(191);
	Game.SetHUDIcon( "krusty" );
	Game.AddObjective("talkto");
		Game.AddNPC("krusty", "m4_krusty_sd");
		Game.AddObjectiveNPCWaypoint( "krusty", "m4_krusty_walk1" );
		Game.AddObjectiveNPCWaypoint( "krusty", "m4_krusty_walk2" );
		Game.AddObjectiveNPCWaypoint( "krusty", "m4_krusty_walk3" );
		Game.AddObjectiveNPCWaypoint( "krusty", "m4_krusty_walk4" );
		Game.SetTalkToTarget("krusty", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["5"]["M3"] == true then
--LOCKED STAGE FOR APU'S AMERICAN CLOTHES
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","skin","a_american");
	Game.SetStageMessageIndex(7);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_04.p3d" );
		Game.SetCamBestSide( "m4_bestside" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide("m4_bestside");
		Game.SetDialogueInfo("apu","krusty","clown",0);
		Game.SetDialoguePositions("m4_apu_talk","m4_krusty_walk4","m4_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(205);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "a_american");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_04.p3d" );
		Game.SetCamBestSide( "m4_bestside" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide("m4_bestside");
		Game.SetDialogueInfo("apu","krusty","clown",0);
		Game.SetDialoguePositions("m4_apu_talk","m4_krusty_walk4","m4_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(19);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "beeman");
	Game.CloseObjective();
Game.CloseStage();
end

Game.AddStage(0);
	Game.SetStageMessageIndex(171);
	Game.SetHUDIcon( "kburger" );
	Game.AddObjective( "goto" );
		Game.AddNPC("krusty", "m4_krusty_sd");
		Game.SetDestination( "m4_krustyburger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon( "kburger" );
	Game.SetStageMessageIndex(270);
	Game.AddObjective("goto");
		Game.SetDestination("m4_gated_start","triggersphere");
		Game.MustActionTrigger();
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();


