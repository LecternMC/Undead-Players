# Calculate the item's base ranking
scoreboard players operation @s lec.unpl.rank = #category lec.unpl.rank
scoreboard players remove @s lec.unpl.rank 10
scoreboard players operation @s lec.unpl.rank *= $10000 lantern.const

# Apply penalty based on damage
execute store result score #damage lec.unpl.rank run data get entity @s Item.tag.Damage
scoreboard players operation @s lec.unpl.rank -= #damage lec.unpl.rank

# Set item data for this category
tag @s add lectern.undead_players.ranked
tag @s add lectern.undead_players.leggings

# Update the best item tracker for this category, if applicable
execute unless score #best_leggings lec.unpl.rank >= @s lec.unpl.rank run scoreboard players operation #best_leggings lec.unpl.rank = @s lec.unpl.rank
