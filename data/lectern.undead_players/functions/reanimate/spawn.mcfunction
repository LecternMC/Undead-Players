# Summon the Undead Player with minimal data and a unique tag
summon minecraft:zombie ~ ~1 ~ {NoAI:1b,Tags:[lectern.undead_players.new]}

# Copy the Undead Player's custom data to the new zombie
execute as @e[type=minecraft:zombie,dx=0,dy=1,dz=0,tag=lectern.undead_players.new,limit=1] run function lectern.undead_players:reanimate/finish
