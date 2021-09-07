Game.SelectMission("m5sd");

c_level = 4
c_mission = 5

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission5camShape" );
Game.SetMissionStartMulticontName( "mission5cam" );
Game.SetAnimatedCameraName( "mission5camShape" );
Game.SetAnimCamMulticontName( "mission5cam" );

Game.SetMissionResetPlayerOutCar("m5_marge_start","m5_carstart");
Game.SetDynaLoadData("l4z2.p3d;l4r1.p3d;l4r2.p3d;");

Game.UsePedGroup(1);

Game.AddStage(25);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetHUDIcon("grampa");
	Game.SetStageMessageIndex(29);
	Game.AddObjective("talkto");
		Game.AddNPC("grandpa", "m5_grampa_sd");
		Game.SetTalkToTarget("grandpa", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["4"]["M4"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_05.p3d" );
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
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.SetCamBestSide("m5_bestside");
		Game.SetDialogueInfo("marge","grandpa","pills",0);
		Game.SetDialoguePositions("m5_marge_start","m5_grampa_sd","m5_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_05.p3d" );
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
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.SetCamBestSide("m5_bestside");
		Game.SetDialogueInfo("marge","grandpa","pills",0);
		Game.SetDialoguePositions("m5_marge_start","m5_grampa_sd","m5_carstart");
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
