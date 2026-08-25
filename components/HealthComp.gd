class_name HealthComponent
extends Node




@onready var health_bar = $HealthBar
@export var drop_component: DropComponent




@export var _max_health: float = 100
var _curr_health: float
#@export var exp_amount: float



func _ready():
	#health_bar.value = _max_health
	#print(get_parent().name, " health bar is: ",health_bar)
	#health_bar.max_value = _max_health
	
	health_bar.init_health(_max_health)
	equal_max_health()
	#health_bar.set_health(_max_health)
	
	

func _process(delta):
	head_top_health_bar()
	

func head_top_health_bar():
	health_bar.global_position = get_parent().global_position
	health_bar.position.x -= 33
	health_bar.position.y -= 38
	health_bar.set_health(_curr_health)


func equal_max_health():
	_curr_health = _max_health




func update_health(amount: int):
	_curr_health += amount
	#health_bar.value = _curr_health
	health_bar.set_health(_curr_health)
	
	if _curr_health > 1:
		#print("-------------\n",get_parent().name, " health: ", _curr_health)
		return
	else:
		_curr_health = 0
		die()
	
	#health_bar.max_value = _max_health
	#health_bar.health = _curr_health


func fix_game_over():
	get_tree().change_scene_to_file("res://HUD/game_over.tscn")


func die():
	print(get_parent().name, ": died of cringe")
	if get_parent().is_in_group("player"):
		get_parent().get_node("sprite").modulate = Color(0.686, 0.0, 0.114)
		call_deferred("fix_game_over")
	else:
		if get_parent().is_in_group("final_boss"):
			get_parent().end_game()
			queue_free()
		drop_component.drop_item()
		print(get_parent().name, ": dropei nm negoço ae")
		get_parent().queue_free()
	
