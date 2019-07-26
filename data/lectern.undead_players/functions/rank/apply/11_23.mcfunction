# 11 => Leggings (1)
# 12 => Leggings (2)
# 13 => Leggings (3)
# 14 => Leggings (4)
# 15 => Leggings (5)
execute if score #category lec.unpl.rank matches ..15 run function lectern.undead_players:rank/apply/leggings

# 16 => Chestplate (1)
# 17 => Chestplate (2)
# 18 => Chestplate (3)
# 19 => Chestplate (4)
execute if score #category lec.unpl.rank matches 16..19 run function lectern.undead_players:rank/apply/chestplate

# 20 => Helmet (1)
# 21 => Helmet (2)
# 22 => Helmet (3)
execute if score #category lec.unpl.rank matches 20..22 run function lectern.undead_players:rank/apply/helmet

# 23 => Trident (0)
execute if score #category lec.unpl.rank matches 23 run function lectern.undead_players:rank/apply/trident
