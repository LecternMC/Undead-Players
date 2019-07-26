# Every dimension tick, expand any Undead Player storage items
execute if score lectern.undead_players lantern.versions matches 1 as @e[type=minecraft:item,distance=0..,tag=!lectern.undead_players.no_expand] run function lectern.undead_players:expand/check
