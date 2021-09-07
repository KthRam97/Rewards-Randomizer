Game.SelectMission("m2sd");

c_level = 7
c_mission = 2

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m2_homer_start", "m2_carstart");
Game.SetDynaLoadData("l7z3.p3d;l7r2.p3d;l7r3.p3d;");

Game.UsePedGroup(3);

Game.SetMissionStartCameraName( "mission2camShape" );
Game.SetMissionStartMulticontName( "mission2cam" );
Game.SetAnimatedCameraName( "mission2camShape" );
Game.SetAnimCamMulticontName( "mission2cam" );

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(202);
	Game.SetHUDIcon( "playgrou" );
	Game.AddObjective( "goto" );
		Game.AddNPC("cbg", "m2_cbg_sd");
--		AddStageVehicle("cBlbart","m2_AI_carstart","NULL","Chase\EasyChas.con");
		Game.SetDestination( "m2_playground", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(54);
	Game.SetHUDIcon( "cbg" );
	Game.AddObjective("talkto");
		Game.AddNPC("cbg", "m2_cbg_sd");
		Game.AddStageVehicle("cBlbart","m2_AI_carstart","NULL","Missions\\level07\\M2chase.con");
		Game.AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk1" );
		Game.AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk2" );
		Game.AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk3" );
		Game.AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk4" );
		Game.AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk5" );
		Game.AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk6" );
		Game.AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk5" );
		Game.AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk4" );
		Game.AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk3" );
		Game.AddObjectiveNPCWaypoint( "cbg", "m2_cbg_walk2" );
		Game.SetTalkToTarget("cbg", 0, 0);
	Game.CloseObjective();
Game.CloseStage();


if CompletedMissions.Missions["7"]["M1"] == true then
--LOCKED STAGE FOR THE ZOMBIE CAR
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","car","zombi_v");
	Game.SetStageMessageIndex(9);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_02.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide( "m2_bestside" );
		Game.SetDialogueInfo("homer","cbg","probe",0);
		Game.SetDialoguePositions("m2_homer_start","m2_cbg_walk1","m2_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(218);
	Game.SetHUDIcon( "cemetery" );
	Game.AddObjective("buycar", "zombi_v");
	Game.CloseObjective();
Game.CloseStage();

else
--LOCKED STAGE FOR THE ZOMBIE CAR
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis07_02.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_thinking" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetCamBestSide( "m2_bestside" );
		Game.SetDialogueInfo("homer","cbg","probe",0);
		Game.SetDialoguePositions("m2_homer_start","m2_cbg_walk1","m2_carstart");
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
