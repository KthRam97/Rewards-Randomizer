Game.SelectMission("m5sd");

c_level = 5
c_mission = 5

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m5_apu_start","m5_carstart");
Game.SetDynaLoadData("l5z3.p3d;l5r2.p3d;l5r3.p3d;");

Game.UsePedGroup(4);

Game.SetMissionStartCameraName( "mission5camShape" );
Game.SetMissionStartMulticontName( "mission5cam" );
Game.SetAnimatedCameraName( "mission5camShape" );
Game.SetAnimCamMulticontName( "mission5cam" );

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(60);
	Game.SetHUDIcon( "snake" );
	Game.AddObjective("talkto", "neither");
		Game.AddNPC("snake", "m5_snake_sd");
		Game.AddObjectiveNPCWaypoint( "snake", "m5_snake_walk1" );
		Game.SetTalkToTarget("snake", 0, -0.2);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["5"]["M4"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_05.p3d" );
			Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
			Game.AmbientAnimationRandomize( 0, 0 );
			Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_thinking" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetDialogueInfo("apu","snake","mugging",0);
		Game.SetDialoguePositions("m6_apu_talk","m6_snake_walk1","m5_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_05.p3d" );
			Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
			Game.AmbientAnimationRandomize( 0, 0 );
			Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_thinking" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetDialogueInfo("apu","snake","mugging",0);
		Game.SetDialoguePositions("m6_apu_talk","m6_snake_walk1","m5_carstart");
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


