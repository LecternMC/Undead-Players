# Reset the score so death is not detected every time player takes damage
scoreboard players reset @s lec.hook.deaths

# Run the function 
function #lectern.hooks:on_death
