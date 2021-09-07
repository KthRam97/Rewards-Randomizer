Game.SelectMission("m3sd");

c_level = 5
c_mission = 3

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m3_bestside","m3_carstart");
Game.SetDynaLoadData("l5z1.p3d;l5r1.p3d;l5r4.p3d;");

Game.UsePedGroup(0);

Game.SetMissionStartCameraName( "mission3camShape" );
Game.SetMissionStartMulticontName( "mission3cam" );
Game.SetAnimatedCameraName( "mission3camShape" );
Game.SetAnimCamMulticontName( "mission3cam" );

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(72);
	Game.SetHUDIcon( "drhibert" );
	Game.AddObjective("talkto");
		Game.AddNPC("hibbert", "m3_hibbert_sd");
		Game.AddObjectiveNPCWaypoint( "hibbert", "m3_hibbert_walk1" );
		Game.AddObjectiveNPCWaypoint( "hibbert", "m3_hibbert_walk2" );
		Game.AddObjectiveNPCWaypoint( "hibbert", "m3_hibbert_walk3" );
		Game.AddObjectiveNPCWaypoint( "hibbert", "m3_hibbert_sd" );
		Game.SetTalkToTarget("hibbert", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["5"]["M2"] == true then
--LOCKED STAGE FOR MR PLOW
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","car","carhom_v");
	Game.SetStageMessageIndex(6);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide("m3_bestside");
		Game.SetDialogueInfo("apu","hibbert","emergency",0);
		Game.SetDialoguePositions("m3_apu_start","m3_hibbert_walk2","m3_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(204);
	Game.SetHUDIcon( "homer" );
	Game.AddObjective("buycar", "carhom_v");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide("m3_bestside");
		Game.SetDialogueInfo("apu","hibbert","emergency",0);
		Game.SetDialoguePositions("m3_apu_start","m3_hibbert_walk2","m3_carstart");
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
