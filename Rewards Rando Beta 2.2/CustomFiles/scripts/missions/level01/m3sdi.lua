Game.SelectMission("m3sd");

c_level = 1
c_mission = 3

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission1camShape" );
Game.SetMissionStartMulticontName( "mission1cam" );
Game.SetAnimatedCameraName( "mission1camShape" );
Game.SetAnimCamMulticontName( "mission1cam" );

Game.UsePedGroup( 0 );

--SetInitialWalk("level1_homer_start");

Game.SetMissionResetPlayerOutCar("level1_homer_start", "level1_carstart");
Game.SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;");

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(2);
	Game.SetStageMessageIndex(217);
	Game.SetHUDIcon("simpsons");
	Game.AddObjective( "goto" );

		Game.SetDestination( "m2_simpsonhouse_sd", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.RESET_TO_HERE();
	Game.SetMaxTraffic(2);
	Game.SetHUDIcon("simpsons");
	Game.SetStageMessageIndex(155);
	Game.AddObjective("interior","nearest road");
		Game.AddNPC("marge", "m2_marge_sd");
		Game.SetDestination("SimpsonsHouse", "simp_mission_doorstar"); -- use name of interiors entry locator
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.SetStageMessageIndex(00);
	Game.SetHUDIcon("marage");
	Game.AddObjective("talkto");
		Game.AddNPC("marge", "m2_marge_sd");
		Game.SetTalkToTarget("marge", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["1"]["M1"] == true then
Game.AddStage(0);
	Game.AllowMissionAbort("false");
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_03.p3d" );
		Game.SetDialogueInfo("homer","marge","scorpion",0);

	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(250);
	Game.AddObjective("gooutside");
	Game.TurnGotoDialogOff();
		Game.SetDestination("outside_Simpsons_house_locator");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(253);
	Game.SetHUDIcon("kburger");
	Game.AddObjective("goto");
		Game.AddNPC("lenny", "m3_lenny");
		Game.SetDestination("m3_lardlads", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(6);
	Game.SetHUDIcon("lenny");
	Game.AddObjective("talkto","both");
		Game.AddNPC("lenny", "m3_lenny");
		Game.AddObjectiveNPCWaypoint( "lenny", "lenny_walk_1" );
		Game.AddObjectiveNPCWaypoint( "lenny", "lenny_walk_2" );
		Game.SetTalkToTarget("lenny", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

--LOCKED STAGE FOR PLOW KING
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","car","plowk_v");
	Game.SetStageMessageIndex(0);
	Game.AddObjective("dialogue");
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_near" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.SetConversationCam( 3, "pc_near" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.SetCamBestSide( "m3_bestside");
		Game.SetDialogueInfo("homer","lenny","churro",0);
		Game.SetDialoguePositions("m3_homer_lenny","lenny_walk_2","barney_car");
	Game.CloseObjective();
Game.CloseStage();

--THIS DIALOGUE WILL NOT INCLUDE THE GATED LINES AND WILL BEGIN THE MISSION
--AddStage(0);
--	AddObjective("dialogue");
--		AmbientAnimationRandomize( 1, 0 );      // ( pc=0, npc=1) (nonrandom=0, random=1)
--		AmbientAnimationRandomize( 0, 0 );
--		SetConversationCam( 0, "npc_far" );
--		SetConversationCam( 1, "pc_near" );
--		SetConversationCam( 2, "npc_far" );
--		SetConversationCam( 3, "pc_near" );
--		AddAmbientNpcAnimation( "dialogue_cross_arms" );
--		AddAmbientNpcAnimation( "none" );
--		AddAmbientNpcAnimation( "dialogue_yes" );
--		AddAmbientNpcAnimation( "none" );
--		AddAmbientPcAnimation( "none" );
--		AddAmbientPcAnimation( "dialogue_no" );
--		AddAmbientPcAnimation( "none" );
--		AddAmbientPcAnimation( "dialogue_thinking" );
--		SetCamBestSide( "m3_bestside");
--		SetDialogueInfo("homer","lenny","churro2",0);
--		SetDialoguePositions("m3_homer_lenny","lenny_walk_2","barney_car");
--	CloseObjective();
--CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(239);
	Game.SetHUDIcon( "barne" );
	Game.AddObjective("buycar", "plowk_v");
	Game.CloseObjective();
Game.CloseStage();

--AddStage(0);
--	SetStageMessageIndex(12);
--	AddObjective("getin");
--		SetObjTargetVehicle("current");
--	CloseObjective();
--CloseStage();

--AddStage(0);
--	SetStageMessageIndex(253);
--	SetHUDIcon("kburger");
--	AddObjective("goto");
--		TurnGotoDialogOff();
--		AddNPC("lenny", "m3_lenny");
--		SetDestination("m3_lardlads", "carsphere");
--		SetCollectibleEffect("wrench_collect");
--	CloseObjective();
--CloseStage();
else
Game.AddStage("locked","skin","beeman");
		Game.AllowMissionAbort("false");
		Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(19);
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_03.p3d" );
		Game.SetDialogueInfo("homer","marge","scorpion",0);

	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(276);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "beeman");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(250);
	Game.AddObjective("gooutside");
	Game.TurnGotoDialogOff();
		Game.SetDestination("outside_Simpsons_house_locator");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(253);
	Game.SetHUDIcon("kburger");
	Game.AddObjective("goto");
		Game.AddNPC("lenny", "m3_lenny");
		Game.SetDestination("m3_lardlads", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(6);
	Game.SetHUDIcon("lenny");
	Game.AddObjective("talkto","both");
		Game.AddNPC("lenny", "m3_lenny");
		Game.AddObjectiveNPCWaypoint( "lenny", "lenny_walk_1" );
		Game.AddObjectiveNPCWaypoint( "lenny", "lenny_walk_2" );
		Game.SetTalkToTarget("lenny", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

--LOCKED STAGE FOR PLOW KING
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","car","plowk_v");
	Game.SetStageMessageIndex(0);
	Game.AddObjective("dialogue");
		Game.SetConversationCam( 0, "npc_far" );
		Game.SetConversationCam( 1, "pc_near" );
		Game.SetConversationCam( 2, "npc_far" );
		Game.SetConversationCam( 3, "pc_near" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_no" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.SetCamBestSide( "m3_bestside");
		Game.SetDialogueInfo("homer","lenny","churro",0);
		Game.SetDialoguePositions("m3_homer_lenny","lenny_walk_2","barney_car");
	Game.CloseObjective();
Game.CloseStage();

--THIS DIALOGUE WILL NOT INCLUDE THE GATED LINES AND WILL BEGIN THE MISSION
--AddStage(0);
--	AddObjective("dialogue");
--		AmbientAnimationRandomize( 1, 0 );      // ( pc=0, npc=1) (nonrandom=0, random=1)
--		AmbientAnimationRandomize( 0, 0 );
--		SetConversationCam( 0, "npc_far" );
--		SetConversationCam( 1, "pc_near" );
--		SetConversationCam( 2, "npc_far" );
--		SetConversationCam( 3, "pc_near" );
--		AddAmbientNpcAnimation( "dialogue_cross_arms" );
--		AddAmbientNpcAnimation( "none" );
--		AddAmbientNpcAnimation( "dialogue_yes" );
--		AddAmbientNpcAnimation( "none" );
--		AddAmbientPcAnimation( "none" );
--		AddAmbientPcAnimation( "dialogue_no" );
--		AddAmbientPcAnimation( "none" );
--		AddAmbientPcAnimation( "dialogue_thinking" );
--		SetCamBestSide( "m3_bestside");
--		SetDialogueInfo("homer","lenny","churro2",0);
--		SetDialoguePositions("m3_homer_lenny","lenny_walk_2","barney_car");
--	CloseObjective();
--CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(239);
	Game.SetHUDIcon( "barne" );
	Game.AddObjective("buycar", "plowk_v");
	Game.CloseObjective();
Game.CloseStage();

--AddStage(0);
--	SetStageMessageIndex(12);
--	AddObjective("getin");
--		SetObjTargetVehicle("current");
--	CloseObjective();
--CloseStage();

--AddStage(0);
--	SetStageMessageIndex(253);
--	SetHUDIcon("kburger");
--	AddObjective("goto");
--		TurnGotoDialogOff();
--		AddNPC("lenny", "m3_lenny");
--		SetDestination("m3_lardlads", "carsphere");
--		SetCollectibleEffect("wrench_collect");
--	CloseObjective();
--CloseStage();
end

Game.CloseMission();

--dialogue_hands_in_air
--dialogue_hands_on_hips
--dialogue_scratch_head
--dialogue_shaking_fist
--dialogue_thinking
--dialogue_yes
--dialogue_no
--dialogue_cross_arms
--dialogue_open_arm_hand_gesture
--dialogue_shake_hand_in_air
