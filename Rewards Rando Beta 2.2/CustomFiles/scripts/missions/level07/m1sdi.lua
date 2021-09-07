Game.SelectMission("m1sd");

c_level = 7
c_mission = 1

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("level7_homer_start", "level7_carstart");
Game.SetDynaLoadData("l7z1.p3d;l7r1.p3d;l7r7.p3d;l7i02.p3d@", "SimpsonsHouse");

Game.UsePedGroup(0);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(156);
	Game.SetHUDIcon("lisa");
	Game.AddObjective("talkto", "neither");
		Game.AddNPC("lisa", "m1_lisa_sd");
		Game.SetTalkToTarget("lisa", 0, -0.2);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_01.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("homer","lisa","zombie",0);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
