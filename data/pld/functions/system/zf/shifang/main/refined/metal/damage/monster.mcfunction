#根据实体阵法减伤率降低数据
function #plex:system/zf/shifang/main/damage_remove


#如果怪物血量低于zf_refined_metal_healthstg设定百分比，则伤害提升zf_mp_refined_metal_add
scoreboard players set #temp temp2 100
execute store result score #temp temp run attribute @s generic.max_health get
scoreboard players operation #temp temp *= zf_refined_metal_healthstg percent
scoreboard players operation #temp temp /= 100 int
execute if score #temp temp >= @s monster_health run scoreboard players operation #temp temp2 += zf_mp_refined_metal_add percent

scoreboard players operation #temp damage_middle *= #temp temp2
scoreboard players operation #temp damage_middle /= 100 int

#减伤率降低数据
scoreboard players operation #temp damage_middle *= @s monster_resis
scoreboard players operation #temp damage_middle /= 100 int
scoreboard players operation @s monster_health -= #temp damage_middle

