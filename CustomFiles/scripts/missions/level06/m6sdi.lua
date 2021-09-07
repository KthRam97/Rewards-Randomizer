Game.SelectMission("m6sd");

c_level = 6
c_mission = 6

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m6_bart_start","m6_carstart");
Game.SetDynaLoadData("l6z4.p3d;l6r3.p3d;l6r4.p3d;");

Game.UsePedGroup(6);

Game.SetMissionStartCameraName( "mission6camShape" );
Game.SetMissionStartMulticontName( "mission6cam" );
Game.SetAnimatedCameraName( "mission6camShape" );
Game.SetAnimCamMulticontName( "mission6cam" );

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(209);
	Game.SetHUDIcon("krustylu");
	Game.AddObjective( "goto" );
		Game.AddNPC("krusty", "m6_krusty_sd");
		Game.SetDestination( "m6_krustylu", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(191);
	Game.SetHUDIcon("krusty");
	Game.AddObjective("talkto");
		Game.AddNPC("krusty", "m6_krusty_sd");
		Game.AddObjectiveNPCWaypoint( "krusty", "m6_krusty_walk1" );
		Game.SetTalkToTarget("krusty", 0, 0);
	Game.CloseObjective();
Game.CloseStage();


if CompletedMissions.Missions["6"]["M5"] == true then
--LOCKED STAGE FOR SCHOOL BUS
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","car","scorp_v");
	Game.SetStageMessageIndex(8);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_06.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m6_bestside" );
		Game.SetDialogueInfo("bart","krusty","freeguns",0);
		Game.SetDialoguePositions("m6_bart_krustytalk","m6_krusty_sd","m6_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(213);
	Game.SetHUDIcon( "kearney" );
	Game.AddObjective("buycar", "scorp_v");
	Game.CloseObjective();
Game.CloseStage();

else
--LOCKED STAGE FOR SCHOOL BUS
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_06.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m6_bestside" );
		Game.SetDialogueInfo("bart","krusty","freeguns",0);
		Game.SetDialoguePositions("m6_bart_krustytalk","m6_krusty_sd","m6_carstart");
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
