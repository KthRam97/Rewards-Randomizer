Game.SelectMission("m7sd");

c_level = 5
c_mission = 7

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m7_apu_start", "m5_carstart");
Game.SetDynaLoadData("l5z2.p3d;l5r1.p3d;l5r2.p3d;");

Game.UsePedGroup(2);

Game.SetMissionStartCameraName( "mission7camShape" );
Game.SetMissionStartMulticontName( "mission7cam" );
Game.SetAnimatedCameraName( "mission7camShape" );
Game.SetAnimCamMulticontName( "mission7cam" );

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(226);
	Game.SetHUDIcon( "bart" );
	Game.AddObjective("talkto");
		Game.AddNPC("bart", "m7_bart_sd");
		Game.AddStageVehicle("bart_v","m7_carstart","NULL","HardRace\\AI_2nd.con");
		Game.AddObjectiveNPCWaypoint( "bart", "m7_bart_walk1" );
		Game.SetTalkToTarget("bart", 0, -0.5);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["5"]["M6"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
                Game.RemoveNPC("snake");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "lenny_walk2" );
		Game.SetDialogueInfo("apu","bart","museum",0);
		Game.SetDialoguePositions("m7_bart_walk1","m7_apu_start","m7_carstart");
	Game.CloseObjective();
Game.CloseStage();
else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
                Game.RemoveNPC("snake");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "lenny_walk2" );
		Game.SetDialogueInfo("apu","bart","museum",0);
		Game.SetDialoguePositions("m7_bart_walk1","m7_apu_start","m7_carstart");
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
