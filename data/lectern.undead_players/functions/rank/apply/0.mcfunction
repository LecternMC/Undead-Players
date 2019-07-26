# Set the item data for this category
scoreboard players set @s lec.unpl.rank 0
tag @s add lectern.undead_players.ranked
tag @s add lectern.undead_players.mainhand

# Update the best item tracker for this category, if applicable
execute unless score #best_mainhand lec.unpl.rank matches 0.. run scoreboard players set #best_mainhand lec.unpl.rank 0
