# Process any Undead Players that are converting to drowned
execute as @e[type=minecraft:zombie,tag=lectern.undead_players.undead_player,nbt=!{DrownedConversionTime:-1}] run function lectern.undead_players:drown/progress

# Run this function every 16 ticks
schedule function lectern.undead_players:main 16
