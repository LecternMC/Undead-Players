# Undead Players version 1 (1.0.0)
scoreboard players set lectern.undead_players lantern.versions 1

# Add scoreboard objectives
scoreboard objectives add lec.unpl.rank dummy
scoreboard objectives add lec.unpl.drown dummy

# Initialize constants
scoreboard players set $10000 lantern.const 10000

# Reset the infinite delayer
schedule function lectern.undead_players:delayer 1

# Initialize assigned tick to 0 if not already set in range 0..15
execute unless score undead_players lec.core.tick matches 0..15 run scoreboard players set undead_players lec.core.tick 0

# Calculate the time between the current tick and the assigned tick
scoreboard players operation #schedule_delay lantern.global = undead_players lec.core.tick
scoreboard players operation #schedule_delay lantern.global -= lectern.core.tick lantern.global
scoreboard players operation #schedule_delay lantern.global %= lectern.core.tick_count lantern.const

# Schedule execution of main loop based on the calculated delay + 1
execute if score #schedule_delay lantern.global matches 0 run schedule function lectern.undead_players:main 1
execute if score #schedule_delay lantern.global matches 1 run schedule function lectern.undead_players:main 2
execute if score #schedule_delay lantern.global matches 2 run schedule function lectern.undead_players:main 3
execute if score #schedule_delay lantern.global matches 3 run schedule function lectern.undead_players:main 4
execute if score #schedule_delay lantern.global matches 4 run schedule function lectern.undead_players:main 5
execute if score #schedule_delay lantern.global matches 5 run schedule function lectern.undead_players:main 6
execute if score #schedule_delay lantern.global matches 6 run schedule function lectern.undead_players:main 7
execute if score #schedule_delay lantern.global matches 7 run schedule function lectern.undead_players:main 8
execute if score #schedule_delay lantern.global matches 8 run schedule function lectern.undead_players:main 9
execute if score #schedule_delay lantern.global matches 9 run schedule function lectern.undead_players:main 10
execute if score #schedule_delay lantern.global matches 10 run schedule function lectern.undead_players:main 11
execute if score #schedule_delay lantern.global matches 11 run schedule function lectern.undead_players:main 12
execute if score #schedule_delay lantern.global matches 12 run schedule function lectern.undead_players:main 13
execute if score #schedule_delay lantern.global matches 13 run schedule function lectern.undead_players:main 14
execute if score #schedule_delay lantern.global matches 14 run schedule function lectern.undead_players:main 15
execute if score #schedule_delay lantern.global matches 15 run schedule function lectern.undead_players:main 16

# Reset temporary variable
scoreboard players reset #schedule_delay lantern.global
