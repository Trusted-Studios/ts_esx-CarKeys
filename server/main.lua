---@diagnostic disable: undefined-global
-- ════════════════════════════════════════════════════════════════════════════════════ --
-- ESX Shared 
-- ════════════════════════════════════════════════════════════════════════════════════ --

ESX = exports["es_extended"]:getSharedObject()

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Trusted Development || Debug-print
-- ════════════════════════════════════════════════════════════════════════════════════ --

if Trusted.Debug then
    local filename = function()
        local str = debug.getinfo(2, "S").source:sub(2)
        return str:match("^.*/(.*).lua$") or str
    end
    print("^6[SERVER - DEBUG] ^0: "..filename()..".lua gestartet");
end

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

ESX.RegisterServerCallback('Trusted:CarKeys:IsVehicleOwner', function(source, isOwner, plate)
    local vehicle = MySQL.single.await("SELECT * FROM owned_vehicles WHERE plate = :plate AND owner = :owner", {
        plate = plate,
        owner = ESX.GetPlayerFromId(source).getIdentifier()
    })

    if Trusted.Debug then 
        print(plate, vehicle, json.encode(vehicle or ""))
    end

    isOwner(vehicle and true or false)
end)