Game.SelectMission("m4sd");

c_level = 1
c_mission = 4

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission4camShape" );
Game.SetMissionStartMulticontName( "mission4cam" );
Game.SetAnimatedCameraName( "mission4camShape" );
Game.SetAnimCamMulticontName( "mission4cam" );

Game.SetMissionResetPlayerOutCar("m4_homer_start", "m4_carstart");
Game.SetDynaLoadData("l1r4a.p3d;l1z6.p3d;l1r6.p3d;");

Game.UsePedGroup(7);
Game.AddStage(9);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(2);
	Game.SetStageMessageIndex(08);
	Game.SetHUDIcon( "pwrplant" );
	Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_04.p3d" );
	Game.AddObjective("goto","both");
		Game.SetDestination("m4_powerplant", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage();
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(154);
	Game.SetHUDIcon( "wstation" );
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.AddNPC("carl", "m4_carl_sd");
		Game.SetDestination("m4_locator_sd", "triggersphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.MustActionTrigger();
	Game.CloseObjective();
	--SetCompletionDialog("camera");
Game.CloseStage();

if CompletedMissions.Missions["1"]["M3"] == true then
Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetDialogueInfo("homer","carl","camera",0);
	Game.CloseObjective();
Game.CloseStage();
else
Game.AddStage("locked","skin","beeman");
	Game.AddObjective("dialogue");
		Game.SetStageMessageIndex(19);
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_hands_in_air" );
		Game.SetDialogueInfo("homer","carl","camera",0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(276);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "beeman");
	Game.CloseObjective();
Game.CloseStage();
end

--AddStage(0);
--	SetStageMessageIndex(252);
--	SetHUDIcon( "pwrplant" );
--	AddObjective( "goto" );
--		SetDestination( "m4_start_sd", "triggersphere");
--		SetCollectibleEffect("wrench_collect");
--	CloseObjective();
--CloseStage();

Game.CloseMission();
