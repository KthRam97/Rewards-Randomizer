Game.SelectMission("m3sd");

c_level = 6
c_mission = 3

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m3_bart_start","m3_carstart");
Game.SetDynaLoadData("l6z3.p3d;l6r2.p3d;l6r3.p3d;");

Game.UsePedGroup(5);

Game.SetMissionStartCameraName( "mission3camShape" );
Game.SetMissionStartMulticontName( "mission3cam" );
Game.SetAnimatedCameraName( "mission3camShape" );
Game.SetAnimCamMulticontName( "mission3cam" );

Game.AddStage(5);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(4);
	Game.SetStageMessageIndex(191);
	Game.SetHUDIcon("krusty");
	Game.AddObjective("talkto");
		Game.AddNPC("krusty", "m3_krusty_sd");
		Game.AddObjectiveNPCWaypoint( "krusty", "m3_krusty_walk1" );
		Game.AddObjectiveNPCWaypoint( "krusty", "m3_krusty_walk2" );
		Game.SetTalkToTarget("krusty", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["6"]["M2"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.SetCamBestSide( "m3_bestside" );
		Game.SetDialogueInfo("bart","krusty","massacre",0);
		Game.SetDialoguePositions("bart_krustytalk","m3_krusty_sd","m3_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.SetCamBestSide( "m3_bestside" );
		Game.SetDialogueInfo("bart","krusty","massacre",0);
		Game.SetDialoguePositions("bart_krustytalk","m3_krusty_sd","m3_carstart");
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
