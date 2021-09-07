Game.SelectMission("m5sd");

c_level = 6
c_mission = 5

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m5_bart_start","m5_carstart");
Game.SetDynaLoadData("l6z4.p3d;l6r3.p3d;l6r4.p3d;");

Game.UsePedGroup(5);

Game.SetMissionStartCameraName( "mission5camShape" );
Game.SetMissionStartMulticontName( "mission5cam" );
Game.SetAnimatedCameraName( "mission5camShape" );
Game.SetAnimCamMulticontName( "mission5cam" );

Game.AddStage(5);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(246);
	Game.SetHUDIcon("taffy");
	Game.AddObjective( "goto" );
		Game.AddNPC("skinner", "m5_skinner_sd");
		Game.AddStageVehicle("skinn_v","m5_skinner_carstart","NULL","Destroy\\MedDest.con", "none");
		Game.SetDestination( "m5_taffyshop", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(200);
	Game.SetHUDIcon("skinner");
	Game.AddObjective("talkto");
		Game.AddNPC("skinner", "m5_skinner_sd");
		Game.AddStageVehicle("skinn_v","m5_skinner_carstart","NULL","Destroy\\MedDest.con", "none");
		Game.AddObjectiveNPCWaypoint( "skinner", "m5_skinner_walk1" );
		Game.AddObjectiveNPCWaypoint( "skinner", "m5_skinner_walk2" );
		Game.SetTalkToTarget("skinner", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["6"]["M4"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetCamBestSide( "bestside_m5" );
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_05.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m5_bestside" );
		Game.SetDialogueInfo("bart","skinner","warn",0);
		Game.SetDialoguePositions("bart_skinnertalk","m5_skinner_sd","m5_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetCamBestSide( "bestside_m5" );
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_05.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m5_bestside" );
		Game.SetDialogueInfo("bart","skinner","warn",0);
		Game.SetDialoguePositions("bart_skinnertalk","m5_skinner_sd","m5_carstart");
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

