Game.SelectMission("m5");

c_level = 4
c_mission = 5

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end

Game.SetMissionResetPlayerInCar("m5_carstart");
Game.SetDynaLoadData("l4z2.p3d;l4r1.p3d;l4r2.p3d;");

Game.UsePedGroup(1);
Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(30);
	Game.SetHUDIcon( "playgrou" );
	Game.AddObjective( "goto" );
		Game.AddNPC("nelson", "m5_bullies_place");
		--AddNPC("kearney", "m5_kearney" );
		--AddNPC("jimbo", m5_jimbo" );
		Game.SetDestination( "m5_school", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(30);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	--ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(228);
	Game.SetHUDIcon( "nelson" );
	Game.AddObjective("talkto");
		Game.AddNPC("nelson", "m5_bullies_place");
		Game.SetTalkToTarget("nelson", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.SetCamBestSide("m5_jimbo");
		Game.SetDialogueInfo("marge","nelson","hooligan",0);
		Game.SetDialoguePositions("m5_bullies_place","m5_kearney","m5_blacksedan_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(12);
	Game.AddObjective("getin");
		Game.SetObjTargetVehicle("current");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(232);
	Game.SetHUDIcon( "bsedan_v" );
	Game.AddObjective("goto", "neither");
		Game.AddStageVehicle("cSedan","m5_blacksedan_carstart","NULL","Missions\\level04\\M5chase.con");
		Game.SetDestination( "m5_sedan_spawn", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	--ShowStageComplete();
Game.CloseStage();

Game.AddStage(1);
	Game.SetStageMessageIndex(135);
	Game.SetHUDIcon( "pills" );
	Game.ActivateVehicle("cSedan","NULL","evade");
	Game.AddStageWaypoint( "m5_blacksedan_path7" );
	Game.AddStageWaypoint( "m5_blacksedan_path9" );
	Game.AddStageWaypoint( "m5_blacksedan_path2" );
	Game.AddStageWaypoint( "m5_blacksedan_path9a" );
	Game.AddStageWaypoint( "m5_blacksedan_path11" );
	Game.AddStageWaypoint( "m5_blacksedan_path11a" );
	Game.AddStageWaypoint( "m5_blacksedan_path11b" );
	Game.AddStageWaypoint( "m5_blacksedan_path3" );
	Game.AddStageWaypoint( "m5_blacksedan_path10" );
	Game.AddStageWaypoint( "m5_blacksedan_path1" );
	Game.AddObjective("dump");
		Game.SetObjTargetVehicle("cSedan");
		Game.AddCollectible("m5_collectible1","pills");
		Game.AddCollectible("m5_collectible2","pills");
		Game.AddCollectible("m5_collectible3","pills");
		Game.AddCollectible("m5_collectible4","pills");
		Game.AddCollectible("m5_collectible5","pills");
		Game.AddCollectible("m5_collectible6","pills");
		Game.AddCollectible("m5_collectible7","pills");
		Game.AddCollectible("m5_collectible8","pills");
		Game.AddCollectible("m5_collectible9","pills");
		Game.AddCollectible("m5_collectible10","pills");
		Game.BindCollectibleTo(0, 0);
		Game.BindCollectibleTo(1, 1);
		Game.BindCollectibleTo(2, 2);
		Game.BindCollectibleTo(3, 3);
		Game.BindCollectibleTo(4, 4);
		Game.BindCollectibleTo(5, 5);
		Game.BindCollectibleTo(6, 6);
		Game.BindCollectibleTo(7, 7);
		Game.BindCollectibleTo(8, 8);
		Game.BindCollectibleTo(9, 9);
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0, 275);
		Game.SetCondTargetVehicle("cSedan");
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(229);
	Game.SetHUDIcon( "retire" );
	Game.AddObjective( "goto" );
		Game.AddStageVehicle("cSedan","m5_blacksedan2_carstart","NULL","Missions\\level04\\M5chase.con");
		Game.SetDestination( "m5_castle_fake", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(90);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(178);
	Game.SetHUDIcon( "bsedan_v" );
	Game.ActivateVehicle( "cSedan","NULL","chase" );
	Game.AddObjective( "losetail" );
		Game.SetObjTargetVehicle( "cSedan" );
		Game.SetObjDistance(150);
	Game.CloseObjective();
	Game.SetStageTime(90);
	Game.AddCondition( "timeout" );
	Game.CloseCondition();
	Game.StageStartMusicEvent("L4_drama");
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(229);
	Game.SetHUDIcon( "retire" );
	Game.AddObjective( "goto" );
		Game.AddNPC("grandpa", "m5_grampa_sd");
		Game.SetDestination( "m5_castle", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.SetStageTime(150);
	Game.AddCondition("timeout");
		--SetHitNRun();
	Game.CloseCondition();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(25);
	Game.SetStageMessageIndex(230);
	Game.SetHUDIcon( "grampa" );
	Game.AddObjective("talkto");
		Game.AddNPC("grandpa", "m5_grampa_sd");
		Game.SetTalkToTarget("grandpa", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_no" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.SetCamBestSide("m5_bestside2");
		Game.SetDialogueInfo("marge","grandpa","medicine",0);
		Game.SetDialoguePositions("m5_marge_start","m5_grampa_sd","m5_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(131);
	Game.SetHUDIcon( "kwike" );
	Game.AddObjective( "goto" );
		Game.SetDestination( "m5_kwik", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	--ShowStageComplete();
Game.CloseStage();

Game.AddStage(1);
	Game.SetStageMessageIndex(102);
	Game.SetHUDIcon( "kwike" );
	Game.AddObjective("interior");
		Game.SetDestination("KwikEMart", "kwik_mission_doorstar"); -- use name of interiors entry locator
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(231);
	Game.SetHUDIcon( "caffeine" );
	Game.AddObjective( "goto" );
		Game.TurnGotoDialogOff();
		Game.AddNPC( "apu", "m5_apu", "KwikEMart" );
		Game.SetDestination( "m5_caffeine", "i_cpill" );
	Game.CloseObjective();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(229);
	Game.SetHUDIcon( "retire" );
	--SetStageTime(30);
	--AddCondition("timeout");
		--SetHitNRun();
	--CloseCondition();
	Game.AddObjective( "goto" );
		Game.AddNPC("grandpa", "m5_grampa_sd");
		Game.SetDestination( "m5_castle", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	--ShowStageComplete();
Game.CloseStage();

Game.AddStage(25);
	Game.SetStageMessageIndex(254);
	Game.SetHUDIcon( "grampa" );
	Game.AddObjective("talkto");
		Game.AddNPC("grandpa", "m5_grampa_sd");
		Game.SetTalkToTarget("grandpa", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.AddObjective("fmv");
		Game.SetFMVInfo("fmv4.rmv");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage("final");
	Game.AddObjective("timer");
		Game.AddNPC("grandpa", "m5_bullies_place");
		Game.SetDurationTime(1);
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();
