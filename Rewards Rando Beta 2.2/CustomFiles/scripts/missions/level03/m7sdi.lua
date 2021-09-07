Game.SelectMission("m7sd");

c_level = 3
c_mission = 7

reward_giver(c_level,{c_mission,8,9,10,11})


Game.SetAnimatedCameraName( "mission6camShape" );
Game.SetAnimCamMulticontName( "mission6cam" );
Game.SetMissionStartCameraName( "mission6camShape" );
Game.SetMissionStartMulticontName( "mission6cam" );
Game.SetMissionResetPlayerOutCar("m6_lisa_start", "m7_carstart"); --REUSING MISSION 6 LOCATORS
Game.SetDynaLoadData("l3z3.p3d;l3r3.p3d;l3r2.p3d;");

Game.UsePedGroup(5);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(196);
	Game.SetHUDIcon( "chum" );
	Game.AddObjective("goto");
		Game.AddNPC("captain", "m6_captain_sd");
		Game.SetDestination("m6_fishstore_sd", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(197);
	Game.SetHUDIcon( "scaptain" );
	Game.AddObjective("talkto");
		Game.AddNPC("captain", "m6_captain_sd");
		Game.AddObjectiveNPCWaypoint( "captain", "m6_captain_walk1_sd" );
		Game.SetTalkToTarget("captain", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["3"]["M6"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_near" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_near" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m6_bestside");
		Game.SetDialogueInfo("lisa","captain","catch",0);
		Game.SetDialoguePositions("m6_lisa_loc","m6_captain_walk1_sd","m7_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_near" );
		Game.SetConversationCam( 1, "pc_far" );
		Game.SetConversationCam( 2, "npc_near" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m6_bestside");
		Game.SetDialogueInfo("lisa","captain","catch",0);
		Game.SetDialoguePositions("m6_lisa_loc","m6_captain_walk1_sd","m7_carstart");
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
