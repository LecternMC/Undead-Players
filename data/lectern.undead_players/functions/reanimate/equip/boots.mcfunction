# Copy this item to the Undead Player's boots slot
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.ArmorItems[0] set from entity @s Item

# Prepare for these boots to be used for data storage
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.StorageBoots set from block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.ArmorItems[0]
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.StorageBoots.tag merge value {lectern:{undead_players:{StorageItem:1b,Storage:[[]]}},display:{Lore:['"The inventory of an Undead"','"Player is stored on this item."','""','"If you wish to recover it,"','"reinstall Lectern Undead Players"','"and drop this item on the ground."']}}

# Teleport this item to the void (as directly killing it causes console spam)
teleport @s -30000000 -1000 8880
