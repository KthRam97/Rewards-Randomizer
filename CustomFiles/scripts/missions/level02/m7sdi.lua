Game.SelectMission("m7sd");

c_level = 2
c_mission = 7

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission4camShape" );
Game.SetMissionStartMulticontName( "mission4cam" );
Game.SetAnimatedCameraName( "mission4camShape" );
Game.SetAnimCamMulticontName( "mission4cam" );

Game.SetMissionResetPlayerOutCar("m4_bart_start","m4_carstart"); --reusing mission 4 start locators
Game.SetDynaLoadData("l2z1.p3d;l2z4.p3d;l2r4.p3d;");

Game.UsePedGroup(6);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(4);
	Game.SetStageMessageIndex(55);
	Game.SetHUDIcon( "stadium" );
	Game.AddObjective("goto");
		Game.AddNPC("frink", "m4_frink_sd");
		Game.SetDestination("stadium", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(66);
	Game.SetHUDIcon( "frink" );
	Game.AddObjective("talkto");
		Game.AddNPC("frink", "m4_frink_sd");  --reusing mission 4 locator
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk1" );
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk2" );
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_sd" );
		Game.SetTalkToTarget("frink", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["2"]["M6"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m4_bestside");
		--SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("bart","frink","doodad",0);
		Game.SetDialoguePositions("m4_bart_start","m4_frink_sd","m4_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.AddObjective("dialogue");
	Game.SetStageMessageIndex(19);
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis02_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_near" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m4_bestside");
		--SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("bart","frink","doodad",0);
		Game.SetDialoguePositions("m4_bart_start","m4_frink_sd","m4_carstart");
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
