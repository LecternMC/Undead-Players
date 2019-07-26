# Make sure the zombie does not naturally become a drowned
execute unless score @s lec.unpl.drown matches 1.. run data modify entity @s DrownedConversionTime set value 2147483647

# Increment the drowning progress objective
scoreboard players add @s lec.unpl.drown 1

# After 18 clock cycles, convert the zombie into a drowned
execute if score @s lec.unpl.drown matches 18 at @s run function lectern.undead_players:drown/convert
