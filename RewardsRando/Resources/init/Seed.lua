print("Setting seed...")
local startTime = GetTime()
CustomRestrictions = {
	{false, false, false, false, false, false, false}, -- Level 1
	{false, false, false, false, false, false, false}, -- Level 2
	{false, false, false, false, false, false, false}, -- Level 3
	{false, false, false, false, false, false, false}, -- Level 4
	{false, false, false, false, false, false, false}, -- Level 5
	{false, false, false, false, false, false, false}, -- Level 6
	{false, false, false, false, false, false, false} -- Level 7
}

Level=1
if Settings.CustomL1 and not Settings.RandomRestrictions then
	if not(Settings.L1M1 == "") then
		Mission=1
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L1M1:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L1M2 == "") then
		Mission=2
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L1M2:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L1M3 == "") then
		Mission=3
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L1M3:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L1M4 == "") then
		Mission=4
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L1M4:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L1M5 == "") then
		Mission=5
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L1M5:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L1M6 == "") then
		Mission=6
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L1M6:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L1M7 == "") then
		Mission=7
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L1M7:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

elseif not Settings.RandomRestrictions then
	Mission=3
	Restriction = "plowk_v"
	name = RewardNames[Restriction]
	CustomRestrictions[Level][Mission] = {{Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}}
end

Level=2
if Settings.CustomL2 and not Settings.RandomRestrictions then
	if not(Settings.L2M1 == "") then
		Mission=1
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L2M1:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L2M2 == "") then
		Mission=2
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L2M2:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L2M3 == "") then
		Mission=3
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L2M3:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L2M4 == "") then
		Mission=4
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L2M4:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L2M5 == "") then
		Mission=5
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L2M5:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L2M6 == "") then
		Mission=6
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L2M6:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L2M7 == "") then
		Mission=7
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L2M7:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

elseif not Settings.RandomRestrictions then
	Mission=6
	Restriction = "mrplo_v"
	name = RewardNames[Restriction]
	CustomRestrictions[Level][Mission] = {{Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}}
end


Level=3
if Settings.CustomL3 and not Settings.RandomRestrictions then
	if not(Settings.L3M1 == "") then
		Mission=1
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L3M1:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L3M2 == "") then
		Mission=2
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L3M2:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L3M3 == "") then
		Mission=3
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L3M3:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L3M4 == "") then
		Mission=4
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L3M4:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L3M5 == "") then
		Mission=5
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L3M5:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L3M6 == "") then
		Mission=6
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L3M6:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L3M7 == "") then
		Mission=7
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L3M7:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

elseif not Settings.RandomRestrictions then
	Mission=4
	Restriction = "otto_v"
	name = RewardNames[Restriction]
	CustomRestrictions[Level][Mission] = {{Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}}

	Mission=5
	Restriction = "l_cool"
	name = RewardNames[Restriction]
	CustomRestrictions[Level][Mission] = {{Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}}

end


Level=4
if Settings.CustomL4 and not Settings.RandomRestrictions then
	if not(Settings.L4M1 == "") then
		Mission=1
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L4M1:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L4M2 == "") then
		Mission=2
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L4M2:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L4M3 == "") then
		Mission=3
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L4M3:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L4M4 == "") then
		Mission=4
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L4M4:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L4M5 == "") then
		Mission=5
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L4M5:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L4M6 == "") then
		Mission=6
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L4M6:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L4M7 == "") then
		Mission=7
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L4M7:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

elseif not Settings.RandomRestrictions then
	Mission=3
	Restriction = "m_prison"
	name = RewardNames[Restriction]
	CustomRestrictions[Level][Mission] = {{Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}}

	Mission=6
	Restriction = "m_police"
	name = RewardNames[Restriction]
	CustomRestrictions[Level][Mission] = {{Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}}

end

Level=5
if Settings.CustomL5 and not Settings.RandomRestrictions then
	if not(Settings.L5M1 == "") then
		Mission=1
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L5M1:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L5M2 == "") then
		Mission=2
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L5M2:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L5M3 == "") then
		Mission=3
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L5M3:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L5M4 == "") then
		Mission=4
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L5M4:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L5M5 == "") then
		Mission=5
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L5M5:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L5M6 == "") then
		Mission=6
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L5M6:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L5M7 == "") then
		Mission=7
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L5M7:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

elseif not Settings.RandomRestrictions then
	Mission=3
	Restriction = "carhom_v"
	name = RewardNames[Restriction]
	CustomRestrictions[Level][Mission] = {{Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}}

	Mission=4
	Restriction = "a_american"
	name = RewardNames[Restriction]
	CustomRestrictions[Level][Mission] = {{Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}}

end

Level=6
if Settings.CustomL6 and not Settings.RandomRestrictions then
	if not(Settings.L6M1 == "") then
		Mission=1
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L6M1:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L6M2 == "") then
		Mission=2
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L6M2:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L6M3 == "") then
		Mission=3
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L6M3:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L6M4 == "") then
		Mission=4
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L6M4:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L6M5 == "") then
		Mission=5
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L6M5:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L6M6 == "") then
		Mission=6
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L6M6:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L6M7 == "") then
		Mission=7
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L6M7:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

elseif not Settings.RandomRestrictions then
	Mission=6
	Restriction = "scorp_v"
	name = RewardNames[Restriction]
	CustomRestrictions[Level][Mission] = {{Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}}
end

Level=7
if Settings.CustomL7 and not Settings.RandomRestrictions then
	if not(Settings.L7M1 == "") then
		Mission=1
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L7M1:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L7M2 == "") then
		Mission=2
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L7M2:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L7M3 == "") then
		Mission=3
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L7M3:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L7M4 == "") then
		Mission=4
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L7M4:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L7M5 == "") then
		Mission=5
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L7M5:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L7M6 == "") then
		Mission=6
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L7M6:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

	if not(Settings.L7M7 == "") then
		Mission=7
		CustomRestrictions[Level][Mission] = {}

		for Restriction in Settings.L7M7:gmatch("[^,]+") do
			name = RewardNames[Restriction]
			CustomRestrictions[Level][Mission][#CustomRestrictions[Level][Mission] + 1] = {Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}
		end
	end

elseif not Settings.RandomRestrictions then
	Mission=2
	Restriction = "zombi_v"
	name = RewardNames[Restriction]
	CustomRestrictions[Level][Mission] = {{Restriction, "You need "..name.." to continue!\nPurchase "..name.. " if you've unlocked it. Otherwise track it down in other missions.\nOwnership of "..name.." must be shown to the Rewards Rando gods!"}}

	Mission=7
	CustomRestrictions[Level][Mission] = {{"h_donut","You need to make a deal with the devil. Purchase Homer's DONUT HOMER at a clothing Shop if you've unlocked it. Otherwise track down Devil Flanders in other missions.\nYou must show your Proof of Gluttony to continue!"}, {"h_evil","You need to descend into hell! Purchase Homer's EVIL HOMER at a Clothing Shop if you've unlocked it. Otherwise head out and commit some sins in other missions.\nYou must show your Proof of Hell to continue!"}, {"h_scuzzy","You need to look Scuzzy. Purchase Homer's DIRTY HOMER at a Clothing Shop if you've unlocked it. Otherwise Scuzz it up in other missions.\nYou must show your Proof of Scuzzy to continue!"}}
end

CustomRestrictionsIdx = {}
Restrictions = {}
for Level=1,7 do
	Restrictions[Level] = {}
	for Mission=1,7 do
		local MissionRestrictions = {}
		if CustomRestrictions[Level][Mission] then
			if type(CustomRestrictions[Level][Mission][1]) == "table" then
				for i=1,#CustomRestrictions[Level][Mission] do
					MissionRestrictions[#MissionRestrictions + 1] = CustomRestrictions[Level][Mission][i][1]
				end
			else
				MissionRestrictions[1] = CustomRestrictions[Level][Mission][1]
			end
		elseif not(Settings.RandomRestrictions) and ((Level == 1 and not(Settings.CustomL1)) or (Level == 2 and not(Settings.CustomL2)) or (Level == 3 and not(Settings.CustomL3)) or (Level == 4 and not(Settings.CustomL4)) or (Level == 5 and not(Settings.CustomL5)) or (Level == 6 and not(Settings.CustomL6)) or (Level == 7 and not(Settings.CustomL7))) then
			local MFKFile = ReadFile("/GameData/scripts/missions/level0"..Level.."/m"..Mission.."sdi.mfk")
			local MFK = MFKLexer.Lexer:Parse(MFKFile)
			for i=1,#MFK.Functions do
				local func = MFK.Functions[i]
				if func.Name:lower() == "addobjective" and (func.Arguments[1] == "buycar" or func.Arguments[1] == "buyskin") then
					MissionRestrictions[#MissionRestrictions + 1] = func.Arguments[2]
				end
			end
		end
		Restrictions[Level][Mission] = MissionRestrictions
	end
end

local InvalidCount = Seed.Generate()

local endTime = GetTime()
print("Seeding configured after " .. InvalidCount .. " attempts in " .. (endTime - startTime) * 1000 .. "ms.")
