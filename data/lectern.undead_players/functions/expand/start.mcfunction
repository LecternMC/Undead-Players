# Retrieve the item's current Y position
execute store result score #y_position lantern.global run data get entity @s Pos[1]

# Teleport this item to the void
teleport @s -30000000 -1000 8880

# If the Y position of the item is at or above Y -64, expand its storage
execute if score #y_position lantern.global matches -64.. run function lectern.undead_players:expand/main

# Reset temporary variable
scoreboard players reset #y_position lantern.global
