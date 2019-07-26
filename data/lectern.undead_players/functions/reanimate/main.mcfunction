# Determine whether the player was out of air or not
execute store result score #drowned lec.unpl.rank run data get entity @s Air
execute store success score #drowned lec.unpl.rank if score #drowned lec.unpl.rank matches ..0

# Initialize the item rank objective with sentinel values
scoreboard players set #best_trident lec.unpl.rank -1
scoreboard players set #best_mainhand lec.unpl.rank -1
scoreboard players set #best_offhand lec.unpl.rank -1
scoreboard players set #best_boots lec.unpl.rank -1
scoreboard players set #best_leggings lec.unpl.rank -1
scoreboard players set #best_chestplate lec.unpl.rank -1
scoreboard players set #best_helmet lec.unpl.rank -1
scoreboard players set #continue lec.unpl.rank 0

# Create a virtual NBT structure for the Undead Player
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie set value {NoAI:0b,Tags:[lectern.undead_players.undead_player],ArmorItems:[{},{},{},{}],HandItems:[{},{}],PersistenceRequired:1b,CustomNameVisible:1b,CanPickUpLoot:0b,ArmorDropChances:[2.0f,2.0f,2.0f,2.0f],HandDropChances:[2.0f,2.0f],DeathLootTable:"minecraft:empty"}

# Get the player head for the entity for the raw username of the player
loot replace block -30000000 0 8883 container.0 loot lectern.undead_players:player_head

# Store the player name in an attribute modifier, so it can be saved to the
# zombie and retrieved if needed
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.PlayerName set value {UUIDMost:-3972765454162508386L,UUIDLeast:-7460228399849829775L,Amount:0.0d,Operation:0}
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.PlayerName.Name set from block -30000000 0 8883 Items[0].tag.SkullOwner.Name

# Attempt to rank any nearby items that spawned this tick. The items must be in
# one of the possible death positions (varies based on crawling / sneaking)
execute as @e[type=minecraft:item,dx=0,dy=0.32,dz=0,nbt={Age:0s}] run function lectern.undead_players:rank/start

# If any items were ranked successfully, equip the best of them, and stick any
# extra items into virtual shulker boxes
execute if score #continue lec.unpl.rank matches 1 run function lectern.undead_players:reanimate/equip_all

# Summon an Undead Player or Drowned Player, depending on whether the player was
# out of breath when they died
execute if score #drowned lec.unpl.rank matches 0 run function lectern.undead_players:reanimate/spawn
execute if score #drowned lec.unpl.rank matches 1 run function lectern.undead_players:drown/spawn

# Reset data on the item rank objective
scoreboard players reset * lec.unpl.rank

# Clear data from the Lantern lectern
data remove block -30000000 0 8880 Book.tag.lectern.undead_players
