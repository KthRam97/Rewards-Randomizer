Game.SelectMission("m3sd");

c_level = 4
c_mission = 3

reward_giver(c_level,{c_mission,8,9,10,11})


Game.SetMissionStartCameraName( "mission3camShape" );
Game.SetMissionStartMulticontName( "mission3cam" );
Game.SetAnimatedCameraName( "mission3camShape" );
Game.SetAnimCamMulticontName( "mission3cam" );

Game.SetMissionResetPlayerOutCar("m2_marge_2","m2_marge_car2");
Game.SetDynaLoadData("l4z2.p3d;l4r1.p3d;l4r2.p3d;");

Game.UsePedGroup(1);

Game.AddStage(25);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(25);
	Game.SetHUDIcon( "cletus" );
	Game.AddObjective("talkto");
		Game.AddStageVehicle("cletu_v","m2_cletustruck_2","NULL","EasyRace\\AI_5th.con");
		Game.AddNPC("cletus", "m2_cletus_2");
		Game.AddObjectiveNPCWaypoint( "cletus", "m3_cletus_walk1" );
		Game.AddObjectiveNPCWaypoint( "cletus", "m3_cletus_walk2" );
		Game.AddObjectiveNPCWaypoint( "cletus", "m3_cletus_walk1" );
		Game.SetTalkToTarget("cletus", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["4"]["M2"] == true then
--LOCKED STAGE FOR MARGE'S PRISON OUTFIT
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","skin","m_prison");
	Game.SetStageMessageIndex(4);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.SetCamBestSide("m3_bestside");
		Game.SetDialogueInfo("marge","cletus","baby",0);
		Game.SetDialoguePositions("m2_marge_talk","m3_cletus_walk1","m2_marge_car2");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(227);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "m_prison");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.SetCamBestSide("m3_bestside");
		Game.SetDialogueInfo("marge","cletus","baby",0);
		Game.SetDialoguePositions("m2_marge_talk","m3_cletus_walk1","m2_marge_car2");
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
	Game.SetStageMessageIndex(267);
	Game.SetHUDIcon( "cletus" );
	Game.AddObjective( "goto" );
		Game.AddStageVehicle("cletu_v","m2_cletustruck_2","NULL","EasyRace\\AI_5th.con");
		Game.AddNPC("cletus", "m2_cletus_2");
--		AddObjectiveNPCWaypoint( "cletus", "m3_cletus_walk1" );
--		AddObjectiveNPCWaypoint( "cletus", "m3_cletus_walk2" );
--		AddObjectiveNPCWaypoint( "cletus", "m3_cletus_walk1" );
		Game.SetDestination( "m3_starting_point", "carsphere" );
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon( "cletus_v" );
	Game.SetStageMessageIndex(2);
	Game.AddObjective("goto");
		Game.AddNPC("cletus", "m2_cletus_2");
		Game.AddObjectiveNPCWaypoint( "cletus", "m3_cletus_walk1" );
		Game.AddObjectiveNPCWaypoint( "cletus", "m3_cletus_walk2" );
		Game.AddObjectiveNPCWaypoint( "cletus", "m3_cletus_walk1" );
		Game.SetDestination("m3_gated_start","triggersphere");
		Game.MustActionTrigger();
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

