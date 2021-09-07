Game.SelectMission("m4");

c_level = 2
c_mission = 4

Game.SetMissionResetPlayerOutCar("m4_bart_start","m4_carstart");
Game.SetDynaLoadData("l2z1.p3d;l2r1.p3d;l2r4.p3d;");

Game.UsePedGroup(6);

--AddStage(0);
--	RESET_TO_HERE();
--	SetMaxTraffic(3);
--	SetStageMusicAlwaysOn();
--	SetStageMessageIndex(57);
--	SetHUDIcon( "hermans" );
--	AddObjective("goto");
--		AddNPC("wiggum","m4_wiggum");
--		SetDestination("hermans", "carsphere");
--		SetCollectibleEffect("wrench_collect");
--	CloseObjective();
--CloseStage();

--AddStage(0);
--	SetStageMessageIndex(12);
--	AddObjective("getin");
--		SetObjTargetVehicle("current");
--		AddStageVehicle("pizza","m4_pizzastart","NULL", "Missions\level01\M5evade.con", "none");
--	CloseObjective();
--CloseStage();

Game.AddStage(0);
	Game.SetStageMessageIndex(261);
	Game.RESET_TO_HERE();
	Game.SetHUDIcon( "cvan_v" );
	Game.SetMaxTraffic(2);
--	AddStageVehicle("pizza","m4_pizzastart","evade", "Missions\level02\M2evade.con", "none");
	Game.AddStageVehicle("pizza","m4_pizzastart","target", "Missions\\level02\\M4evade.con", "none");
	Game.SetStageAITargetCatchupParams( 	"pizza", 20, 70);
--	ActivateVehicle("pizza","NULL","evade");
	Game.AddStageWaypoint( "m4_pizza_path1" );
	Game.AddStageWaypoint( "m4_pizza_path2" );
	Game.AddStageWaypoint( "hermans" );
	Game.AddObjective("follow");
		Game.AddNPC("wiggum","m4_wiggum");
		Game.SetObjTargetVehicle("pizza");
		Game.AddStageVehicle("snake_v","m4_snake_carstart3","NULL","Missions\\level02\\M4race.con", "snake");
	Game.CloseObjective();
	Game.AddCondition("followdistance");
		Game.SetFollowDistances(0, 150);
		Game.SetCondTargetVehicle("pizza");
	Game.CloseCondition();
	Game.SetIrisWipe( 0.1 );
Game.CloseStage();

Game.AddStage(1);
	Game.SetStageMessageIndex(104);
	Game.SetHUDIcon( "wiggum" );
	Game.ActivateVehicle("snake_v","NULL","evade");
	Game.AddStageWaypoint( "hermans" );
	Game.AddStageWaypoint( "m4_snake_follow" );
	Game.AddStageWaypoint( "snake" );
	Game.AddStageWaypoint( "m4_finish" );
	Game.AddStageWaypoint( "m4_pizza_path1" );
	Game.AddStageWaypoint( "m4_pizza_path2" );
	Game.AddObjective("talkto");
		Game.AddStageCharacter ("bart", "m4_bart_out", "", "current", "m4_wiggum_carstart");
		Game.AddStageVehicle("pizza","m4_pizza_stop","NULL", "Missions\\level02\\M4evade.con", "none");
		Game.AddNPC("wiggum","m4_wiggum");
		Game.AddObjectiveNPCWaypoint( "wiggum", "m2_kearney_walk1" );
		Game.AddObjectiveNPCWaypoint( "wiggum", "m2_kearney_walk2" );
		Game.AddObjectiveNPCWaypoint( "wiggum", "m2_kearney_walk1" );
		Game.SetTalkToTarget("wiggum", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.AddObjective("dialogue");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_open_arm_hand_gesture" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_hands_on_hips" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m4_bestside2" );
		Game.SetDialogueInfo("bart","wiggum","finest",0);
		Game.SetDialoguePositions("m4_wiggum_bart","m4_wiggum","m4_wiggum_carstart");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(0);
	Game.SetMaxTraffic(5);
	Game.SetStageMessageIndex(58);
	Game.SetHUDIcon( "snake" );
	--SetStageMusicAlwaysOn();
	Game.AddObjective("goto");
		Game.AddNPC("snake","m4_bart_racestart");
		Game.RemoveDriver("snake");
		Game.AddStageVehicle("snake_v","m4_snake_carstart1","NULL","Missions\\level02\\M4race.con");
		Game.SetDestination("snake", "carsphere");
		Game.SetCollectibleEffect("wrench_collect");
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(1);
	Game.SetStageMessageIndex(60);
	Game.SetHUDIcon( "snake" );
	Game.AddObjective("talkto");
		Game.AddNPC("snake","m4_bart_racestart");
		Game.AddStageVehicle("snake_v","m4_snake_carstart1","NULL","Missions\\level02\\M4race.con");
		Game.SetTalkToTarget("snake", 0, 0);
	Game.CloseObjective();
Game.CloseStage();

Game.AddStage(2);
	Game.AddObjective("dialogue");
		Game.AddStageVehicle("snake_v","m4_snake_carstart1","NULL","Missions\\level02\\M4race.con");
		Game.AddStageCharacter ("bart", "m4_snake_bart", "", "current", "m4_bart_racestart");
		Game.AmbientAnimationRandomize( 1, 0 );      -- ( pc=0, npc=1) (nonrandom=0, random=1)
		Game.AmbientAnimationRandomize( 0, 0 );
		Game.SetConversationCam( 0, "pc_far" );
		Game.SetConversationCam( 1, "npc_far" );
		Game.SetConversationCam( 2, "pc_far" );
		Game.SetConversationCam( 3, "npc_far" );
		Game.SetConversationCam( 4, "pc_far" );
		Game.SetConversationCam( 5, "npc_far" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_shaking_fist" );
		Game.AddAmbientNpcAnimation( "none" );
		Game.AddAmbientNpcAnimation( "dialogue_yes" );
		Game.AddAmbientPcAnimation( "dialogue_shake_hand_in_air" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "dialogue_scratch_head" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.AddAmbientPcAnimation( "none" );
		Game.SetCamBestSide( "m4_bestside3" );
		Game.SetDialogueInfo("bart","snake","chicks",0);
		Game.SetDialoguePositions("m4_snake_bart","m4_snake","m4_race_start");
	Game.CloseObjective();
	Game.SetIrisWipe(0.1 );
Game.CloseStage();




Game.AddStage();
	Game.SetMaxTraffic(3); --for this race, reduce traffic to prevent overwhelming the user
	Game.SetStageMessageIndex(142);
	Game.SetHUDIcon( "stadium" );
	Game.PutMFPlayerInCar();  -- This makes the play auto reset into their car for this stage.
	Game.AddStageVehicle("snake_v","m4_snake_carstart1","race","Missions\\level02\\M4race.con", "snake");

	Game.SetStageAIRaceCatchupParams("snake_v", 80, 0.5, 1.5, 1.7);

	Game.StartCountdown("count");
	Game.AddToCountdownSequence( "3", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "2", 1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "1",  1000 ); -- duration time in milliseconds
	Game.AddToCountdownSequence( "GO",  400 ); -- duration time in milliseconds

	Game.AddStageWaypoint( "m4_finish" );
	Game.AddObjective( "race", "both");
                Game.RemoveNPC("snake");
                Game.AddDriver("snake", "snake_v");
		Game.AddCollectible("m4_finish","finish_line");
--		SetCollectibleEffect("finish_line_col");
	Game.CloseObjective();
	Game.AddCondition("race");
		Game.SetCondTargetVehicle("snake_v");
	Game.CloseCondition();
	Game.AddStageMusicChange();
	Game.ShowStageComplete();
	Game.SetFadeOut( 2 );
Game.CloseStage();

Game.AddStage("final");
	Game.SetHUDIcon( "radio" );
	Game.SetStageMessageIndex(170);
	Game.AddObjective("goto","neither");
		Game.TurnGotoDialogOff();
		Game.AddStageCharacter ("bart", "m4_bart_end", "", "current", "m4_bartcar_end");
		Game.AddNPC("snake","m4_snake2");
                Game.RemoveDriver("snake");
		Game.AddStageVehicle("snake_v","m4_snake_carstart2","NULL","Missions\\level02\\M4race.con");
		Game.SetDestination("m4_radio","radio");
	Game.CloseObjective();
	Game.SetCompletionDialog("satellite");

Game.CloseStage();

Game.CloseMission();

CompletedMissions.ToggleMissionComplete(tostring(c_level),mission_codes[c_mission]);
	if mission_counts[c_level][c_mission] == 0 then
		mission_counts[c_level][c_mission] = 1
	end


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
