# Copy the Undead Player's data to the Lantern lectern
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.DrowningZombie set from entity @s {}

# Copy the PlayerName modifier out of the Undead Player's data
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.PlayerName set from block -30000000 0 8880 Book.tag.lectern.undead_players.DrowningZombie.Attributes[{Name:"generic.maxHealth"}].Modifiers[{UUIDMost:-3972765454162508386L,UUIDLeast:-7460228399849829775L}]

# Create a virtual NBT structure for the Drowned Player
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie set value {NoAI:0b,Tags:[lectern.undead_players.undead_player],PersistenceRequired:1b,CustomNameVisible:1b,CanPickUpLoot:0b,ArmorDropChances:[2.0f,2.0f,2.0f,2.0f],HandDropChances:[2.0f,2.0f],DeathLootTable:"minecraft:empty"}

# Copy the Undead Player's armor and tools to the Drowned Player
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.ArmorItems set from block -30000000 0 8880 Book.tag.lectern.undead_players.DrowningZombie.ArmorItems
data modify block -30000000 0 8880 Book.tag.lectern.undead_players.Zombie.HandItems set from block -30000000 0 8880 Book.tag.lectern.undead_players.DrowningZombie.HandItems

# If the Undead Player has a trident, make the Drowned Player equip it
execute if entity @s[tag=lectern.undead_players.has_trident] run function lectern.undead_players:drown/use_trident

# Summon the Drowned Player with minimal data and a unique tag
summon minecraft:drowned ~ ~ ~ {NoAI:1b,Tags:[lectern.undead_players.new]}

# Copy the Drowned Player's custom data to the new drowned
execute as @e[type=minecraft:drowned,dx=0,dy=0,dz=0,tag=lectern.undead_players.new,limit=1] run function lectern.undead_players:drown/finish

# Play the drowning sound effect
playsound minecraft:entity.zombie.converted_to_drowned hostile @a[distance=0..] ~ ~ ~ 2

# Delete the Undead Player
data merge entity @s {DeathTime:19s,Health:0.0f}
teleport @s -30000000 -1000 8880

# Clear data from the Lantern lectern
data remove block -30000000 0 8880 Book.tag.lectern.undead_players
