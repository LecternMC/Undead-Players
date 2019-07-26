# If the player had boots, add them to storage
execute unless score #best_boots lec.unpl.rank matches -1 run function lectern.undead_players:reanimate/store/add_boots

# Overwrite the zombie's boots with the storage boots
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.ArmorItems[0] set from block -30000000 0 8880 Book.tag.lectern.undead_players.StorageBoots
