# If the slot number is 27, create a new box and reset the slot number to 0
execute if score #slot lec.unpl.rank matches 27 run function lectern.undead_players:reanimate/store/next_box

# Append the original boots to the newest Storage box
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.StorageBoots.tag.lectern.undead_players.Storage[-1] append from block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.ArmorItems[0]

# Store the correct slot number for the original boots
execute store result block -30000000 0 8880 Book.tag.lectern.undead_players.StorageBoots.tag.lectern.undead_players.Storage[-1][-1].Slot byte 1 run scoreboard players get #slot lec.unpl.rank
