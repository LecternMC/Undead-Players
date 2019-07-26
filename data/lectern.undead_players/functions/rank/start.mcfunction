# Run ranking process if the item is at a valid "death point"
execute positioned ~ ~1.32 ~ if entity @s[distance=..0.00001] run function lectern.undead_players:rank/main
execute positioned ~ ~0.97 ~ if entity @s[distance=..0.00001] run function lectern.undead_players:rank/main
execute positioned ~ ~0.1 ~ if entity @s[distance=..0.00001] run function lectern.undead_players:rank/main
