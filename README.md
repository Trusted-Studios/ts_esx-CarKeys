# esx_GMW-CarKeys

A Simple Script allowing players to lock & unlock their owned vehicles.

![image](https://media.discordapp.net/attachments/981948831367299133/1133027606099394590/basic-carkey.png?width=1246&height=701)

## Configuration

```lua
Config.DefaultLockKey = "i" -- Defines the default lock key (can be changed by the players themselves in the FiveM keybindings settings).

Config.LockDistance = 3 -- Within wich distance the player can lock and unlock cars.

Config.Text = { -- Translation options if needed.
    ['no_vehicle_nearby'] = "~r~Es befindet sich kein Fahrzeug in der Nähe!",
    ['lock_permission_denied'] = "~r~Du kannst dieses Auto nicht abschließen!",
    ['vehicle_locked'] = "Fahrzeug wurde ~g~erfolgreich~s~ abgeschlossen!",
    ['vehicle_unlocked'] = "Fahrzeug wurde ~g~erfolgreich~s~ aufgeschlossen!"
} 
```