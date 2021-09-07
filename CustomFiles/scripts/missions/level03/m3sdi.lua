Game.SelectMission("m3sd");

c_level = 3
c_mission = 3

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetAnimatedCameraName( "mission3camShape" );
Game.SetAnimCamMulticontName( "mission3cam" );
Game.SetMissionStartCameraName( "mission3camShape" );
Game.SetMissionStartMulticontName( "mission3cam" );

Game.SetMissionResetPlayerOutCar("m3_lisa_start", "m3_carstart");
Game.SetDynaLoadData("l3z1.p3d;l3r1.p3d;l3r5.p3d;l3r5_dam.p3d;");

Game.UsePedGroup(0);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetStageMessageIndex(180);
	Game.SetHUDIcon( "kburger" );
	Game.SetMaxTraffic(3);
	Game.AddObjective("goto");
		Game.AddNPC("apu", "m3_apu_sd");
		Game.AddStageVehicle("apu_v","m3_apucarstart_sd","NULL","EasyRace\\AI_5th.con");
		Game.SetDestination("m3_krustyburger", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(157);
	Game.SetHUDIcon( "apu" );
	Game.AddObjective("talkto");
		Game.AddNPC("apu", "m3_apu_sd");
		Game.AddObjectiveNPCWaypoint( "apu", "m3_apu_walk2" );
		Game.AddObjectiveNPCWaypoint( "apu", "m3_apu_walk3" );
		Game.AddObjectiveNPCWaypoint( "apu", "m3_apu_walk2" );
		Game.AddObjectiveNPCWaypoint( "apu", "m3_apu_walk4" );
		Game.AddObjectiveNPCWaypoint( "apu", "m3_apu_walk5" );
		Game.AddObjectiveNPCWaypoint( "apu", "m3_apu_walk6" );
		Game.AddObjectiveNPCWaypoint( "apu", "m3_apu_walk5" );
		Game.AddObjectiveNPCWaypoint( "apu", "m3_apu_walk4" );
		Game.SetTalkToTarget("apu", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["3"]["M2"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m3_bestside" );
		Game.SetDialogueInfo("apu","lisa","burger",0);
		Game.SetDialoguePositions("m3_lisa_loc","m3_apu_sd","m3_carstart");
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(19);
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis03_03.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "npc_far" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m3_bestside" );
		Game.SetDialogueInfo("apu","lisa","burger",0);
		Game.SetDialoguePositions("m3_lisa_loc","m3_apu_sd","m3_carstart");
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
