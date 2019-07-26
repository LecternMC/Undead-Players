# If Undead Players is initialized and the current player is in survival or
# adventure, start the process of spawning an Undead Player.
execute if score lectern.undead_players lantern.versions matches 1 if entity @s[gamemode=!creative,gamemode=!spectator] run function lectern.undead_players:reanimate/start
