Game.SelectMission("m5sd");

c_level = 3
c_mission = 5

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetAnimatedCameraName( "mission5camShape" );
Game.SetAnimCamMulticontName( "mission5cam" );
Game.SetMissionStartCameraName( "mission5camShape" );
Game.SetMissionStartMulticontName( "mission5cam" );

Game.SetMissionResetPlayerOutCar("m5_lisa_start", "m5_carstart");
Game.SetDynaLoadData("l3r2.p3d;l3z2.p3d;l3z3.p3d;");

Game.UsePedGroup(3);
Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(187);
	Game.SetHUDIcon( "casino" );
	Game.AddObjective("goto");
		Game.AddNPC("wiggum", "m5_wiggum_sd");
		Game.AddStageVehicle("wiggu_v","m5_wiggumcar_sd","NULL","EasyRace\\AI_5th.con");
		Game.SetDestination("m5_casino_sd", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(104);
	Game.SetHUDIcon( "wiggum" );
	Game.AddObjective("talkto");
		Game.AddNPC("wiggum", "m5_wiggum_sd");
		Game.AddObjectiveNPCWaypoint( "wiggum", "m5_wiggum_walk1_sd" );
		Game.AddObjectiveNPCWaypoint( "wiggum", "m5_wiggum_walk2_sd" );
		Game.SetTalkToTarget("wiggum", 0, 0);
	Game.CloseObjective();
Game.CloseStage();


if CompletedMissions.Missions["3"]["M4"] == true then
--LOCKED STAGE FOR COOL CLOTHES
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","skin","l_cool");
	Game.SetStageMessageIndex(3);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_05.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m5_bestside");
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetDialogueInfo("lisa","wiggum","strikes",0);
		Game.SetDialoguePositions("m5_lisa_loc","m5_wiggum_sd","m5_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(195);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "l_cool");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(187);
	Game.SetHUDIcon( "casino" );
	Game.AddObjective("goto");
		Game.AddNPC("wiggum", "m5_wiggum_sd");
		Game.AddStageVehicle("wiggu_v","m5_wiggumcar_sd","NULL","EasyRace\\AI_5th.con");
		Game.SetDestination("m5_casino_sd", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon( "wiggu_v" );
	Game.SetMaxTraffic(1);
	Game.SetStageMessageIndex(2);
	Game.AddObjective("goto");
		Game.AddStageVehicle("wiggu_v","m5_wiggumcar_sd","NULL","EasyRace\\AI_5th.con");
		Game.SetDestination("m5_missionstart","triggersphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.MustActionTrigger();
	Game.CloseObjective();
Game.CloseStage();

else
--LOCKED STAGE FOR COOL CLOTHES
--
--THIS DIALOGUE WILL INCLUDE THE GATED LINES
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_05.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide("m5_bestside");
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.SetDialogueInfo("lisa","wiggum","strikes",0);
		Game.SetDialoguePositions("m5_lisa_loc","m5_wiggum_sd","m5_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(19);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "beeman");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(187);
	Game.SetHUDIcon( "casino" );
	Game.AddObjective("goto");
		Game.AddNPC("wiggum", "m5_wiggum_sd");
		Game.AddStageVehicle("wiggu_v","m5_wiggumcar_sd","NULL","EasyRace\\AI_5th.con");
		Game.SetDestination("m5_casino_sd", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetHUDIcon( "wiggu_v" );
	Game.SetMaxTraffic(1);
	Game.SetStageMessageIndex(2);
	Game.AddObjective("goto");
		Game.AddStageVehicle("wiggu_v","m5_wiggumcar_sd","NULL","EasyRace\\AI_5th.con");
		Game.SetDestination("m5_missionstart","triggersphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.MustActionTrigger();
	Game.CloseObjective();
Game.CloseStage();
end

Game.CloseMission();
