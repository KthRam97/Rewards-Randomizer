Game.SelectMission("m7sd");

c_level = 4
c_mission = 7

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission7camShape" );
Game.SetMissionStartMulticontName( "mission7cam" );
Game.SetAnimatedCameraName( "mission7camShape" );
Game.SetAnimCamMulticontName( "mission7cam" );

Game.SetMissionResetPlayerOutCar("m7_marge_start","m7_carstart");
Game.SetDynaLoadData("l4z2.p3d;l4r1.p3d;l4r2.p3d;");

Game.UsePedGroup(1);

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(3);
	Game.SetStageMessageIndex(131);
	Game.SetHUDIcon("kwike");
	Game.AddObjective( "goto" );
		Game.SetDestination( "m7_kwik", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
	Game.ShowStageComplete();
Game.CloseStage();

Game.AddStage(1);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(102);
	Game.SetHUDIcon("kwike");
	Game.AddObjective("interior");
		Game.SetDestination("KwikEMart", "kwik_mission_doorstar");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(25);
	Game.SetStageMessageIndex(157);
	Game.SetHUDIcon( "apu" );
	Game.AddObjective("talkto");
		Game.AddNPC("apu", "m7_apu_sd", "KwikEMart" );
		Game.SetTalkToTarget("apu", 0, -0.2, "3.0");
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["4"]["M6"] == true then
Game.AddStage(1);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("marge","apu","tainted",0);
	Game.CloseObjective();
Game.CloseStage();
else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis04_07.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_cross_arms" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_on_hips" );
		Game.SetConversationCam( 3, "pc_far" );
		Game.SetDialogueInfo("marge","apu","tainted",0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(19);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective( "buyskin", "beeman" );
	Game.CloseObjective();
Game.CloseStage();
end

Game.CloseMission();
