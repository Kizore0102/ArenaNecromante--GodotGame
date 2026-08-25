extends TextureButton

@export var shooter: Node2D


@export var damage_multiplier: float
@export var speed_multiplier: float
@export var explosion = false
@export var cooldown = false
@export var double_shoot = false
@export var triple_shoot = false




func update_text():
	#title.text = "Lv." + str(LevelManager._player_level)
	pass










func _on_gui_input(event: InputEvent):
	if event.is_action_pressed("click"):
		if get_parent().has_method("close_options"):
			
			
			LevelManager._player_damage += damage_multiplier
			LevelManager._player_speed += speed_multiplier
			if explosion:
				EventBus.explosion_buff = true
			if cooldown:
				EventBus.fix_cooldown()
			if double_shoot:
				EventBus.double_shoot = true
			if triple_shoot:
				EventBus.triple_shoot = true
			print("obrigado por clicar")
			get_parent().close_options()
			
