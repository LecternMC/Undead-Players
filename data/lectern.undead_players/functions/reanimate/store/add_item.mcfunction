# If the slot number is 27, create a new box and reset the slot number to 0
execute if score #slot lec.unpl.rank matches 27 run function lectern.undead_players:reanimate/store/next_box

# Append this item to the newest Storage box
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.StorageBoots.tag.lectern.undead_players.Storage[-1] append from entity @s Item

# Store the correct slot number for this item
execute store result block -30000000 0 8880 Book.tag.lectern.undead_players.StorageBoots.tag.lectern.undead_players.Storage[-1][-1].Slot byte 1 run scoreboard players get #slot lec.unpl.rank

# Increment the slot number
scoreboard players add #slot lec.unpl.rank 1

# Teleport this item to the void (as directly killing it causes console spam)
teleport @s -30000000 -1000 8880
