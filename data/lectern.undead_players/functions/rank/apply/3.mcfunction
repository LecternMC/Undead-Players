# Set the item data for this category
scoreboard players set @s lec.unpl.rank 0
tag @s add lectern.undead_players.ranked
tag @s add lectern.undead_players.helmet

# Update the best item tracker for this category, if applicable
execute unless score #best_helmet lec.unpl.rank matches 0.. run scoreboard players set #best_helmet lec.unpl.rank 0
