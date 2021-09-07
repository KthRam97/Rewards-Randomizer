Game.SelectMission("m6sd");

c_level = 7
c_mission = 6

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m2_homer_start", "m2_carstart");
Game.SetDynaLoadData("l7z3.p3d;l7r2.p3d;l7r3.p3d;");

Game.UsePedGroup(3);

Game.SetMissionStartCameraName( "mission2camShape" );
Game.SetMissionStartMulticontName( "mission2cam" );
Game.SetAnimatedCameraName( "mission2camShape" );
Game.SetAnimCamMulticontName( "mission2cam" );

Game.AddStage(5);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(60);
	Game.SetHUDIcon("snake");
	Game.AddObjective("talkto");
		Game.AddNPC("snake", "m2_cbg_sd");
		Game.AddStageVehicle("snake_v","m6_snake_carstart","NULL","HardRace\\AI_2nd.con");
		Game.AddObjectiveNPCWaypoint( "snake", "m2_cbg_walk1" );
		Game.AddObjectiveNPCWaypoint( "snake", "m2_cbg_walk2" );
		Game.AddObjectiveNPCWaypoint( "snake", "m2_cbg_walk3" );
		Game.SetTalkToTarget("snake", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["7"]["M5"] == true then
Game.AddStage("locked","skin","h_evil");
--AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(11);
	    Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_06.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("homer","snake","carjack",0);
		Game.SetCamBestSide( "m2_bestside" );
		Game.SetDialoguePositions("m2_homer_start","m2_cbg_walk1","m2_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(275);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "h_evil");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
--AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(19);
	    Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_06.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("homer","snake","carjack",0);
		Game.SetCamBestSide( "m2_bestside" );
		Game.SetDialoguePositions("m2_homer_start","m2_cbg_walk1","m2_carstart");
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
