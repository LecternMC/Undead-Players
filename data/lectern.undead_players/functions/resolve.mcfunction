# Check dependencies and then initialize Undead Players version 1 (1.0.0)
execute if score lectern.core lantern.versions matches 1 run function lectern.undead_players:initialize

# If Undead Players failed to initialize, run the infinite delayer
execute unless score lectern.undead_players lantern.versions matches 1 run function lectern.undead_players:delayer
