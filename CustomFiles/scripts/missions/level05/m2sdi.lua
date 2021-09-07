Game.SelectMission("m2sd");

c_level = 5
c_mission = 2

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m2_apu_start","m2_carstart");
Game.SetDynaLoadData("l5z2.p3d;l5r1.p3d;l5r2.p3d;");

Game.UsePedGroup(2);

Game.SetMissionStartCameraName( "mission2camShape" );
Game.SetMissionStartMulticontName( "mission2cam" );
Game.SetAnimatedCameraName( "mission2camShape" );
Game.SetAnimCamMulticontName( "mission2cam" );

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(4);
	Game.SetStageMessageIndex(190);
	Game.SetHUDIcon( "louie" );
	Game.AddObjective("talkto");
		Game.AddNPC("louie", "m2_louie_sd");
		Game.AddObjectiveNPCWaypoint( "louie", "m2_louie_walk1" );
		Game.AddObjectiveNPCWaypoint( "louie", "m2_louie_walk2" );
		Game.AddObjectiveNPCWaypoint( "louie", "m2_louie_walk1" );
		Game.SetTalkToTarget("louie", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["5"]["M1"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_02.p3d" );
		Game.SetCamBestSide( "m2_bestside" );
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
		--SetConversationCamNpcName("npc_far");
		--SetConversationCamPcName("pc_far");
		Game.SetDialogueInfo("apu","louie","italian",0);
		Game.SetDialoguePositions("m2_apu_talk","m2_louie_walk1","m2_carstart");
	Game.CloseObjective();
Game.CloseStage();
else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_02.p3d" );
		Game.SetCamBestSide( "m2_bestside" );
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
		--SetConversationCamNpcName("npc_far");
		--SetConversationCamPcName("pc_far");
		Game.SetDialogueInfo("apu","louie","italian",0);
		Game.SetDialoguePositions("m2_apu_talk","m2_louie_walk1","m2_carstart");
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
