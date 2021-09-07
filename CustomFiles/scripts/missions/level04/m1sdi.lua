Game.SelectMission("m1sd");

c_level = 4
c_mission = 1

reward_giver(c_level,{c_mission,8,9,10,11})

-- SetMissionStartCameraName( "mission1camShape" );
-- SetMissionStartMulticontName( "mission1cam" );
-- SetAnimatedCameraName( "mission1camShape" );
-- SetAnimCamMulticontName( "mission1cam" );

Game.SetMissionResetPlayerOutCar("L4_marge_sd","level4_carstart");
--SetDynaLoadData("l4z1.p3d;l4r1.p3d;l4r7.p3d;l4i07.p3d@", "bartroom");
Game.SetDynaLoadData("l4z1.p3d;l4r1.p3d;l4r7.p3d;l4i02.p3d@", "SimpsonsHouse");
Game.UsePedGroup(0);

	Game.AddStage(0);
		if coins then
			Game.SetStagePayout(item)
			coins = false
		end
		Game.SetMaxTraffic(3);
		Game.SetStageMessageIndex(226);
		Game.SetHUDIcon( "bart" );
		Game.AddObjective("talkto","neither");
			Game.AddNPC("bart", "L4_bart_sd");
			Game.SetTalkToTarget("bart", 0, -0.4);
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(1);
		Game.AddObjective("dialogue");
			Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_01.p3d" );
			Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
			Game.AmbientAnimationRandomize( 0, 0 );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
			Game.SetConversationCam( 3, "pc_far" );
			Game.SetDialogueInfo("marge","bart","nuts",0);
		Game.CloseObjective();
	Game.CloseStage();

Game.CloseMission();
