class_name DropComponent
extends Node

@export var PossibleDrops: Array[PackedScene]
@export var drop_amount: int



var spawn_range = 10

func drop_item():
	for item in drop_amount:
		var rand_drop = PossibleDrops.pick_random()
		var drop = rand_drop.instantiate()
		call_deferred("fix_drop_spawn", drop)
	
	


func fix_drop_spawn(drop):
	drop.global_position = get_parent().global_position
	
	var direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var distance = randf_range(10.0, 30.0)
	drop.global_position += distance * direction
	get_tree().current_scene.add_child(drop)
	print("aqui no posição ", get_parent().global_position)
	
