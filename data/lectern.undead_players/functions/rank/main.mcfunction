# Copy the item data to cb-0-0-0-1 so a computational loot table can be used
data modify entity cb-0-0-0-1 HandItems[0] set from entity @s Item

# Get the item's category in scoreboard form
execute as cb-0-0-0-1 store result score #category lec.unpl.rank run loot replace block -30000000 0 8883 container.0 fish lectern.undead_players:item_category -30000000 1 8880 mainhand

# Generate the item's rank tag and score
execute if score #category lec.unpl.rank matches ..10 run function lectern.undead_players:rank/apply/0_10
execute if score #category lec.unpl.rank matches 11.. run function lectern.undead_players:rank/apply/11_23

# Indicate that there are items to process
scoreboard players set #continue lec.unpl.rank 1
