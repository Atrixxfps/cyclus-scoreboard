if Cyclus.VersionCheck == 'legacy' then
    ESX = exports["es_extended"]:getSharedObject()
elseif Cyclus.VersionCheck == 'old' then
    ESX = nil
elseif Cyclus.VersionCheck == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
end

CreateThread(function()
    if not Cyclus.VersionCheck == 'old' then return end

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

if Cyclus.VersionCheck == 'legacy' or 'old' then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        PlayerData = xPlayer
        ESX.TriggerServerCallback('cyclus-scoreboard:server:getData', function(Cyclus)
            Cyclus.IllegalActions = Cyclus
        end)
    end)
elseif Cyclus.VersionCheck == 'qb' then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
        PlayerData = xPlayer
        QBCore.Functions.TriggerCallback('cyclus-scoreboard:server:getData', function(Cyclus)
            Cyclus.IllegalActions = Cyclus
        end)
    end)
end

if Cyclus.VersionCheck == 'legacy' or 'old' then
    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        PlayerData.job = job
    end)
elseif Cyclus.VersionCheck == 'qb' then
    RegisterNetEvent('QBCore:Client:OnJobUpdate')
    AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
        PlayerData.job = job
    end)
end


function GetCurrentPlayers()
    local TotalPlayers = 0
    for _, player in ipairs(GetActivePlayers()) do
        TotalPlayers = TotalPlayers + 1
    end
    return TotalPlayers
end