# Ensure this function does not run for the item
tag @s add lectern.undead_players.no_expand

# Expand the item if it is marked as a storage item
execute if data entity @s Item.tag.lectern.undead_players.StorageItem positioned as @s run function lectern.undead_players:expand/start
