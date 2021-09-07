Game.SelectMission("m6sd");

c_level = 4
c_mission = 6

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission6camShape" );
Game.SetMissionStartMulticontName( "mission6cam" );
Game.SetAnimatedCameraName( "mission6camShape" );
Game.SetAnimCamMulticontName( "mission6cam" );

Game.SetMissionResetPlayerOutCar("m6_marge_start","level4_carstart");

--SetDynaLoadData("l4z1.p3d;l4r1.p3d;l4r7.p3d;l4i07.p3d@", "bartroom");
Game.SetDynaLoadData("l4z1.p3d;l4r1.p3d;l4r7.p3d;");

Game.UsePedGroup(0);
Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetHUDIcon("simpsons");
	Game.SetStageMessageIndex(217);
	Game.AddObjective( "goto" );
		Game.SetDestination( "m6_simpsonhouse", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(263);
	Game.SetHUDIcon("bartroom");
	Game.AddObjective("interior");
		Game.AddNPC("bart", "m6_bart");
		Game.SetDestination("bartroom"); -- use name of interiors entry locator
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(226);
	Game.SetHUDIcon("bart");
	Game.AddObjective("talkto");
		Game.AddNPC("bart", "m6_bart");
		Game.SetTalkToTarget("bart", 0, -0.5);
	Game.CloseObjective();
Game.CloseStage();


if CompletedMissions.Missions["4"]["M5"] == true then
--LOCKED STAGE FOR MARGE'S POLICE OUTFIT

--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","skin","m_police");
	Game.SetStageMessageIndex(5);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_06.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.SetConversationCam( 3, "pc_far" );
		--SetCamBestSide("bestside_m1");
		Game.SetDialogueInfo("marge","bart","cola",0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(233);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective( "buyskin", "m_police" );
	Game.CloseObjective();
Game.CloseStage();

else
--LOCKED STAGE FOR MARGE'S POLICE OUTFIT

--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_06.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.SetConversationCam( 3, "pc_far" );
		--SetCamBestSide("bestside_m1");
		Game.SetDialogueInfo("marge","bart","cola",0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(19);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective( "buyskin", "beeman" );
	Game.CloseObjective();
Game.CloseStage();
end


Game.AddStage(0);
	Game.SetHUDIcon("simpsons");
	Game.SetStageMessageIndex(217);
	Game.AddObjective( "goto" );
		Game.SetDestination( "m6_simpsonhouse", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(263);
	Game.SetHUDIcon("bartroom");
	Game.AddObjective("interior");
		Game.AddNPC("bart", "m6_bart");
		Game.SetDestination("bartroom"); -- use name of interiors entry locator
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon( "bartroom" );
	Game.SetStageMessageIndex(270);
	Game.AddObjective("goto");
		Game.AddNPC("bart", "m6_bart");
		Game.SetDestination("m6_gated_start","triggersphere");
		Game.MustActionTrigger();
	Game.CloseObjective();
Game.CloseStage();


Game.CloseMission();

