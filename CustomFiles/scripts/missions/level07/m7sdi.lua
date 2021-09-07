Game.SelectMission("m7sd");

c_level = 7
c_mission = 7

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
	Game.SetHUDIcon("grampa");
	Game.SetStageMessageIndex(29);
	Game.AddObjective("talkto");
		Game.AddStageVehicle("gramR_v","m7_grampa_carstart","NULL","HardRace\\AI_2nd.con");
		Game.AddNPC("grandpa", "m2_cbg_sd");
		Game.AddObjectiveNPCWaypoint( "grandpa", "m2_cbg_walk1" );
		Game.AddObjectiveNPCWaypoint( "grandpa", "m2_cbg_walk2" );
		Game.AddObjectiveNPCWaypoint( "grandpa", "m2_cbg_walk3" );
		Game.SetTalkToTarget("grandpa", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["7"]["M5"] == true then
Game.AddStage("locked","skin","h_donut");
--AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(19);
	    Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("homer","grandpa","sacrifice",0);
		Game.SetCamBestSide( "m2_bestside" );
		Game.SetDialoguePositions("m2_homer_start","m2_cbg_walk1","m2_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(276);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "h_donut");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
--AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(18);
	    Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("homer","grandpa","sacrifice",0);
		Game.SetCamBestSide( "m2_bestside" );
		Game.SetDialoguePositions("m2_homer_start","m2_cbg_walk1","m2_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(18);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "beeman");
	Game.CloseObjective();
Game.CloseStage();

end

Game.CloseMission();
