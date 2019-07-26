# Indicate that the zombie has a trident in storage, so it can swap from its
# currently equipped mainhand item upon drowning
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.Tags append value lectern.undead_players.has_trident

# Append this item to the first Storage box
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.StorageBoots.tag.lectern.undead_players.Storage[0] append from entity @s Item

# Set the slot number to 1
scoreboard players set #slot lec.unpl.rank 1

# Teleport this item to the void (as directly killing it causes console spam)
teleport @s -30000000 -1000 8880
