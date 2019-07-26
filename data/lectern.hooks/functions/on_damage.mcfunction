# Revoke this advancement so it can continue detecting deaths
advancement revoke @s from lectern.hooks:on_damage

# Run the on_death hook if the player died
execute if score @s lec.hook.deaths matches 1 run function lectern.hooks:on_death
