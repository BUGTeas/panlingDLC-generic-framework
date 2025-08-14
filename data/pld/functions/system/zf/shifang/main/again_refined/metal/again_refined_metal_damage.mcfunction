# @s 施法者

#根据实体阵法减伤率降低数据
execute as @e[tag=metaltag] run function #plex:system/zf/shifang/main/damage_remove

#扣血
scoreboard players set @e[tag=metaltag] damage_middle 0
scoreboard players operation @e[tag=metaltag] damage_middle += @s zf_str
scoreboard players operation @e[tag=metaltag] damage_middle *= zf_mp_again_refined_metal percent
scoreboard players operation @e[tag=metaltag] damage_middle /= 100 int
execute as @e[tag=metaltag] run scoreboard players operation @s damage_middle *= @s monster_resis
scoreboard players operation @e[tag=metaltag] damage_middle /= 100 int
execute as @e[tag=metaltag] run scoreboard players operation @s monster_health -= @s damage_middle
#仇恨
function pld:system/zf/shifang/threat/main

#如果击杀了，掉落物
tag @s add the_killer
execute as @e[tag=metaltag] at @s if score @s monster_health matches ..0 run function pld:system/zf/shifang/loot
tag @s remove the_killer
execute as @e[tag=metaltag] at @s if score @s monster_health matches ..0 run tag @s add death_count
function pld:system/zf/shifang/killcount/main

#命中效果
effect give @e[tag=metaltag] instant_damage 1 31 false
effect give @e[tag=metaltag] instant_health 1 31 false
#血量覆盖
execute as @e[tag=metaltag] at @s if score @s monster_health matches ..0 run scoreboard players reset @s
execute as @e[tag=metaltag] store result entity @s Health double 1 run scoreboard players get @s monster_health

scoreboard players set @s zfsuccess 1