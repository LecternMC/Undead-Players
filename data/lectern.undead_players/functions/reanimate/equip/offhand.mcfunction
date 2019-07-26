# Copy this item to the Undead Player's offhand slot
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.HandItems[1] set from entity @s Item

# Teleport this item to the void (as directly killing it causes console spam)
teleport @s -30000000 -1000 8880
