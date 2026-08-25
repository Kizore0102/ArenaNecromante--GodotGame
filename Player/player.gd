class_name PlayerChar
extends CharacterBody2D

var spd = 220 * LevelManager._player_speed
@export var _sprite: Sprite2D

@export var shoot_cooldown: Timer
@onready var hud_health_bar = $CanvasLayer/HUD_HealthBar
@onready var hud_exp_bar = $CanvasLayer/HUD_ExpBar

@onready var health_component = $HealthComponent

func _ready():
	EventBus.MatchWinned.connect(load_game_winned_screen)


func _process(delta):
	movement()
	update_hud_bars()
	#debug_commands()
	spd = 220 * LevelManager._player_speed



func movement():
	var _direction: Vector2 = Input.get_vector("left_key", "right_key", "up_key", "down_key")
	velocity = _direction * spd
	move_and_slide()
	
	if velocity.x < 0:
		_sprite.flip_h = true
	elif velocity.x > 0:
		_sprite.flip_h = false


func debug_commands():
	#enable explosion on command <---------
	if Input.is_action_just_pressed("ui_accept"):
		EventBus.explosion_buff = not EventBus.explosion_buff
		print("explosion is: ", EventBus.explosion_buff)
		EventBus.speed_shoot = not EventBus.speed_shoot
		print("Speed Shoot is: ", EventBus.speed_shoot)
		EventBus.triple_shoot = not EventBus.triple_shoot
		#EventBus.double_shoot = not EventBus.double_shoot
	
	if EventBus.speed_shoot == true:
		shoot_cooldown.wait_time = .15
	else:
		shoot_cooldown.wait_time = .4
	
	
	if Input.is_action_just_pressed("ui_text_backspace"):
		EventBus.double_shoot = not EventBus.double_shoot


func update_hud_bars(): 
	hud_health_bar.set_health(health_component._curr_health)
	hud_health_bar.max_value = health_component._max_health
	
	hud_exp_bar.set_exb_bar_value()
	
	
	#A versão da hud funciona bem 
	#melhor qua a TopHead original pq é conectada
	#pelo objeto pai da cena direto


func load_game_winned_screen():
	get_tree().change_scene_to_file("res://HUD/game_winned.tscn")
