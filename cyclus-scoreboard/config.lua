Cyclus = {}

-- Framework settings
Cyclus.VersionCheck = 'legacy' -- 'legacy' ESX Legacy (1.9.0 or +)  |  'old' ESX outdated (1.7.5 or -)  |  'qb' QB-verions

-- Developer settings
Cyclus.MaxPlayers = GetConvarInt('sv_maxclients', 64) -- Max players in your server (default: 64)
Cyclus.Debug = false -- Enables prints in the script, shares important information  [true = on, false = off]


-- UI settings
Cyclus.ServerName = 'Cyclus Scripts' -- Name that is displayed in the header of the scorboard
Cyclus.NameBox1 = 'Winkel Overval' -- Text for namebox-1 displayed in the scoreboard
Cyclus.NameBox2 = 'Juwelier Overval' -- Text for namebox-2 displayed in the scoreboard
Cyclus.NameBox3 = 'Bank Overval' -- Text for namebox-3 displayed in the scoreboard
Cyclus.NameBox4 = 'Humane Labs' -- Text for namebox-4 displayed in the scoreboard

-- Scoreboard settings
Cyclus.ControlKey = 212 -- Control to open the scoreboard (https://docs.fivem.net/docs/game-references/controls/)
Cyclus.PoliceJob = 'police' -- Police-job name

Cyclus.IllegalActions = {
    ["store-robbery"] = {
        minimum = 1, -- Minimum amount of cops to show green on scoreboard
        busy = false, -- State: TriggerEvent("cyclus-scoreboard:client:getActivity", "store-robbery", true/false)
    },
    ["bank-robbery"] = {
        minimum = 2, -- Minimum amount of cops to show green on scoreboard
        busy = false, -- State: TriggerEvent("cyclus-scoreboard:client:getActivity", "bank-robbery", true/false)
    },
    ["jewelry-robbery"] = {
        minimum = 6, -- Minimum amount of cops to show green on scoreboard
        busy = false, -- State: TriggerEvent("cyclus-scoreboard:client:getActivity", "jewelry-robbery", true/false)
    },
    ["human-heist"] = {
        minimum = 8, -- Minimum amount of cops to show green on scoreboard
        busy = false, -- State: TriggerEvent("cyclus-scoreboard:client:getActivity", "human-heist", true/false)
    },
}



-- RegisterCommand("scoreboard-test", function()
--     TriggerServerEvent("cyclus-scoreboard:server:getActivity", "store-robbery", true)
--     Citizen.Wait(5000)
--     TriggerServerEvent("cyclus-scoreboard:server:getActivity", "store-robbery", false)
-- end)