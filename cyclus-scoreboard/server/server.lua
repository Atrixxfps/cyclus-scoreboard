if Cyclus.VersionCheck == 'legacy' then
    ESX = exports["es_extended"]:getSharedObject()
elseif Cyclus.VersionCheck == 'old' then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Cyclus.VersionCheck == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterNetEvent("cyclus-scoreboard:server:getInfo", function()
    if Cyclus.VersionCheck == 'legacy' or 'old' then
        getPlayers = ESX.GetPlayers()
    elseif Cyclus.VersionCheck == 'qb' then 
        getPlayers = QBCore.Functions.GetPlayers
    end

    local police = 0
    local ambulance = 0
    local mechanic = 0
    local firefighter = 0

    for i=1, #getPlayers, 1 do 
        if Cyclus.VersionCheck == 'legacy' or 'old' then
            getJob = ESX.GetPlayerFromId(getPlayers[i]).job.name
        elseif Cyclus.VersionCheck == 'qb' then 
            getJob = QBCore.Functions.GetPlayer(getPlayers[i]).job.name
        end

        if getJob == "police" then
            police = police+1
        end
        if getJob == "ambulance" then
            ambulance = ambulance+1
        end
        if getJob == "mechanic" then
            mechanic = mechanic+1
        end
        if getJob == "brandweer" then
            firefighter = firefighter+1
        end
    end
    TriggerClientEvent("cyclus-scoreboard:client:serviceSync", -1, police, ambulance, mechanic, firefighter)
    if Cyclus.Debug then print("[DEV] cyclus-scoreboard:updated") end
end)

if Cyclus.VersionCheck == 'legacy' or 'old' then
    ESX.RegisterServerCallback('cyclus-scoreboard:server:getCops', function(source, cb)
        local xPlayers = ESX.GetPlayers()   
        local police = 0 

        for i=1, #xPlayers, 1 do
            local job = ESX.GetPlayerFromId(xPlayers[i]).job.name
            if job == Cyclus.PoliceJob then
                police = police + 1
            end
        end
        cb(police)
    end)

    ESX.RegisterServerCallback('cyclus-scoreboard:server:getData', function(source, cb)
        cb(Cyclus.IllegalActions)
    end)
elseif Cyclus.VersionCheck == 'qb' then 
    QBCore.Functions.CreateCallback('cyclus-scoreboard:server:getCops', function(source, cb)
        local xPlayers = QBCore.Functions.GetPlayers  
        local police = 0 

        for i=1, #xPlayers, 1 do
            local job = QBCore.Functions.GetPlayer(xPlayers[i]).job.name
            if job == Cyclus.PoliceJob then
                police = police + 1
            end
        end
        cb(police)
    end)

    QBCore.Functions.CreateCallback('cyclus-scoreboard:server:getData', function(source, cb)
        cb(Cyclus.IllegalActions)
    end)
end

RegisterServerEvent('cyclus-scoreboard:server:getActivity', function(activity, bool)
    Cyclus.IllegalActions[activity].busy = bool
    TriggerClientEvent('cyclus-scoreboard:client:getActivity', -1, activity, bool)
end)