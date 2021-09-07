player_seed = GetSetting("Seed")
DisablePopups = GetSetting("DisablePopups")
DisableIngamePopups = GetSetting("DisableIngamePopups")
DisableOPCars = GetSetting("DisableOPCars")
multiplier = GetSetting("Price Multiplier")
dofile(GetModPath() .."/Resources/game.lua")
dofile(GetModPath() .."/Resources/GameProgress.lua")
dofile(GetModPath() .. "/Resources/manual randomizer.lua")
dofile(GetModPath() .. "/Resources/lib/P3D.lua")

mission_counts = {[1]={0,0,0,0,0,0,0,0,0,0,0}, [2]={0,0,0,0,0,0,0,0,0,0,0}, [3]={0,0,0,0,0,0,0,0,0,0,0}, [4]={0,0,0,0,0,0,0,0,0,0,0}, [5]={0,0,0,0,0,0,0,0,0,0,0},
[6]={0,0,0,0,0,0,0,0,0,0,0}, [7]={0,0,0,0,0,0,0,0,0,0,0}}
mission_codes = {}
mission_codes[1] = "M1"
mission_codes[2] = "M2"
mission_codes[3] = "M3"
mission_codes[4] = "M4"
mission_codes[5] = "M5"
mission_codes[6] = "M6"
mission_codes[7] = "M7"
mission_codes[8] = "SR1"
mission_codes[9] = "SR2"
mission_codes[10] = "SR3"
mission_codes[11] = "BM"
mission_codes[12] = "simpson"
mission_codes[13] = "gil"
mission_codes[14] = "gil"

reward_giver = function(level,missions)
	o_level = level
	for i,mission in ipairs(missions) do
		if mission <= 7 then
			if mission == 1 then
				level = level - 1
				mission = 7
			else
				mission = mission - 1
			end
		else
			level = o_level
		end
		if mission <= 11 then
			mission_code = mission_codes[mission]
			if CompletedMissions.Missions[tostring(level)][mission_code] == true and mission_counts[level][mission] == 1 then
				item = level_rewards[level][mission]
				mission_counts[level][mission] = mission_counts[level][mission] + 1
				if is_something_in(item,costume_list) then
					Game.BindReward(item, "art\\chars\\"..string.sub(item,1,6).."_m.p3d", "skin", "forsale", rev_costume_list[item], 0, "interior")
					print("UNLOCK|COSTUME|"..tostring(rev_costume_list[item]).."|"..item_names[item])
					if not(DisablePopups) then
						Alert("You unlocked the costume "..item_names[item].." in Level "..tostring(rev_costume_list[item]))
					end
					Game.BindReward(item, "art\\chars\\"..string.sub(item,1,6).."_m.p3d", "skin", "forsale", o_level, 0, "interior")
					if not DisableIngamePopups then
						Game.AddStage("locked", "car", "notification")
						Game.SetStageMessageIndex(ingame_messages[item])
						Game.AddObjective("timer")
						Game.SetDurationTime(0)
						Game.CloseObjective()
						Game.CloseStage()
					end
				elseif type(item) == "number" then
					coins = true
					if not(DisablePopups) then
						Alert("You earnt "..item.." Coins")
					end
				else
					Game.BindReward( item, "art\\cars\\"..item..".p3d", "car", "forsale", o_level, 0, "simpson" );
					print("UNLOCK|CAR|"..o_level.."|"..item_names[item])
					if not(DisablePopups) then
						Alert("You unlocked the car "..item_names[item]..". Buy it from any non-Gil NPC for free")
					end
					if not DisableIngamePopups then
						Game.AddStage("locked", "car", "notification")
						Game.SetStageMessageIndex(ingame_messages[item])
						Game.AddObjective("timer")
						Game.SetDurationTime(0)
						Game.CloseObjective()
						Game.CloseStage()
					end
				end
			end
		end
	end
end


krusty = 0
