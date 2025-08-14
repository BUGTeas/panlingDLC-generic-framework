#获取血量
execute store result score @s monster_health run data get entity @s Health
#获取怪物抗性
scoreboard players set @s monster_resis -1
execute store result score @s monster_resis run data get entity @s ActiveEffects[{Id:11}].Amplifier
scoreboard players add @s monster_resis 1
scoreboard players set @s[scores={monster_resis=6..}] monster_resis 5

scoreboard players operation @s monster_resis *= 20 int
scoreboard players set @s damage_middle 100
scoreboard players operation @s damage_middle -= @s monster_resis
scoreboard players operation @s monster_resis = @s damage_middle

#根据实体阵法减伤率再次降低数据
scoreboard players operation @s[tag=in30_boss4] monster_resis *= 20 int
scoreboard players operation @s[tag=in30_boss4] monster_resis /= 100 int

scoreboard players operation @s[tag=fk20] monster_resis *= #system 80
scoreboard players operation @s[tag=fk20] monster_resis /= 100 int

scoreboard players operation @s[tag=fk40] monster_resis *= #system 60
scoreboard players operation @s[tag=fk40] monster_resis /= 100 int

scoreboard players operation @s[tag=fk60] monster_resis *= #system 40
scoreboard players operation @s[tag=fk60] monster_resis /= 100 int

scoreboard players operation @s[tag=fk80] monster_resis *= #system 20
scoreboard players operation @s[tag=fk80] monster_resis /= 100 int

scoreboard players set @s[tag=fk100] monster_resis 0