# Add the player name attribute modifier to the drowned
data modify entity @s Attributes[{Name:"generic.maxHealth"}].Modifiers append from block -30000000 0 8880 Book.tag.lectern.undead_players.PlayerName

# Create the Drowned Player's custom name ("Drowned [PlayerName]")
data modify block -30000000 0 8881 Text1 set value '{"text":"Drowned ","extra":[{"nbt":"Book.tag.lectern.undead_players.PlayerName.Name","block":"-30000000 0 8880"}]}'
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.CustomName set from block -30000000 0 8881 Text1

# Copy the rest of the Drowned Player data to the drowned
data modify entity @s {} merge from block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie
