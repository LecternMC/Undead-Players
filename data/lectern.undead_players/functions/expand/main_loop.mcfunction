# Copy the next virtual storage box to the default shulker box
data modify block -30000000 0 8882 Items set from block -30000000 0 8880 Book.tag.lectern.undead_players.Storage[-1]

# Drop the contents of the shulker box
loot spawn ~ ~ ~ mine -30000000 0 8882 minecraft:air{drop_contents:1b}

# Delete the virtual storage box, as its contents have been dropped
data remove block -30000000 0 8880 Book.tag.lectern.undead_players.Storage[-1]

# Decrement the box count, as a virtual storage box was just deleted
scoreboard players remove #boxes lantern.global 1

# Run this function in a loop until the box count reaches 0
execute unless score #boxes lantern.global matches 0 run function lectern.undead_players:expand/main_loop
