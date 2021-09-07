Game.SelectMission("m3sd");

c_level = 7
c_mission = 3

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m3_homer_start", "m3_carstart");
Game.SetDynaLoadData("l7z6.p3d;l7r6.p3d;");

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
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(66);
	Game.SetHUDIcon( "frink" );
	Game.AddObjective("talkto");
		Game.AddNPC("frink", "m3_frink_sd");
		Game.AddStageVehicle("frink_v","m3_frink_carstart","NULL","HardRace\\AI_2nd.con");
		Game.AddObjectiveNPCWaypoint( "frink", "m3_frink_walk1" );
		Game.AddObjectiveNPCWaypoint( "frink", "m3_frink_walk2" );
		Game.AddObjectiveNPCWaypoint( "frink", "m3_frink_walk3" );
		Game.SetTalkToTarget("frink", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["7"]["M2"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.SetCamBestSide( "m3_frink_walk2" );
		Game.SetDialogueInfo("homer","frink","nuclear",0);
		Game.SetDialoguePositions("m3_frink_walk3","m3_frink_walk1","m3_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.SetCamBestSide( "m3_frink_walk2" );
		Game.SetDialogueInfo("homer","frink","nuclear",0);
		Game.SetDialoguePositions("m3_frink_walk3","m3_frink_walk1","m3_carstart");
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
