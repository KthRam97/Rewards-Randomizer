if IsModEnabled("NoAudio") and not IsHackLoaded("NoAudio") then
	Alert("Unfortunately, some of the logic in this randomiser requires audio to be loaded.\nYou have the \"No Audio\" mod loaded, which renders this impossible.\nThe game will now exit.")
	os.exit()
end
if not IsHackLoaded("Console") then
	if not Confirm("This mod uses the console to print unlocked rewards, and other useful information.\nIf you want to continue with the console disabled, click OK. Otherwise, click Cancel to close the game.") then
		os.exit()
	end
else
	local ConsoleSettings = GetSettings("Console")
	if not ConsoleSettings.Console then
		if not Confirm("You have the Console hack enabled, but have it disable in the Console's Mod Settings.\nIf you want to continue with the console disabled, click OK. Otherwise, click Cancel to close the game.") then
			os.exit()
		end
	elseif not ConsoleSettings.IncludeMods then
		if not Confirm("You have the Console hack enabled, but do not have Mods checked in the Console's Mod Settings Include section.\nIf you want to continue with the console disabled, click OK. Otherwise, click Cancel to close the game.") then
			os.exit()
		end
	elseif not ConsoleSettings.Logging then
		if not Confirm("You have the Console hack enabled, but do not have Logging enabled in the Console's Mod Settings.\nLogging is required for the tracker to function.\nIf you want to continue with the logging disabled, click OK. Otherwise, click Cancel to close the game.") then
			os.exit()
		end
	end
end

ModName = GetModName()
ModTitle = GetModTitle()
ModVersion = GetModVersion()
Settings = GetSettings()

print(ModTitle .. " v" .. ModVersion .. ": Initialising...")

Paths = {}
Paths.ModPath = GetModPath()
Paths.Resources = Paths.ModPath .. "/Resources/"
Paths.Lib = Paths.Resources .. "lib/"
Paths.Init = Paths.Resources .. "init/"
dofile(Paths.Lib .. "Utils.lua")
dofile(Paths.Lib .. "MFKLexer.lua")
dofile(Paths.Lib .. "P3D.lua")
dofile(Paths.Lib .. "RMS.lua")
dofile(Paths.Lib .. "Seed.lua")
dofile(Paths.Lib .. "sha1.lua")

dofile(Paths.Init .. "Init.lua")
dofile(Paths.Init .. "Rewards.lua")
dofile(Paths.Init .. "Locators.lua")
dofile(Paths.Init .. "Seed.lua")