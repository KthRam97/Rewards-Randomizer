-- CompletedMissions.lua
CompletedMissions = {}
CompletedMissions.FinishedStoryMissions = 0 -- Finished story missions
CompletedMissions.FinishedTotalMissions = 0 -- Finished total of missions
CompletedMissions.StoryProgress = 0 -- In percent
CompletedMissions.TotalProgress = 0 -- In percent

local isTutorial = true         -- Set this to true if you want 'M0' to count
StoryMissions = 7^2       -- 7 levels * 7 nissions
AllMissions = 7^2 + 7*5   -- 7 levels * 7 missions + 7 levels * 5 bonus missions
if isTutorial == true then
    StoryMissions = StoryMissions + 1
    AllMissions = AllMissions + 1
end

-- Levels
CompletedMissions.Levels = {}
local levels = CompletedMissions.Levels
-- Will have every level set to true upon completion.
-- 'Completed' is to check if the game (all levels) is completed (Missions only)
levels['1'] = false
levels['2'] = false
levels['3'] = false
levels['4'] = false
levels['5'] = false
levels['6'] = false
levels['7'] = false
levels['Completed'] = false

CompletedMissions.Missions = {
    ['1'] = {
        ['M0'] = false, -- Only for level 1
        ['M1'] = false, ['M2'] = false, ['M3'] = false, ['M4'] = false, ['M5'] = false, ['M6'] = false, ['M7'] = false,
        ['BM'] = false, ['WG'] = false, ['SR1'] = false, ['SR2'] = false, ['SR3'] = false,
    },
    ['2'] = {
        ['M1'] = false, ['M2'] = false, ['M3'] = false, ['M4'] = false, ['M5'] = false, ['M6'] = false, ['M7'] = false,
        ['BM'] = false, ['WG'] = false, ['SR1'] = false, ['SR2'] = false, ['SR3'] = false,
    },
    ['3'] = {
        ['M1'] = false, ['M2'] = false, ['M3'] = false, ['M4'] = false, ['M5'] = false, ['M6'] = false, ['M7'] = false,
        ['BM'] = false, ['WG'] = false, ['SR1'] = false, ['SR2'] = false, ['SR3'] = false,
    },
    ['4'] = {
        ['M1'] = false, ['M2'] = false, ['M3'] = false, ['M4'] = false, ['M5'] = false, ['M6'] = false, ['M7'] = false,
        ['BM'] = false, ['WG'] = false, ['SR1'] = false, ['SR2'] = false, ['SR3'] = false,
    },
    ['5'] = {
        ['M1'] = false, ['M2'] = false, ['M3'] = false, ['M4'] = false, ['M5'] = false, ['M6'] = false, ['M7'] = false,
        ['BM'] = false, ['WG'] = false, ['SR1'] = false, ['SR2'] = false, ['SR3'] = false,
    },
    ['6'] = {
        ['M1'] = false, ['M2'] = false, ['M3'] = false, ['M4'] = false, ['M5'] = false, ['M6'] = false, ['M7'] = false,
        ['BM'] = false, ['WG'] = false, ['SR1'] = false, ['SR2'] = false, ['SR3'] = false,
    },
    ['7'] = {
        ['M1'] = false, ['M2'] = false, ['M3'] = false, ['M4'] = false, ['M5'] = false, ['M6'] = false, ['M7'] = false,
        ['BM'] = false, ['WG'] = false, ['SR1'] = false, ['SR2'] = false, ['SR3'] = false,
    },
}

missions = CompletedMissions.Missions

CompletedMissions.ToggleMissionComplete = function(level, mission)
    level = tostring(level)
  -- Checking if mission has been completed before
    if missions[level][mission] == false then
        missions[level][mission] = true
        CompletedMissions.FinishedTotalMissions = CompletedMissions.FinishedTotalMissions + 1
        if mission ~= 'BM' and mission ~= 'WG' and not string.find(mission, 'SR') and mission ~= 'M0' then
            CompletedMissions.FinishedStoryMissions = CompletedMissions.FinishedStoryMissions + 1
       end
    end
    if missions['1']['M0'] and isTutorial == true then
        print('Tutorial Completed')
        CompletedMissions.FinishedStoryMissions = CompletedMissions.FinishedStoryMissions + 1
    -- Add anything here
    end

    -- Calculate progress (should be done after every mission)
    CompletedMissions.StoryProgress = (CompletedMissions.FinishedStoryMissions*100)/StoryMissions
    CompletedMissions.TotalProgress = (CompletedMissions.FinishedTotalMissions*100)/AllMissions
end

CompletedMissions.IsLevelComplete = function(level)
    level = tostring(level)
    local completed = 0
    local isLevelCompleted = false
    for _, mission in pairs(missions[level]) do
        if mission == true then
            completed = completed + 1
        end
    end
    if isTutorial then
        if level == tostring(1) and completed == 8 then
            isLevelCompleted = true
        elseif level ~= 1 and completed == 7 then
            isLevelCompleted = true
        end
    else
        if completed == 7 then
            isLevelCompleted = true
        end
    end
    return isLevelCompeted
end

print(CompletedMissions.StoryMissions)

return CompletedMissions
