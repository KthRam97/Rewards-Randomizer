Game.SelectMission("m7sd");

c_level = 1
c_mission = 7

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission7camShape" );
Game.SetMissionStartMulticontName( "mission7cam" );
Game.SetAnimatedCameraName( "mission7camShape" );
Game.SetAnimCamMulticontName( "mission7cam" );

Game.SetMissionResetPlayerOutCar("m7_homer_start","m7_car_start");
Game.SetDynaLoadData("l1z6.p3d;l1r6.p3d;");

Game.UsePedGroup(7);

Game.AddStage();
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(2);
	Game.SetStageMessageIndex(08);
	Game.SetHUDIcon("pwrplant");
	Game.AddObjective("goto");
		Game.AddNPC("carl", "m7_carl_sd");
		Game.SetDestination("m4_powerplant", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(159);
	Game.SetHUDIcon("carl");
	Game.AddObjective("talkto");
		Game.AddNPC("carl", "m7_carl_sd");
		Game.AddObjectiveNPCWaypoint( "carl", "m7_carl_walk_1" );
		Game.AddObjectiveNPCWaypoint( "carl", "m7_carl_walk_2" );
		Game.AddObjectiveNPCWaypoint( "carl", "m7_carl_sd" );
		Game.SetTalkToTarget("carl", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["1"]["M6"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );

		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );

		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.SetCamBestSide( "m7_bestside" );
		Game.SetDialogueInfo("homer","carl","adventure",0);
		Game.SetDialoguePositions("m7_homer","m7_carl_sd","m6_marge_walk_2");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.AddObjective("dialogue");
	Game.SetStageMessageIndex(19);
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );

		Game.AddAmbientNpcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );

		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.SetCamBestSide( "m7_bestside" );
		Game.SetDialogueInfo("homer","carl","adventure",0);
		Game.SetDialoguePositions("m7_homer","m7_carl_sd","m6_marge_walk_2");
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
