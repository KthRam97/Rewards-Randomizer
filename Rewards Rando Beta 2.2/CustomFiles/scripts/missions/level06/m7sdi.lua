Game.SelectMission("m7sd");

c_level = 6
c_mission = 7

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m7_bart_start","m7_carstart");
Game.SetDynaLoadData("l6z1.p3d;l6r1.p3d;l6r5.p3d;l6r5_dam.p3d;");

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
	Game.SetStageMessageIndex(180);
	Game.SetHUDIcon("kburger");
	Game.AddObjective( "goto" );
		Game.AddNPC("homer", "m7_homer_sd");
		Game.AddStageVehicle("homer_v","m7_homer_carstart","NULL","HardRace\\AI_2nd.con");
		Game.SetDestination( "m7_krustyburger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(201);
	Game.SetHUDIcon("homer");
	Game.AddObjective("talkto");
		Game.AddNPC("homer", "m7_homer_sd");
		Game.AddObjectiveNPCWaypoint( "homer", "m7_homer_walk1" );
		Game.SetTalkToTarget("homer", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["6"]["M6"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetCamBestSide( "bestside_m7" );
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.SetCamBestSide( "m7_bestside" );
		Game.SetDialogueInfo("bart","homer","defile",0);
		Game.SetDialoguePositions("m7_bart_homertalk","m7_homer_sd","m7_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetCamBestSide( "bestside_m7" );
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.SetCamBestSide( "m7_bestside" );
		Game.SetDialogueInfo("bart","homer","defile",0);
		Game.SetDialoguePositions("m7_bart_homertalk","m7_homer_sd","m7_carstart");
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

