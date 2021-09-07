Game.SelectMission("m2sd");
c_level = 1
c_mission = 2

Game.SetMissionStartCameraName( "mission2camShape" );
Game.SetMissionStartMulticontName( "mission2cam" );
Game.SetAnimatedCameraName( "mission2camShape" );
Game.SetAnimCamMulticontName( "mission2cam" );

Game.SetMissionResetPlayerOutCar("homer_start_alt", "level1_carstart");
Game.SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;");

Game.UsePedGroup( 0 );

reward_giver(c_level,{c_mission,8,9,10,11})
Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(2);
	Game.SetStageMessageIndex(217);
	Game.SetHUDIcon("simpsons");
	Game.AddObjective( "goto" );
		Game.AddNPC("marge", "m2_marge_sd");
		Game.SetDestination( "m2_simpsonhouse_sd", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.RESET_TO_HERE(); -- skips first stage when loading the mission from pause menu.
	Game.SetStageMessageIndex(155);
	Game.SetHUDIcon("simpsons");
	Game.AddObjective("interior");
		Game.AddNPC("marge", "m2_marge_sd");
		Game.SetDestination("SimpsonsHouse", "simp_mission_doorstar"); -- use name of interiors entry locator
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(00);
	Game.SetHUDIcon("marage");
	Game.AddObjective("talkto");
		Game.AddNPC("marge", "m2_marge_sd");
		Game.SetTalkToTarget("marge", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["1"]["M1"] == true then

	Game.AddStage(0);
		Game.AddObjective("dialogue");
			Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_02.p3d" );
			Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
			Game.AmbientAnimationRandomize( 0, 0 );
			Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_thinking" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
			Game.SetDialogueInfo("homer","marge","neighbor",0);
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(0);
		Game.SetStageMessageIndex(250);
		Game.AddObjective("gooutside");
			Game.TurnGotoDialogOff();
			Game.SetDestination("outside_Simpsons_house_locator");
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(4);
		Game.SetStageMessageIndex(3);
		Game.SetHUDIcon( "ned" );
		Game.AddObjective("talkto","neither");
				Game.AddNPC("ned", "m2_ned_sd"); --ned at his house
			Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_1" );
			Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_2" );
			Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_3" );
			Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_2" );
			Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_1" );
			Game.SetTalkToTarget("ned", 0, 0);
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(0);
		Game.AddObjective("dialogue");
			Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
			Game.AmbientAnimationRandomize( 0, 0 );
			Game.SetConversationCam( 0, "npc_far" );
			Game.SetConversationCam( 1, "pc_near" );
			Game.SetConversationCam( 2, "npc_far" );
			Game.SetConversationCam( 3, "pc_near" );
			Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_thinking" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
			Game.SetConversationCam( 3, "pc_far" );
			Game.SetCamBestSide("bestside_m2");
			Game.SetDialogueInfo("homer","ned","culprit",0);
			Game.SetDialoguePositions("m2_homer_ned","m2_ned_sd","mission2_carstart");
		Game.CloseObjective();
	Game.CloseStage();

else

	Game.AddStage("locked","skin","beeman");
		Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(19);
			Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_02.p3d" );
			Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
			Game.AmbientAnimationRandomize( 0, 0 );
			Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_thinking" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
			Game.SetDialogueInfo("homer","marge","neighbor",0);
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(0);
	Game.SetStageMessageIndex(276);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "beeman");
	Game.CloseObjective();
Game.CloseStage();

	Game.AddStage(0);
		Game.SetStageMessageIndex(250);
		Game.AddObjective("gooutside");
			Game.TurnGotoDialogOff();
			Game.SetDestination("outside_Simpsons_house_locator");
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(4);
		Game.SetStageMessageIndex(3);
		Game.SetHUDIcon( "ned" );
		Game.AddObjective("talkto","neither");
				Game.AddNPC("ned", "m2_ned_sd"); --ned at his house
			Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_1" );
			Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_2" );
			Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_3" );
			Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_2" );
			Game.AddObjectiveNPCWaypoint( "ned", "ned_walk_1" );
			Game.SetTalkToTarget("ned", 0, 0);
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(0);
		Game.AddObjective("dialogue");
			Game.SetStageMessageIndex(19);
			Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
			Game.AmbientAnimationRandomize( 0, 0 );
			Game.SetConversationCam( 0, "npc_far" );
			Game.SetConversationCam( 1, "pc_near" );
			Game.SetConversationCam( 2, "npc_far" );
			Game.SetConversationCam( 3, "pc_near" );
			Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
			Game.AddAmbientNpcAnimation( "none" );
			Game.AddAmbientNpcAnimation( "dialogue_thinking" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_yes" );
			Game.AddAmbientPcAnimation( "none" );
			Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
			Game.SetConversationCam( 3, "pc_far" );
			Game.SetCamBestSide("bestside_m2");
			Game.SetDialogueInfo("homer","ned","culprit",0);
			Game.SetDialoguePositions("m2_homer_ned","m2_ned_sd","mission2_carstart");
		Game.CloseObjective();
	Game.CloseStage();

	Game.AddStage(0);
		Game.SetStageMessageIndex(276);
		Game.SetHUDIcon( "tshirt" );
		Game.AddObjective("buyskin", "beeman");
		Game.CloseObjective();
	Game.CloseStage();
end

Game.CloseMission();
