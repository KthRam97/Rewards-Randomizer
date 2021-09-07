function is_something_in(something,structure)
	for index, value in ipairs(structure) do
		if value == something then
			return true
		end
	end

	return false
end


function car_checker(locations)

	local level_1_cr = {table.unpack(locations, 12, 14)}
	local level_2_cr = {table.unpack(locations, 26, 28)}
	local level_3_cr = {table.unpack(locations, 40, 42)}
	local level_4_cr = {table.unpack(locations, 54, 56)}
	local level_5_cr = {table.unpack(locations, 68, 70)}
	local level_6_cr = {table.unpack(locations, 82, 84)}
	local level_7_cr = {table.unpack(locations, 96, 98)}
	table.insert(level_7_cr,locations[91])

	costume_list = {"h_undrwr","h_fat","h_stcrobe","b_tall","b_ninja","b_football","l_cool","l_florida","l_jersey","m_prison","m_pink","m_police","a_army","a_american","a_besharp","b_hugo","b_military","b_man","h_scuzzy","h_evil","h_donut"}

	for i,v in ipairs(level_1_cr) do
		if is_something_in(v,costume_list) then
			return false
		end
	end

	for i,v in ipairs(level_2_cr) do
		if is_something_in(v,costume_list) then
			return false
		end
	end

	for i,v in ipairs(level_3_cr) do
		if is_something_in(v,costume_list) then
			return false
		end
	end

	for i,v in ipairs(level_4_cr) do
		if is_something_in(v,costume_list) then
			return false
		end
	end

	for i,v in ipairs(level_5_cr) do
		if is_something_in(v,costume_list) then
			return false
		end
	end

	for i,v in ipairs(level_6_cr) do
		if is_something_in(v,costume_list) then
			return false
		end
	end

	for i,v in ipairs(level_7_cr) do
		if is_something_in(v,costume_list) then
			return false
		end
	end

	return true


end


function softlock_checker(randomized_locations, f_pur, b_miss)

	rev_f_pur = {}
	for a,b in pairs(f_pur) do
		rev_f_pur[b]=a
	end

	-- Input Initialisation
	level_1_r = {table.unpack(randomized_locations, 1, 6)}
	level_2_r = {table.unpack(randomized_locations, 15, 21)}
	level_3_r = {table.unpack(randomized_locations,29,35)}
	level_4_r = {table.unpack(randomized_locations, 43, 49)}
	level_5_r = {table.unpack(randomized_locations, 57, 63)}
	level_6_r = {table.unpack(randomized_locations, 71, 77)}
	level_7_r = {table.unpack(randomized_locations, 85, 90)}
	table.insert(level_7_r,"0")
	level_1_cr = {table.unpack(randomized_locations, 8, 14)}
	level_2_cr = {table.unpack(randomized_locations, 22, 28)}
	level_3_cr = {table.unpack(randomized_locations, 36, 42)}
	level_4_cr = {table.unpack(randomized_locations, 50, 56)}
	level_5_cr = {table.unpack(randomized_locations, 64, 70)}
	level_6_cr = {table.unpack(randomized_locations, 78, 84)}
	level_7_cr = {table.unpack(randomized_locations, 91, 98)}
	current_r = {}

	-- Collecting all rewards that don't require doing missions in

	-- Homer 1
	for i,v in ipairs(level_1_cr) do
		if v~="0" then
			table.insert(current_r,v)
		end
	end

	-- Bart 1
	for i,v in ipairs(level_2_cr) do
		if v~="0" then
			table.insert(current_r,v)
		end
	end

	-- Lisa
	for i,v in ipairs(level_3_cr) do
		if v~="0" then
			table.insert(current_r,v)
		end
	end

	-- Marge
	for i,v in ipairs(level_4_cr) do
		if v~="0" then
			table.insert(current_r,v)
		end
	end

	-- Apu
	for i,v in ipairs(level_5_cr) do
		if v~="0" then
			table.insert(current_r,v)
		end
	end

	-- Bart 2
	for i,v in ipairs(level_6_cr) do
		if v~="0" then
			table.insert(current_r,v)
		end
	end

	-- Homer 2
	for i,v in ipairs(level_7_cr) do
		if v~="0" then
			table.insert(current_r,v)
		end
	end



	-- Level Initialisation
	level_1 = {"L1M1","L1M2", "L1M3","L1M4","L1M5","L1M6","L1M7"}
	level_2 = {"L2M1","L2M2", "L2M3","L2M4","L2M5","L2M6","L2M7"}
	level_3 = {"L3M1","L3M2", "L3M3","L3M4","L3M5","L3M6","L3M7"}
	level_4 = {"L4M1","L4M2", "L4M3","L4M4","L4M5","L4M6","L4M7"}
	level_5 = {"L5M1","L5M2", "L5M3","L5M4","L5M5","L5M6","L5M7"}
	level_6 = {"L6M1","L6M2", "L6M3","L6M4","L6M5","L6M6","L6M7"}
	level_7 = {"L7M1","L7M2", "L7M3","L7M4","L7M5","L7M6","L7M7"}

	level_1_p = {"L1M1","L1M2", "L1M3","L1M4","L1M5","L1M6","L1M7"}
	level_2_p = {"L2M1","L2M2", "L2M3","L2M4","L2M5","L2M6","L2M7"}
	level_3_p = {"L3M1","L3M2", "L3M3","L3M4","L3M5","L3M6","L3M7"}
	level_4_p = {"L4M1","L4M2", "L4M3","L4M4","L4M5","L4M6","L4M7"}
	level_5_p = {"L5M1","L5M2", "L5M3","L5M4","L5M5","L5M6","L5M7"}
	level_6_p = {"L6M1","L6M2", "L6M3","L6M4","L6M5","L6M6","L6M7"}
	level_7_p = {"L7M1","L7M2", "L7M3","L7M4","L7M5","L7M6","L7M7"}


	-- Available Mission determination
	for i,v in ipairs(b_miss) do
		for j,w in ipairs(level_1_p) do
			if is_something_in(w,v) then
				level_1_p[j] = "0"
			end
		end

		for j,w in ipairs(level_2_p) do
			if is_something_in(w,v) then
				level_2_p[j] = "0"
			end
		end

		for j,w in ipairs(level_3_p) do
			if is_something_in(w,v) then
				level_3_p[j] = "0"
			end
		end

		for j,w in ipairs(level_4_p) do
			if is_something_in(w,v) then
				level_4_p[j] = "0"
			end
		end

		for j,w in ipairs(level_5_p) do
			if is_something_in(w,v) then
				level_5_p[j] = "0"
			end
		end

		for j,w in ipairs(level_6_p) do
			if is_something_in(w,v) then
				level_6_p[j] = "0"
			end
		end

		for j,w in ipairs(level_7_p) do
			if is_something_in(w,v) then
				level_7_p[j] = "0"
			end
		end
	end

	j = 0
	m = 0
	old_r = {}
	change = true

	while j <= 100 and change do
		change = false

		-- Adds any new rewards to current_r and puts these rewards in old_r
		for i,v in ipairs(current_r) do
			if is_something_in(v,f_pur) and not(is_something_in(v,old_r)) then
				n_miss = b_miss[rev_f_pur[v]]
				table.insert(old_r,v)

				-- Adds new possible missions
				for _,mission in ipairs(n_miss) do

					-- to Homer 1
					if string.sub(mission,2,2) == "1" then
						level_1_p[tonumber(string.sub(mission,4,4))] = mission
					end

					-- to Bart 1
					if string.sub(mission,2,2) == "2" then
						level_2_p[tonumber(string.sub(mission,4,4))] = mission
					end

					-- to Lisa
					if string.sub(mission,2,2) == "3" then
						level_3_p[tonumber(string.sub(mission,4,4))] = mission
					end

					-- to Marge
					if string.sub(mission,2,2) == "4" then
						level_4_p[tonumber(string.sub(mission,4,4))] = mission
					end

					-- to Apu
					if string.sub(mission,2,2) == "5" then
						level_5_p[tonumber(string.sub(mission,4,4))] = mission
					end

					-- to Bart 2
					if string.sub(mission,2,2) == "6" then
						level_6_p[tonumber(string.sub(mission,4,4))] = mission
					end

					-- to Homer 2
					if string.sub(mission,2,2) == "7" then
						level_7_p[tonumber(string.sub(mission,4,4))] = mission
					end

				end
			end
		end

		-- Checking if any missions can be done

		-- in Homer 1
		if not(level_1 == {"0", "0", "0", "0", "0", "0", "0"}) then
			for i,v in ipairs(level_1_p) do
				if v ~="0" then
					if is_something_in(v,level_1) then
						level_1[i] = "0"
						change = true
						m = m + 1
						if level_1_r[i]~="0" then
							table.insert(current_r,level_1_r[i])
						end
					end
				else
					break
				end
			end
		end

		-- in Bart 1
		if not(level_2 == {"0", "0", "0", "0", "0", "0", "0"}) then
			for i,v in ipairs(level_2_p) do
				if v ~="0" then
					if is_something_in(v,level_2) then
						level_2[i] = "0"
						change = true
						m = m + 1
						if level_2_r[i]~="0" then
							table.insert(current_r,level_2_r[i])
						end
					end
				else
					break
				end
			end
		end

		-- in Lisa
		if not(level_3 == {"0", "0", "0", "0", "0", "0", "0"}) then
			for i,v in ipairs(level_3_p) do
				if v ~="0" then
					if is_something_in(v,level_3) then
						level_3[i] = "0"
						change = true
						m = m + 1
						if level_3_r[i]~="0" then
							table.insert(current_r,level_3_r[i])
						end
					end
				else
					break
				end
			end
		end

		-- in Marge
		if not(level_4 == {"0", "0", "0", "0", "0", "0", "0"}) then
			for i,v in ipairs(level_4_p) do
				if v ~="0" then
					if is_something_in(v,level_4) then
						level_4[i] = "0"
						change = true
						m = m + 1
						if level_4_r[i]~="0" then
							table.insert(current_r,level_4_r[i])
						end
					end
				else
					break
				end
			end
		end

		-- in Apu
		if not(level_5 == {"0", "0", "0", "0", "0", "0", "0"}) then
			for i,v in ipairs(level_5_p) do
				if v ~="0" then
					if is_something_in(v,level_5) then
						level_5[i] = "0"
						change = true
						m = m + 1
						if level_5_r[i]~="0" then
							table.insert(current_r,level_5_r[i])
						end
					end
				else
					break
				end
			end
		end

		-- in Bart 2
		if not(level_6 == {"0", "0", "0", "0", "0", "0", "0"}) then
			for i,v in ipairs(level_6_p) do
				if v ~="0" then
					if is_something_in(v,level_6) then
						level_6[i] = "0"
						change = true
						m = m + 1
						if level_6_r[i]~="0" then
							table.insert(current_r,level_6_r[i])
						end
					end
				else
					break
				end
			end
		end

		-- in Homer 2
		if not(level_7 == {"0", "0", "0", "0", "0", "0"}) then
			for i,v in ipairs(level_7_p) do
				if v ~="0" then
					if is_something_in(v,level_7) then
						level_7[i] = "0"
						change = true
						m = m + 1
						if level_7_r[i]~="0" then
							table.insert(current_r,level_7_r[i])
						end
					end
				else
					break
				end
			end
		end

		j = j + 1
	end

	if m == 49 then
		return true
	else
		return false
	end
end

function file_editor(level, level_rewards)

	larger_path = "CustomFiles/"

	costume_list = {"h_undrwr","h_fat","h_stcrobe","b_tall","b_ninja","b_football","l_cool","l_florida","l_jersey","m_prison","m_pink","m_police","a_army","a_american","a_besharp","b_hugo","b_military","b_man","h_scuzzy","h_evil","h_donut"}
	car_list = {"plowk_v","mrplo_v","otto_v","willi_v","carhom_v","scorp_v","zombi_v"}
	gil_list = {{"cDuff","cVan"},{"cLimo","cFire_v"},{"cDonut","cNerd"},{"cKlimo","cCurator"},{"wiggu_v","cCola"},{"cArmor","cSedan"},{"hbike_v","cHears"}}
	default_list = {"famil_v","honor_v","lisa_v","marge_v","apu_v","bart_v","homer_v"}
	rev_costume_list = {}
	rev_costume_list["h_undrwr"] = 1
	rev_costume_list["h_fat"] = 1
	rev_costume_list["h_stcrobe"] = 1
	rev_costume_list["b_tall"] = 2
	rev_costume_list["b_football"] = 2
	rev_costume_list["b_ninja"] = 2
	rev_costume_list["l_cool"] = 3
	rev_costume_list["l_florida"] = 3
	rev_costume_list["l_jersey"] = 3
	rev_costume_list["m_prison"] = 4
	rev_costume_list["m_pink"] = 4
	rev_costume_list["m_police"] = 4
	rev_costume_list["a_army"] = 5
	rev_costume_list["a_american"] = 5
	rev_costume_list["a_besharp"] = 5
	rev_costume_list["b_hugo"] = 6
	rev_costume_list["b_military"] = 6
	rev_costume_list["b_man"] = 6
	rev_costume_list["h_scuzzy"] = 7
	rev_costume_list["h_evil"] = 7
	rev_costume_list["h_donut"] = 7

	for index,item in ipairs(level_rewards) do
		if level ~= "7" then
			if index <= 11 then
				if index <= 7 then
					task = "m"..tostring(index)
					path = "scripts/missions/"
					filename = larger_path..path.."level0"..level.."/"..task.."i.mfk"
					o_filename = larger_path..path.."level0"..level.."/"..task.."i_Original.mfk"
				elseif index <= 10 then
					task = "sr"..tostring(index-7)
					path = "scripts/missions/"
					filename = larger_path..path.."level0"..level.."/"..task.."i.mfk"
					o_filename = larger_path..path.."level0"..level.."/"..task.."i_Original.mfk"
				elseif index == 11 then
					task = "bm1"
					path = "scripts/missions/"
					filename = larger_path..path.."level0"..level.."/"..task.."i.mfk"
					o_filename = larger_path..path.."level0"..level.."/"..task.."i_Original.mfk"
				end

				local o_file = io.open(o_filename)
				if not(o_file) then
					local file = io.open(filename,"r")
					contents = file:read("*all")
					local o_file = io.open(o_filename,"w")
					o_file:write(contents)
					o_file:close()
					file:close()
				else
					local o_file = io.open(o_filename,"r")
					local file = io.open(filename,"w")
					contents = o_file:read("*all")
					file:write(contents)
					file:close()
					o_file:close()
				end

				x,y = string.find(contents,'BindReward')
				if is_something_in(item,costume_list) then
					true_level = rev_costume_list[item]
					if tostring(true_level) == level then
						s = string.sub(contents,1,x+12)..item..string.sub(contents,x+23,x+36)..string.sub(item,1,6)..string.sub(contents,x+43,x+90)..string.sub(contents,x+174,-1)
					else
						s = string.sub(contents,1,x+12)..item..string.sub(contents,x+23,x+36)..string.sub(item,1,6)..string.sub(contents,x+43,x+90)..'BindReward( "'..item..'", "art\\chars\\'..string.sub(item,1,6)..'_m.p3d", "skin", "forsale", '..tostring(true_level)..', 0, "interior" );'..string.sub(contents,x+174,-1)
					end
				elseif type(item) == "number" then
					s = string.sub(contents,1,x-1).."SetStagePayout("..tostring(item)..");"..string.sub(contents,x+174,-1)
				else
					s = string.sub(contents,1,x-1)..string.sub(contents,x+91,x+103)..item..string.sub(contents,x+111,x+123)..item..string.sub(contents,x+131,-1)
				end

				local file = io.open(filename,"w")
				file:write(s)
				file:close()

			-- Remaining Items (Gil/NPC/Default Cars)
			elseif index <= 14 then
				path = "scripts/missions/"
				filename = larger_path..path.."rewards.mfk"
				o_filename = larger_path..path.."rewards_Original.mfk"

				local o_file = io.open(o_filename)
				if level == "1" and index == 12 then
					if not(o_file) then
						local file = io.open(filename,"r")
						contents = file:read("*all")
						local o_file = io.open(o_filename,"w")
						o_file:write(contents)
						o_file:close()
						file:close()
					else
						local o_file = io.open(o_filename,"r")
						local file = io.open(filename,"w")
						contents = o_file:read("*all")
						file:write(contents)
						file:close()
						o_file:close()
					end
				end

				if index == 12 then
					gil_car = ""
					car_type = "Car"
					vanilla_r = car_list[tonumber(level)]
				elseif index == 13 or index == 14 then
					gil_car = tostring(index-12)
					car_type = "Gil"
					vanilla_r = gil_list[tonumber(level)][tonumber(gil_car)]
				else
					print("Index not between 1 and 14 obtained from a level")
				end

				local file = io.open(filename,"r")
				local contents = file:read("*all")
				file:close()
				x,y = string.find(contents,car_type..'_L'..level..gil_car)
				temp = string.sub(contents,y+12,-1)
				a,b = string.find(temp,vanilla_r)
				temp_2 = string.sub(contents,y+12+b,-1)
				c,d = string.find(temp_2,vanilla_r)
				s = string.sub(contents,1,y+11+a-1)..item..string.sub(contents,y+11+b+1,y+11+b+c-1)..item..string.sub(contents,y+11+b+d+1,-1)

				local file = io.open(filename,"w")
				file:write(s)
				file:close()
			end
		elseif level == "7" then
			if index <= 11 and not(index==7) then
				if index <= 6 then
					task = "m"..tostring(index)
					path = "scripts/missions/"
					filename = larger_path..path.."level0"..level.."/"..task.."i.mfk"
					o_filename = larger_path..path.."level0"..level.."/"..task.."i_Original.mfk"
				elseif index <= 10 then
					task = "sr"..tostring(index-7)
					path = "scripts/missions/"
					filename = larger_path..path.."level0"..level.."/"..task.."i.mfk"
					o_filename = larger_path..path.."level0"..level.."/"..task.."i_Original.mfk"
				elseif index == 11 then
					task = "bm1"
					path = "scripts/missions/"
					filename = larger_path..path.."level0"..level.."/"..task.."i.mfk"
					o_filename = larger_path..path.."level0"..level.."/"..task.."i_Original.mfk"
				end

				local o_file = io.open(o_filename)
				if not(o_file) then
					local file = io.open(filename,"r")
					contents = file:read("*all")
					local o_file = io.open(o_filename,"w")
					o_file:write(contents)
					o_file:close()
					file:close()
				else
					local o_file = io.open(o_filename,"r")
					local file = io.open(filename,"w")
					contents = o_file:read("*all")
					file:write(contents)
					file:close()
					o_file:close()
				end

				x,y = string.find(contents,'BindReward')
				if is_something_in(item,costume_list) then
					true_level = rev_costume_list[item]
					if tostring(true_level) == level then
						s = string.sub(contents,1,x+12)..item..string.sub(contents,x+23,x+36)..string.sub(item,1,6)..string.sub(contents,x+43,x+90)..string.sub(contents,x+174,-1)
					else
						s = string.sub(contents,1,x+12)..item..string.sub(contents,x+23,x+36)..string.sub(item,1,6)..string.sub(contents,x+43,x+90)..'BindReward( "'..item..'", "art\\chars\\'..string.sub(item,1,6)..'_m.p3d", "skin", "forsale", '..tostring(true_level)..', 0, "interior" );'..string.sub(contents,x+174,-1)
					end
				elseif type(item) == "number" then
					s = string.sub(contents,1,x-1).."SetStagePayout("..tostring(item)..");"..string.sub(contents,x+174,-1)
				else
					s = string.sub(contents,1,x-1)..string.sub(contents,x+91,x+103)..item..string.sub(contents,x+111,x+123)..item..string.sub(contents,x+131,-1)
				end

				local file = io.open(filename,"w")
				file:write(s)
				file:close()

			-- Remaining Items (Gil/NPC/Default Cars)
			elseif index <= 14 then
				path = "scripts/missions/"
				filename = larger_path..path.."rewards.mfk"
				o_filename = larger_path..path.."rewards_Original.mfk"

				if index == 12 then
					gil_car = ""
					car_type = "Car"
					vanilla_r = car_list[tonumber(level)]
				elseif index == 13 or index == 14 then
					gil_car = tostring(index-12)
					car_type = "Gil"
					vanilla_r = gil_list[tonumber(level)][tonumber(gil_car)]
				elseif index == 7 then
					gil_car = ""
					car_type = "Default"
					vanilla_r = default_list[tonumber(level)]

					for i,L in ipairs({1,2,3,4,5,6,7}) do
						vanilla_r = default_list[L]

						-- Level File Manipulation
						local level_filename = larger_path..path.."level0"..L.."/level.mfk"
						local o_level_filename = larger_path..path.."level0"..L.."/level_Original.mfk"

						local o_level_file = io.open(o_level_filename)
						if not(o_level_file) then
							local level_file = io.open(level_filename,"r")
							contents = level_file:read("*all")
							local o_level_file = io.open(o_level_filename,"w")
							o_level_file:write(contents)
							o_level_file:close()
							level_file:close()
						else
							local o_level_file = io.open(o_level_filename,"r")
							local level_file = io.open(level_filename,"w")
							contents = o_level_file:read("*all")
							level_file:write(contents)
							level_file:close()
							o_level_file:close()
						end

						local level_file = io.open(level_filename,"r")
						local contents = level_file:read("*all")
						level_file:close()
						x, y = string.find(contents, "LoadDisposableCar")
						temp = string.sub(contents,y+1,-1)
						a,b = string.find(temp,vanilla_r)
						temp_2 = string.sub(temp,b+1,-1)
						c,d = string.find(temp_2,vanilla_r)
						s = string.sub(contents,1,y+a-1)..item..string.sub(contents,y+b+1,y+b+c-1)..item..string.sub(contents,y+b+d+1,-1)
						local level_file = io.open(level_filename,"w")
						level_file:write(s)
						level_file:close()

						-- Leveli file manipulation
						local level_filename = larger_path..path.."level0"..L.."/leveli.mfk"
						local o_level_filename = larger_path..path.."level0"..L.."/leveli_Original.mfk"

						local o_level_file = io.open(o_level_filename)
						if not(o_level_file) then
							local level_file = io.open(level_filename,"r")
							contents = level_file:read("*all")
							local o_level_file = io.open(o_level_filename,"w")
							o_level_file:write(contents)
							o_level_file:close()
							level_file:close()
						else
							local o_level_file = io.open(o_level_filename,"r")
							local level_file = io.open(level_filename,"w")
							contents = o_level_file:read("*all")
							level_file:write(contents)
							level_file:close()
							o_level_file:close()
						end

						local level_file = io.open(level_filename,"r")
						local contents = level_file:read("*all")
						level_file:close()
						x,y = string.find(contents,vanilla_r)
						s = string.sub(contents,1,x-1)..item..string.sub(contents,y+1,-1)
						local level_file = io.open(level_filename,"w")
						level_file:write(s)
						level_file:close()

						path = "scripts/missions/"
						filename = larger_path..path.."rewards.mfk"
						o_filename = larger_path..path.."rewards_Original.mfk"

						local file = io.open(filename,"r")
						local contents = file:read("*all")
						file:close()
						x,y = string.find(contents,car_type..'_L'..L..gil_car)
						temp = string.sub(contents,y+12,-1)
						a,b = string.find(temp,vanilla_r)
						temp_2 = string.sub(contents,y+12+b,-1)
						c,d = string.find(temp_2,vanilla_r)
						s = string.sub(contents,1,y+11+a-1)..item..string.sub(contents,y+11+b+1,y+11+b+c-1)..item..string.sub(contents,y+11+b+d+1,-1)
						local file = io.open(filename,"w")
						file:write(s)
						file:close()
					end

			else
				print("Index not between 1 and 14 obtained from level 7")
			end

			if not(index==7) then
				local file = io.open(filename,"r")
				local contents = file:read("*all")
				file:close()
				x,y = string.find(contents,car_type..'_L'..level..gil_car)
				temp = string.sub(contents,y+12,-1)
				a,b = string.find(temp,vanilla_r)
				temp_2 = string.sub(contents,y+12+b,-1)
				c,d = string.find(temp_2,vanilla_r)
				s = string.sub(contents,1,y+11+a-1)..item..string.sub(contents,y+11+b+1,y+11+b+c-1)..item..string.sub(contents,y+11+b+d+1,-1)
				local file = io.open(filename,"w")
				file:write(s)
				file:close()
				end
			end
		end
	end
end

function newrandomizer(seed,ban)
	vanilla = {"cletu_v","elect_v","plowk_v","cDuff","cVan","famil_v","gramp_v","moe_v","mrplo_v","cLimo","cFire_v","honor_v","skinn_v","bookb_v","otto_v","cDonut","cNerd",
	"lisa_v","comic_v","krust_v","willi_v","cKlimo","cCurator","marge_v","frink_v","bbman_v","carhom_v","wiggu_v","cCola","apu_v","snake_v","burns_v","scorp_v","cArmor","cSedan",
	"bart_v","smith_v","fone_v","zombi_v","hbike_v","cHears","homer_v","h_undrwr","h_fat","h_stcrobe","b_tall","b_football","b_ninja","l_cool","l_florida","l_jersey","m_prison",
	"m_pink","m_police","a_army","a_american","a_besharp","b_hugo","b_military","b_man","h_scuzzy","h_evil","h_donut","ambul","atv_v","burnsarm","cBlbart","cBone","cCellD","cCube",
	"cMilk","cNonup","coffin","compactA","dune_v","fishtruc","garbage","glastruc","gramR_v","hallo","hype_v","icecream","IStruck","knigh_v","minivanA","mono_v","nuctruck","oblit_v",
	"pickupA","pizza","redbrick","rocke_v","schoolbu","sedanA","ship","sportsA","taxiA","votetruc","cPolice","witchcar"}
	
	ingame_messages = {}
	local idx = 19
	for i=1,#vanilla do
		idx = idx + 1
		ingame_messages[vanilla[i]] = idx
	end

	item_names = {}
	item_names["cletu_v"] = "Cletus' Pickup Truck"
	item_names["elect_v"] = "Electaurus"
	item_names["plowk_v"] = "Plow King"
	item_names["cDuff"] = "Duff Truck"
	item_names["cVan"] = "Surveillance Van"
	item_names["famil_v"] = "Family Sedan"
	item_names["gramp_v"] = "World War II Jeep"
	item_names["moe_v"] = "Moe's Sedan"
	item_names["mrplo_v"] = "Mr Plow"
	item_names["cLimo"] = "Limo"
	item_names["cFire_v"] = "Fire Truck"
	item_names["honor_v"] = "Honor Roller"
	item_names["skinn_v"] = "Skinner's Sedan"
	item_names["bookb_v"] = "Book Burning Van"
	item_names["otto_v"] = "Otto's School Bus"
	item_names["cDonut"] = "Donut Truck"
	item_names["cNerd"] = "Nerd Car"
	item_names["lisa_v"] = "Malibu Stacy Car"
	item_names["comic_v"] = "Kremlin"
	item_names["krust_v"] = "Clown Car"
	item_names["willi_v"] = "Willie's Tractor"
	item_names["cKlimo"] = "Krusty's Limo"
	item_names["cCurator"] = "Curator"
	item_names["marge_v"] = "Canyonero"
	item_names["frink_v"] = "Hover car"
	item_names["bbman_v"] = "El carro loco"
	item_names["carhom_v"] = "Car Built for Homer"
	item_names["wiggu_v"] = "Wiggum's Police Car"
	item_names["cCola"] = "Cola Truck"
	item_names["apu_v"] = "Longhorn"
	item_names["snake_v"] = "Bandit"
	item_names["burns_v"] = "36 Stutz Bearcat"
	item_names["scorp_v"] = "Globex Supervillain Car"
	item_names["cArmor"] = "Armored Truck"
	item_names["cSedan"] = "Chase Sedan"
	item_names["bart_v"] = "Red Ferrini"
	item_names["smith_v"] = "Mr. Burns' Limo"
	item_names["fone_v"] = "Open Wheel Race Car"
	item_names["zombi_v"] = "Zombie Car"
	item_names["hbike_v"] = "Hover Bike"
	item_names["cHears"] = "Chase Hearse"
	item_names["homer_v"] = "70's Sports Car"
	item_names["h_undrwr"] = "Casual Homer"
	item_names["h_fat"] = "Homer Muumuu"
	item_names["h_stcrobe"] = "Chosen One Homer"
	item_names["b_tall"] = "Tall Bart"
	item_names["b_football"] = "Football Bart"
	item_names["b_ninja"] = "Ninja Bart"
	item_names["l_cool"] = "Cool Lisa"
	item_names["l_florida"] = "Floreda Lisa"
	item_names["l_jersey"] = "Hockey Lisa"
	item_names["m_prison"] = "Inmate Marge"
	item_names["m_pink"] = "Classy Marge"
	item_names["m_police"] = "Police Marge"
	item_names["a_army"] = "Apu Army"
	item_names["a_american"] = "Apu American"
	item_names["a_besharp"] = "Apu Be Sharps"
	item_names["b_hugo"] = "Hugo Bart"
	item_names["b_military"] = "Cadet Bart"
	item_names["b_man"] = "Bartman"
	item_names["h_scuzzy"] = "Dirty Homer"
	item_names["h_evil"] = "Evil Homer"
	item_names["h_donut"] = "Donut Homer"
	item_names["ambul"] = "Ambulance"
	item_names["atv_v"] = "Quad Bike"
	item_names["burnsarm"] = "Burns' Armored Truck"
	item_names["cBlbart"] = "Black Ferrini"
	item_names["cBone"] = "Bonestorm Truck"
	item_names["cCellD"] = "Cell Outs Car"
	item_names["cCube"] = "Cube Van"
	item_names["cMilk"] = "Milk Truck"
	item_names["cNonup"] = "Nonuplets Minivan"
	item_names["coffin"] = "Coffin Car"
	item_names["compactA"] = "Compact Car"
	item_names["dune_v"] = "R/C Car"
	item_names["fishtruc"] = "Fish Truck"
	item_names["garbage"] = "Garbage Truck"
	item_names["glastruc"] = "Glass Truck"
	item_names["gramR_v"] = "World War II Jeep with Rocket"
	item_names["hallo"] = "Traffic Hearse"
	item_names["hype_v"] = "Planet Hype 50's Car"
	item_names["icecream"] = "Icecream Truck"
	item_names["IStruck"] = "Itchy and Scratchy Movie Truck"
	item_names["knigh_v"] = "Knightboat"
	item_names["minivanA"] = "Traffic Minivan"
	item_names["mono_v"] = "Monorail Car"
	item_names["nuctruck"] = "Nuclear Waste Truck"
	item_names["oblit_v"] = "Monster Truck"
	item_names["pickupA"] = "Traffic Pickup Truck"
	item_names["pizza"] = "Pizza Van"
	item_names["redbrick"] = "Red Brick Car"
	item_names["rocke_v"] = "Rocket Car"
	item_names["schoolbu"] = "Traffic School Bus"
	item_names["sedanA"] = "Traffic Sedan"
	item_names["ship"] = "Ghost Boat"
	item_names["sportsA"] = "Sports Car"
	item_names["taxiA"] = "Taxi"
	item_names["votetruc"] = "Vote Quimby Truck"
	item_names["cPolice"] = "Chase Police Car"
	item_names["witchcar"] = "Witch Broom"

	important_checks = {"plowk_v","mrplo_v","otto_v","l_cool","m_prison","m_police","carhom_v","a_american","scorp_v","zombi_v","h_scuzzy","h_evil","h_donut"}
	b_miss = {}
	b_miss[1] = {"L1M3","L1M4","L1M5","L1M6","L1M7"}
	b_miss[2] = {"L2M6","L2M7"}
	b_miss[3] = {"L3M4"}
	b_miss[4] = {"L3M5","L3M6","L3M7"}
	b_miss[5] = {"L4M3","L4M4","L4M5"}
	b_miss[6] = {"L4M6","L4M7"}
	b_miss[7] = {"L5M3"}
	b_miss[8] = {"L5M4","L5M5","L5M6","L5M7"}
	b_miss[9] = {"L6M6","L6M7"}
	b_miss[10] = {"L7M2","L7M3","L7M4"}
	b_miss[11] = {"L7M5"}
	b_miss[12] = {"L7M6"}
	b_miss[13] = {"L7M7"}
	non_important_checks = {}
	ban_list = {"fone_v","smith_v","cHears"}
	for i,v in ipairs(vanilla) do
		if not(is_something_in(v,important_checks)) then
			if not(ban) or not(is_something_in(v,ban_list)) then
				table.insert(non_important_checks,v)
			end
		end
	end

	randomized_locations = {"0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0"}
	check = false
	costume_list = {"h_undrwr","h_fat","h_stcrobe","b_tall","b_ninja","b_football","l_cool","l_florida","l_jersey","m_prison","m_pink","m_police","a_army","a_american","a_besharp","b_hugo","b_military","b_man","h_scuzzy","h_evil","h_donut"}
	rev_costume_list = {}
	rev_costume_list["h_undrwr"] = 1
	rev_costume_list["h_fat"] = 1
	rev_costume_list["h_stcrobe"] = 1
	rev_costume_list["b_tall"] = 2
	rev_costume_list["b_football"] = 2
	rev_costume_list["b_ninja"] = 2
	rev_costume_list["l_cool"] = 3
	rev_costume_list["l_florida"] = 3
	rev_costume_list["l_jersey"] = 3
	rev_costume_list["m_prison"] = 4
	rev_costume_list["m_pink"] = 4
	rev_costume_list["m_police"] = 4
	rev_costume_list["a_army"] = 5
	rev_costume_list["a_american"] = 5
	rev_costume_list["a_besharp"] = 5
	rev_costume_list["b_hugo"] = 6
	rev_costume_list["b_military"] = 6
	rev_costume_list["b_man"] = 6
	rev_costume_list["h_scuzzy"] = 7
	rev_costume_list["h_evil"] = 7
	rev_costume_list["h_donut"] = 7
	car_only_locations = {12,13,14,26,27,28,40,41,42,54,55,56,68,69,70,82,83,84,91,96,97,98}
	math.randomseed(seed)
	
	while not(check) do
		-- Store the current set of randomized locations in a backup list
		t1_randomized_locations = {}
		for i,v in ipairs(randomized_locations) do
			t1_randomized_locations[i] = v
		end

		-- Assign the important checks to certain locations randomly
		for i,v in ipairs(important_checks) do
			check2 = false

			-- Additional while loop to ensure that each important check ends
			-- up in a unique location and costumes don't go in car spots
			while not(check2) do
				pos = math.random(1, #randomized_locations)
				if randomized_locations[pos] == "0" then
					if not(is_something_in(pos,car_only_locations)) then
						randomized_locations[pos] = v
						check2 = true
					elseif not(is_something_in(v,costume_list)) then
						randomized_locations[pos] = v
						check2 = true
					end

				end
			end
		end

		-- If the current positions avoid a softlock escape the loop,
		-- otherwise reset the randomized locations using the backup list
		if softlock_checker(randomized_locations, important_checks, b_miss) then
			check = true
		else
			randomized_locations = {}
			for i,v in ipairs(t1_randomized_locations) do
				randomized_locations[i] = v
			end
		end
	end

	-- Iterates through all empty spaces and assigns something randomly
	-- from the non important checks
	positions_used = {}
	for i,v in ipairs(randomized_locations) do
		if v == "0" then
			pos = math.random(1, #non_important_checks)
			if not(is_something_in(i,car_only_locations)) then
				j = 0
				while is_something_in(pos,positions_used) and j < 100 do
					j = j + 1
					pos = math.random(1,#non_important_checks)
				end
				if j >= 100 then
					randomized_locations[i] = math.random(1,250)
				else
					randomized_locations[i] = non_important_checks[pos]
					table.insert(positions_used,pos)
				end
			else
				j = 0
				check = false
				while (is_something_in(non_important_checks[pos],costume_list) or is_something_in(pos,positions_used)) and j < 100 do
					j = j+1
					pos = math.random(1,#non_important_checks)
				end
				if j >= 100 then
					while is_something_in(non_important_checks[pos],costume_list) do
						pos = math.random(1,#non_important_checks)
					end
					randomized_locations[i] = non_important_checks[pos]
					table.insert(positions_used,pos)
				else
					randomized_locations[i] = non_important_checks[pos]
					table.insert(positions_used,pos)
				end
			end
		else
			randomized_locations[i] = v
		end
	end

	level_rewards = {[1] = {table.unpack(randomized_locations, 1, 14)},
	[2] = {table.unpack(randomized_locations, 15, 28)},
	[3] = {table.unpack(randomized_locations,29, 42)},
	[4] = {table.unpack(randomized_locations, 43, 56)},
	[5] = {table.unpack(randomized_locations, 57, 70)},
	[6] = {table.unpack(randomized_locations, 71, 84)},
	[7] = {table.unpack(randomized_locations, 85, 98)}}

	--file_editor("1",level_1)
	--file_editor("2",level_2)
	--file_editor("3",level_3)
	--file_editor("4",level_4)
	--file_editor("5",level_5)
	--file_editor("6",level_6)
	--file_editor("7",level_7)

	--codes_16 = {"Mission 1","Mission 2", "Mission 3", "Mission 4", "Mission 5", "Mission 6", "Mission 7", "Street Race 1", "Street Race 2", "Street Race 3", "Bonus Mission", "NPC Car", "Gil Car 1", "Gil Car 2"}
	--codes_7 = {"Mission 1","Mission 2", "Mission 3", "Mission 4", "Mission 5", "Mission 6", "Default Car", "Street Race 1", "Street Race 2", "Street Race 3", "Bonus Mission", "NPC Car", "Gil Car 1", "Gil Car 2"}
	--spoiler_file = io.open("spoiler_log.txt","w")
	--s = "Spoiler Log\nSeed: "..seed.."\n\nDefault Car: "..level_7[7].."\n\nLevel 1\n"
	--for i,v in ipairs(level_1) do
	--	if type(v) == "number" then
	--		s = s..codes_16[i]..": "..v.." Coins".."\n"
	--	else
	--		s = s..codes_16[i]..": "..v.."\n"
	--	end
	--end

	--s = s.."\nLevel 2\n"
	--for i,v in ipairs(level_2) do
	--	if type(v) == "number" then
	--		s = s..codes_16[i]..": "..v.." Coins".."\n"
	--	else
	--		s = s..codes_16[i]..": "..v.."\n"
	--	end
	--end

	--s = s.."\nLevel 3\n"
	--for i,v in ipairs(level_3) do
	--	if type(v) == "number" then
	--		s = s..codes_16[i]..": "..v.." Coins".."\n"
	--	else
	--		s = s..codes_16[i]..": "..v.."\n"
	--	end
	--end

	--s = s.."\nLevel 4\n"
	--for i,v in ipairs(level_4) do
	--	if type(v) == "number" then
	--		s = s..codes_16[i]..": "..v.." Coins".."\n"
	--	else
	--		s = s..codes_16[i]..": "..v.."\n"
	--	end
	--end

	--s = s.."\nLevel 5\n"
	--for i,v in ipairs(level_5) do
	--	if type(v) == "number" then
	--		s = s..codes_16[i]..": "..v.." Coins".."\n"
	--	else
	--		s = s..codes_16[i]..": "..v.."\n"
	--	end
	--end

	--s = s.."\nLevel 6\n"
	--for i,v in ipairs(level_6) do
	--	if type(v) == "number" then
	--		s = s..codes_16[i]..": "..v.." Coins".."\n"
	--	else
	--		s = s..codes_16[i]..": "..v.."\n"
	--	end
	--end

	--s = s.."\nLevel 7\n"
	--for i,v in ipairs(level_7) do
	--	if i == 7 then

	--	else
		--	if type(v) == "number" then
		--		s = s..codes_7[i]..": "..v.." Coins".."\n"
			--else
			--	s = s..codes_7[i]..": "..v.."\n"
			--end
		--end
	--end

	--spoiler_file:write(s)
	--spoiler_file:close()
end

if type(player_seed) == "string" then
	k = 0
	for i=1,#player_seed do
		k = k + string.byte(string.sub(player_seed,i))
	end
	player_seed = k
end
coins = false

newrandomizer(player_seed, DisableOPCars)
