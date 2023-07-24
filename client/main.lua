---@diagnostic disable: trailing-space
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
    print("^6[CLIENT - DEBUG] ^0: "..filename()..".lua gestartet");
end

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

Carkeys = {}

RegisterKeyMapping('Trusted:CarKeys:LockVehicle', 'Lock Personal Vehicle', 'keyboard', Config.DefaultLockKey)

RegisterCommand('Trusted:CarKeys:LockVehicle', function()
    local ped <const> = PlayerPedId()

    if IsPedSittingInAnyVehicle(ped) then 
        return
    end

    local vehicle, distance = ESX.Game.GetClosestVehicle()

    if not vehicle or distance > Config.LockDistance then 
        Visual.Notify(Config.Text['no_vehicle_nearby'])
        return
    end

    local isOwner <const> = Async.Await(function(promise)
        ESX.TriggerServerCallback("Trusted:CarKeys:IsVehicleOwner", function(isOwner) 
            promise:resolve(isOwner)
        end, GetVehicleNumberPlateText(vehicle))
    end)

    if not isOwner then 
        Visual.Notify(Config.Text['lock_permission_denied'])
        return 
    end

    Carkeys:PlayAnimation(ped, vehicle, GetVehicleDoorLockStatus(vehicle) ~= 2)
end, false)

function Carkeys:PlayAnimation(ped, vehicle, lock)
    local dict = "anim@mp_player_intmenu@key_fob@"
    local name = "fob_click_fp"

    RequestAnimDict(dict)
    repeat Wait(0) until HasAnimDictLoaded(dict)
    TaskPlayAnim(ped, dict, name, 8.0, 8.0, 800, 48, 1, false, false, false)
    
    SetVehicleDoorsLocked(vehicle, lock and 2 or 1 )
    PlayVehicleDoorCloseSound(vehicle, 1)

    for i = 1, 4, 1 do 
        SetVehicleLights(vehicle, (i % 2 == 0) and 0 or 2)
        Wait(150)
    end

    Visual.Notify(lock and Config.Text['vehicle_locked'] or Config.Text['vehicle_unlocked'])
end 
