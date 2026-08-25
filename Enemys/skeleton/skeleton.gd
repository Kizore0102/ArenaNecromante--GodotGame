extends CharacterBody2D

var _target
@export var min_spd = 100
@export var max_spd = 140
@onready var _sprite = $Sprite2D



func _ready():
	_target = get_tree().get_first_node_in_group("player")
	#_target = get_tree().get_nodes_in_group("player") caso haja mais de um
	#print(_target)
	await get_tree().create_timer(1.0).timeout
	remove_from_group("spawned_enemy")


func _physics_process(_delta):
	movement()
	



func movement():
	var spd = randi_range(min_spd, max_spd)
	var direction = (_target.position-position).normalized()
	velocity = direction * spd
	move_and_slide()
	
	if velocity.x < 0:
		_sprite.flip_h = true
	elif velocity.x > 0:
		_sprite.flip_h = false
