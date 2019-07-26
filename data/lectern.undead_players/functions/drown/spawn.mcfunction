# Summon the Drowned Player with minimal data and a unique tag
summon minecraft:drowned ~ ~1 ~ {NoAI:1b,Tags:[lectern.undead_players.new]}

# Copy the Drowned Player's custom data to the new drowned
execute as @e[type=minecraft:drowned,dx=0,dy=1,dz=0,tag=lectern.undead_players.new,limit=1] run function lectern.undead_players:drown/finish
