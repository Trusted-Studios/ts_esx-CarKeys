-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Debug Logs
-- ════════════════════════════════════════════════════════════════════════════════════ --

local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end
print("^6[SHARED - DEBUG] ^0: "..filename()..".lua started");

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Trusted Development || System
-- ════════════════════════════════════════════════════════════════════════════════════ --

Trusted = {}
Trusted.Debug = true
Trusted.Print = false

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Trusted Development || Config
-- ════════════════════════════════════════════════════════════════════════════════════ --

Config = {}

Config.DefaultLockKey = "i"

Config.LockDistance = 3

Config.Text = {
    ['no_vehicle_nearby'] = "~r~Es befindet sich kein Fahrzeug in der Nähe!",
    ['lock_permission_denied'] = "~r~Du kannst dieses Auto nicht abschließen!",
    ['vehicle_locked'] = "Fahrzeug wurde ~g~erfolgreich~s~ abgeschlossen!",
    ['vehicle_unlocked'] = "Fahrzeug wurde ~g~erfolgreich~s~ aufgeschlossen!"
}