Game.SelectMission("m5sd");

c_level = 1
c_mission = 5

reward_giver(c_level,{c_mission,8,9,10,11})

Game.SetMissionStartCameraName( "mission1camShape" );
Game.SetMissionStartMulticontName( "mission1cam" );
Game.SetAnimatedCameraName( "mission1camShape" );
Game.SetAnimCamMulticontName( "mission1cam" );

Game.SetMissionResetPlayerOutCar("level1_homer_start", "m2_carstart");
Game.SetDynaLoadData("l1z1.p3d;l1r1.p3d;l1r7.p3d;");
--SetInitialWalk("level1_homer_start");

Game.UsePedGroup( 0 ) ;

Game.AddStage(0);
	if coins then
		Game.SetStagePayout(item)
		coins = false
	end
	Game.SetMaxTraffic(2);
	Game.SetHUDIcon("simpsons");
	Game.SetStageMessageIndex(217);
	Game.AddObjective( "goto" );
		Game.SetDestination( "m2_simpsonhouse_sd", "carsphere" );
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.RESET_TO_HERE();
	Game.SetStageMessageIndex(15);
	Game.SetHUDIcon("simpsons");
	Game.AddObjective("interior");
		Game.SetDestination("SimpsonsHouse", "simp_mission_doorstar");
	Game.CloseObjective();
Game.CloseStage();

if CompletedMissions.Missions["1"]["M4"] == true then
Game.AddStage(15);
	Game.SetHUDIcon("simpsons");
	Game.SetStageMessageIndex(272);
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_05.p3d" );
		Game.SetDestination("m5_locator_sd","triggersphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.MustActionTrigger();
	Game.CloseObjective();
Game.CloseStage();

else
Game.AddStage("locked","skin","beeman");
Game.SetStageMessageIndex(19);
	Game.SetHUDIcon("simpsons");
	Game.SetStageMessageIndex(272);
	Game.AddObjective("goto");
		Game.TurnGotoDialogOff();
		Game.SetPresentationBitmap( "art/frontend/dynaload/images/mis01_05.p3d" );
		Game.SetDestination("m5_locator_sd","triggersphere");
		Game.SetCollectibleEffect("wrench_collect");
		Game.MustActionTrigger();
	Game.CloseObjective();
Game.CloseStage();


Game.AddStage(0);
	Game.SetStageMessageIndex(276);
	Game.SetHUDIcon( "tshirt" );
	Game.AddObjective("buyskin", "beeman");
	Game.CloseObjective();
Game.CloseStage();
end

Game.AddStage(1);
	Game.AddObjective("fmv");
		Game.SetFMVInfo("fmv2.rmv");
	Game.CloseObjective();
Game.CloseStage();

Game.CloseMission();

