# Copy the storage data from this item to the Lantern lectern
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Storage set from entity @s Item.tag.lectern.undead_players.Storage

# Get the number of virtual storage boxes
execute store result score #boxes lantern.global run data get block -30000000 0 8880 Book.tag.lectern.undead_players.Storage

# Expand the contents of each virtual storage box
function lectern.undead_players:expand/main_loop

# Clear data from the Lantern lectern
data remove block -30000000 0 8880 Book.tag.lectern.undead_players

# Reset temporary variable
scoreboard players reset #boxes lantern.global
