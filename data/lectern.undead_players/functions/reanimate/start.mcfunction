# Retrieve the current difficulty
execute store result score #difficulty lantern.global run difficulty

# Retrieve the current Y position
execute store result score #y_position lantern.global run data get entity @s Pos[1]

# If the difficulty is greater than Peaceful, and the player died above Y -64,
# spawn the Undead Player.
execute unless score #difficulty lantern.global matches 0 if score #y_position lantern.global matches -64.. run function lectern.undead_players:reanimate/main

# Reset temporary variables
scoreboard players reset #difficulty lantern.global
scoreboard players reset #y_position lantern.global
