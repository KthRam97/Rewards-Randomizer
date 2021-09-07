Game.SelectMission("m1sd");
c_level = 5
c_mission = 1

reward_giver(c_level,{c_mission,8,9,10,11})
Game.SetMissionResetPlayerOutCar("level5_apu_start","level5_carstart");
Game.SetDynaLoadData("l5z4.p3d;l5r3.p3d;l5r4.p3d;");

Game.UsePedGroup(5);
Game.SetMissionStartCameraName( "mission1camShape" );
Game.SetMissionStartMulticontName( "mission1cam" );
Game.SetAnimatedCameraName( "mission1camShape" );
Game.SetAnimCamMulticontName( "mission1cam" );

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetHUDIcon( "cola_v" );
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(67);
	Game.AddObjective("goto", "neither");
		--TurnGotoDialogOff();
		Game.AddNPC("npd", "hidden_moe");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis05_01.p3d" );
		Game.AddStageVehicle("cCola","m1_cola_carstart","NULL","Missions\\level05\\M1chase.con");
		Game.SetDestination("m1_locater_sd","triggersphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.MustActionTrigger();
	Game.CloseObjective();

Game.CloseStage();

-- This is the Dummy mission to play Apu's dialogue//

--AddStage(1);
--	AddObjective("timer");
--		SetDurationTime(1);
--	CloseObjective();
--CloseStage();

Game.AddStage("final");
	Game.AddObjective("dialogue");

		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetDialogueInfo("apu","npd","redeem",0); --I use Ralph because he's so wee
		Game.SetConversationCam( 0, "pc_near" );
		Game.SetCamBestSide("hidden_bestside");
		Game.SetDialoguePositions("hidden_apu","hidden_moe","hidden_bestside");
	Game.CloseObjective();
Game.CloseStage();


Game.CloseMission();
