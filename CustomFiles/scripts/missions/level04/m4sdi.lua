Game.SelectMission("m4sd");

c_level = 4
c_mission = 4

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission4camShape" );
Game.SetMissionStartMulticontName( "mission4cam" );
Game.SetAnimatedCameraName( "mission4camShape" );
Game.SetAnimCamMulticontName( "mission4cam" );

Game.SetMissionResetPlayerOutCar("m4_marge_start","m4_carstart");
Game.SetDynaLoadData("l4z1.p3d;l4z7.p3d;l4r7.p3d;");

Game.UsePedGroup(6);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(240);
	Game.SetHUDIcon("cemetery");
	Game.AddObjective("goto");
--		AddStageVehicle("cletu_v","m2_cletustruck_sd","NULL","Missions\level04\M2chase.con");
		Game.AddNPC("moleman", "m4_moleman_sd");
		Game.SetDestination("m5_graveyard", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(25);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(105);
	Game.SetHUDIcon("moleman");
	Game.AddObjective("talkto");
		Game.AddNPC("moleman", "m4_moleman_sd");
		Game.AddObjectiveNPCWaypoint( "moleman", "m4_moleman_walk1" );
		Game.AddObjectiveNPCWaypoint( "moleman", "m4_moleman_walk2" );
		Game.AddObjectiveNPCWaypoint( "moleman", "m4_moleman_sd" );
		Game.SetTalkToTarget("moleman", 0, -0.5);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["4"]["M3"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_04.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_near" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_near" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m4_bestside");
		Game.SetDialogueInfo("marge","moleman","hiding",0);
		Game.SetDialoguePositions("m4_marge_talk","m4_moleman_sd","m4_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_04.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_near" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_near" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m4_bestside");
		Game.SetDialogueInfo("marge","moleman","hiding",0);
		Game.SetDialoguePositions("m4_marge_talk","m4_moleman_sd","m4_carstart");
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
