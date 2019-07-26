# Treat tridents like normal mainhand items if a Drowned Player is being create
execute if score #drowned lec.unpl.rank matches 1 unless score #best_trident lec.unpl.rank matches -1 run scoreboard players operation #best_mainhand lec.unpl.rank = #best_trident lec.unpl.rank
execute if score #drowned lec.unpl.rank matches 1 run scoreboard players set #best_trident lec.unpl.rank -1

# Mark the best trident item
execute unless score #best_trident lec.unpl.rank matches -1 run scoreboard players operation @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.trident] lec.unpl.rank -= #best_trident lec.unpl.rank
execute unless score #best_trident lec.unpl.rank matches -1 run tag @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.trident,limit=1] add lectern.undead_players.best_trident

# Reset trident ranks for mainhand processing
execute unless score #best_trident lec.unpl.rank matches -1 run scoreboard players set @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.trident] lec.unpl.rank 0

# Equip the best mainhand item
execute unless score #best_mainhand lec.unpl.rank matches -1 run scoreboard players operation @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.mainhand] lec.unpl.rank -= #best_mainhand lec.unpl.rank
execute unless score #best_mainhand lec.unpl.rank matches -1 as @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.mainhand,scores={lec.unpl.rank=0},limit=1] run function lectern.undead_players:reanimate/equip/mainhand

# Equip an offhand item, if one is available
execute unless score #best_offhand lec.unpl.rank matches -1 as @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.offhand,limit=1] run function lectern.undead_players:reanimate/equip/offhand

# Equip the best boots
execute unless score #best_boots lec.unpl.rank matches -1 run scoreboard players operation @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.boots] lec.unpl.rank -= #best_boots lec.unpl.rank
execute unless score #best_boots lec.unpl.rank matches -1 as @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.boots,scores={lec.unpl.rank=0},limit=1] run function lectern.undead_players:reanimate/equip/boots
execute if score #best_boots lec.unpl.rank matches -1 run data modify block -30000000 0 8880 Book.tag.lectern.undead_players.StorageBoots set value {id:"minecraft:rotten_flesh",Count:1b,tag:{lectern:{undead_players:{StorageItem:1b,Storage:[[]]}},display:{Lore:['"The inventory of an Undead"','"Player is stored on this item."','""','"If you wish to recover it,"','"reinstall Lectern Undead Players"','"and drop this item on the ground."']},Enchantments:[{id:"minecraft:infinity",lvl:1s}],HideFlags:1}}

# Equip the best leggings
execute unless score #best_leggings lec.unpl.rank matches -1 run scoreboard players operation @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.leggings] lec.unpl.rank -= #best_leggings lec.unpl.rank
execute unless score #best_leggings lec.unpl.rank matches -1 as @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.leggings,scores={lec.unpl.rank=0},limit=1] run function lectern.undead_players:reanimate/equip/leggings

# Equip the best chestplate
execute unless score #best_chestplate lec.unpl.rank matches -1 run scoreboard players operation @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.chestplate] lec.unpl.rank -= #best_chestplate lec.unpl.rank
execute unless score #best_chestplate lec.unpl.rank matches -1 as @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.chestplate,scores={lec.unpl.rank=0},limit=1] run function lectern.undead_players:reanimate/equip/chestplate

# Equip the best helmet
execute unless score #best_helmet lec.unpl.rank matches -1 run scoreboard players operation @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.helmet] lec.unpl.rank -= #best_helmet lec.unpl.rank
execute unless score #best_helmet lec.unpl.rank matches -1 as @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.helmet,scores={lec.unpl.rank=0},limit=1] run function lectern.undead_players:reanimate/equip/helmet

# Store any remaining items that could not be equipped
scoreboard players set #slot lec.unpl.rank 0
execute unless score #best_trident lec.unpl.rank matches -1 as @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.best_trident] run function lectern.undead_players:reanimate/store/add_trident
execute as @e[type=minecraft:item,dx=0,dy=1,dz=0,tag=lectern.undead_players.ranked] run function lectern.undead_players:reanimate/store/add_item

# If any items were stored, save the stored items to the Undead Player
execute unless score #slot lec.unpl.rank matches 0 run function lectern.undead_players:reanimate/store/finish
