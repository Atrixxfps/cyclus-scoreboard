local scoreboard = false
local police, ambulance, mechanic, firefighter = 0

CreateThread(function()
    while true do
        Wait(0)

        if IsControlJustPressed(0, Cyclus.ControlKey) then
            if not scoreboard then
                TriggerServerEvent("cyclus-scoreboard:server:getInfo")

                local callbackFunction = function(cops)
                    SendNUIMessage({
                        action = 'open',
                        spelers = GetCurrentPlayers(),
                        maxSpelers = Cyclus.MaxPlayers,
                        serverNaam = Cyclus.ServerName,
                        naamBox1 = Cyclus.NameBox1,
                        naamBox2 = Cyclus.NameBox2,
                        naamBox3 = Cyclus.NameBox3,
                        naamBox4 = Cyclus.NameBox4,
                        vereisteWouten = Cyclus.IllegalActions,
                        currentWouten = cops,
                        police = police,
                        ambulance = ambulance,
                        mechanic = mechanic,
                        firefighter = firefighter
                    })
                    scoreboard = true
                end

                if Cyclus.VersionCheck == 'legacy' or Cyclus.VersionCheck == 'old' then
                    ESX.TriggerServerCallback('cyclus-scoreboard:server:getCops', callbackFunction)
                elseif Cyclus.VersionCheck == 'qb' then 
                    QBCore.Functions.TriggerCallback('cyclus-scoreboard:server:getCops', callbackFunction)
                end
            else
                SendNUIMessage({
                    action = 'close',
                })
                scoreboard = false
            end
        end
    end
end)




RegisterNetEvent("cyclus-scoreboard:client:serviceSync", function(polices, ambulances, mechanics, firefighters)
    police = polices
    ambulance = ambulances
    mechanic = mechanics
    firefighter = firefighters
end)

RegisterNetEvent('cyclus-scoreboard:client:getActivity', function(activity, busy)
    Cyclus.IllegalActions[activity].busy = busy
end)