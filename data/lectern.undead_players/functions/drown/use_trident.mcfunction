# Copy the trident to the Drowned Player's mainhand slot
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.HandItems[0] set from block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.ArmorItems[0].tag.lectern.undead_players.Storage[0][0]

# Move the previous mainhand item to where the trident was
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.ArmorItems[0].tag.lectern.undead_players.Storage[0][0] set from block -30000000 0 8880 Book.tag.lectern.undead_players.DrowningZombie.HandItems[0]
