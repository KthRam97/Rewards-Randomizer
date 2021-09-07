Game.SelectMission("m4sd");

c_level = 6
c_mission = 4

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionResetPlayerOutCar("m4_bart_start","m4_carstart");
Game.SetDynaLoadData("l6z5.p3d;l6r4.p3d;l6r5.p3d;l6r5_dam.p3d;");

Game.UsePedGroup(6);

Game.SetMissionStartCameraName( "mission4camShape" );
Game.SetMissionStartMulticontName( "mission4cam" );
Game.SetAnimatedCameraName( "mission4camShape" );
Game.SetAnimCamMulticontName( "mission4cam" );

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(182);
	Game.SetHUDIcon("observ");
	Game.AddObjective( "interior" );
		Game.AddNPC("frink", "m4_frink_sd");
		Game.SetDestination("Observatory", "obsv_mission_doorstar");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(5);
	Game.SetStageMessageIndex(66);
	Game.SetHUDIcon("frink");
	Game.AddObjective("talkto");
		Game.AddNPC("frink", "m4_frink_sd");
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk2" );
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk3" );
		Game.AddObjectiveNPCWaypoint( "frink", "m4_frink_walk4" );
		Game.SetTalkToTarget("frink", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["6"]["M3"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_04.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("bart","frink","wolf",0);
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
	Game.SetStageMessageIndex(19);
	Game.AddObjective("dialogue");
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis06_04.p3d" );
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_thinking" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetDialogueInfo("bart","frink","wolf",0);
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
