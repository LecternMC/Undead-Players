# Set the item data for this category
scoreboard players set @s lec.unpl.rank 0
tag @s add lectern.undead_players.ranked
tag @s add lectern.undead_players.chestplate

# Update the best item tracker for this category, if applicable
execute unless score #best_chestplate lec.unpl.rank matches 0.. run scoreboard players set #best_chestplate lec.unpl.rank 0
