Game.SelectMission("m5sd");

c_level = 7
c_mission = 5

reward_giver(c_level,{c_mission,8,9,10,11})


Game.SetMissionResetPlayerOutCar("m5_homer_start", "m5_carstart");
Game.SetDynaLoadData("l7z6.p3d;l7r6.p3d;");

Game.UsePedGroup(5);

--L7M5
if krusty == 0 then
Game.AddPurchaseCarReward( "simpson", "krusty", "npd", "L7M5CS_npcspawn", 1.3, "L7M5CS_carspawn" );
Game.AddPurchaseCarNPCWaypoint("krusty", "L7M5CS_npcwalk");
krusty = krusty + 1
end

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
	Game.SetStageMessageIndex(19);
	Game.SetHUDIcon("burns");
	Game.AddObjective( "goto" );
		Game.SetDestination("m5_talkto_burns", "exclamation");
		Game.SetCollectibleEffect("none");
		Game.MustActionTrigger();
		Game.AddNPC("burns", "m5_burns_2");
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["7"]["M4"] == true then
Game.AddStage("locked","skin","h_scuzzy");
--AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(10);
		Game.AddNPC("burns", "m5_burns_sd");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_05.p3d" );
		Game.SetCamBestSide( "m5_bestside" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.SetConversationCam( 4, "npc_far" );
		Game.SetConversationCam( 5, "pc_far" );
		Game.SetConversationCam( 6, "npc_far" );

		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("homer","burns","barrel",0);
		Game.SetDialoguePositions("m5_homertalk","m5_burns_sd","m5_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(274);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "h_scuzzy");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
--AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(19);
		Game.AddNPC("burns", "m5_burns_sd");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_05.p3d" );
		Game.SetCamBestSide( "m5_bestside" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.SetConversationCam( 4, "npc_far" );
		Game.SetConversationCam( 5, "pc_far" );
		Game.SetConversationCam( 6, "npc_far" );

		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("homer","burns","barrel",0);
		Game.SetDialoguePositions("m5_homertalk","m5_burns_sd","m5_carstart");
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
