# 0 => Mainhand (0)
execute if score #category lec.unpl.rank matches 0 run function lectern.undead_players:rank/apply/0

# 1 => Offhand (0)
# 2 => Chestplate (0)
# 3 => Helmet (0)
execute if score #category lec.unpl.rank matches 1..3 run function lectern.undead_players:rank/apply/1_3

# 4 => Mainhand (1)
# 5 => Mainhand (2)
# 6 => Mainhand (3)
# 7 => Mainhand (4)
execute if score #category lec.unpl.rank matches 4..7 run function lectern.undead_players:rank/apply/mainhand

# 8 => Boots (1)
# 9 => Boots (2)
# 10 => Boots (3)
execute if score #category lec.unpl.rank matches 8.. run function lectern.undead_players:rank/apply/boots
