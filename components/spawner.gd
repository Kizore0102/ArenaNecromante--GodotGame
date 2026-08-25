class_name SpawnerComp
extends Node2D

@export var spawner_timer: Timer
@export var round_finish_timer: Timer
@export var difficulty_increase: Timer



#@export var _enemys = load("res://Enemys/skeleton/skeleton.tscn")
var spawn_range = 650
@export var _enemys: Array[PackedScene] = []

var giga_slime = load("res://Enemys/giga_slime/giga_slime.tscn")
var last_giga_slime = load("res://Enemys/last_giga_slime/last_giga_slime.tscn")



func spawned():
	var rand_enemy = _enemys.pick_random()
	
	
	var _mob_spawned = rand_enemy.instantiate()
	#_mob_spawned.position = position #local onde spawna
	var spawn_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var distance = spawn_range
	_mob_spawned.position = get_tree().get_first_node_in_group("player").position + spawn_direction * distance
	get_parent().add_child(_mob_spawned)
	_mob_spawned.add_to_group("enemy")
	





func _on_difficulty_increase_timeout():
	spawner_timer.wait_time -= .033
	if spawner_timer.wait_time < .1:
		spawner_timer.wait_time = .1
	
	print("\n\n-------\nDificulty Increased\nSpawnTimer: ",spawner_timer.wait_time, "\n\n--------\n\n")


func RoundFinishedTimer():
	print("-------------------------\nMatch Winned\n-------------------------")
	LevelManager.enemy_level_manager()
	_enemys.append(giga_slime)


func _on_hud_call_last_boss():
	
	var _mob_spawned = last_giga_slime.instantiate()
	
	
	var spawn_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var distance = spawn_range
	_mob_spawned.position = get_tree().get_first_node_in_group("player").position + spawn_direction * distance
	get_parent().add_child(_mob_spawned)
	_mob_spawned.add_to_group("enemy")
