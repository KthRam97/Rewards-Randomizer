Game.SelectMission("m2sd");

c_level = 4
c_mission = 2

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission2camShape" );
Game.SetMissionStartMulticontName( "mission2cam" );
Game.SetAnimatedCameraName( "mission2camShape" );
Game.SetAnimCamMulticontName( "mission2cam" );

Game.SetMissionResetPlayerOutCar("m2_marge_start","m2_carstart");
Game.SetDynaLoadData("l4z7.p3d;l4r6.p3d;l4r7.p3d;");

Game.UsePedGroup(6);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(215);
	Game.SetHUDIcon( "cletushs" );
	Game.AddObjective("goto");
		Game.AddNPC("cletus","m2_cletus");
		Game.AddObjectiveNPCWaypoint( "cletus", "m2_cletus_walk1" );
		Game.AddObjectiveNPCWaypoint( "cletus", "m2_cletus" );
		Game.AddStageVehicle("cletu_v","m2_cletustruck_sd","NULL","Missions\\level04\\M2chase.con");
		Game.SetDestination("m2_locator_sd", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(25);
	Game.SetHUDIcon( "cletus" );
	Game.AddObjective("talkto");
		Game.AddNPC("cletus","m2_cletus");
		Game.AddStageVehicle("cletu_v","m2_cletustruck_sd","NULL","Missions\\level04\\M2chase.con");
		Game.AddObjectiveNPCWaypoint( "cletus", "m2_cletus_walk1" );
		Game.SetTalkToTarget( "cletus", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["4"]["M1"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_02.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetCamBestSide("m2_bestside");
		Game.SetDialogueInfo("marge","cletus","decrapitude",0);
		Game.SetDialoguePositions("m2_marge","m2_cletus_walk1","m2_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(19);
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_02.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetCamBestSide("m2_bestside");
		Game.SetDialogueInfo("marge","cletus","decrapitude",0);
		Game.SetDialoguePositions("m2_marge","m2_cletus_walk1","m2_carstart");
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

