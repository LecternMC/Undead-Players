# Set the item's base rankking
scoreboard players set @s lec.unpl.rank 50000

# Apply penalty based on damage
execute store result score #damage lec.unpl.rank run data get entity @s Item.tag.Damage
scoreboard players operation @s lec.unpl.rank -= #damage lec.unpl.rank

# Set item data for this category
tag @s add lectern.undead_players.ranked
tag @s add lectern.undead_players.trident
tag @s add lectern.undead_players.mainhand

# Update the best item trackers for this category, if applicable
execute unless score #best_trident lec.unpl.rank >= @s lec.unpl.rank run scoreboard players operation #best_trident lec.unpl.rank = @s lec.unpl.rank
execute unless score #best_mainhand lec.unpl.rank matches 0.. run scoreboard players set #best_mainhand lec.unpl.rank 0
