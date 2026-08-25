extends HBoxContainer

#@export var v_box_container: VBoxContainer


var OptionSlot = load("res://HUD/texture_button.tscn")
#var BackGround = load("res://HUD/choose_buff.tscn")
@export var BuffOptions: Array[PackedScene]



func _ready():
	LevelManager.buff_select.connect(show_options)
	#hide()
	#show_options()
	


var double_shoot = load("res://HUD/UpgradesButtons/upgrade_double_shoot.tscn")
var triple_shoot = load("res://HUD/UpgradesButtons/upgrade_triple_shoot.tscn")
var explosion = load("res://HUD/UpgradesButtons/upgrade_explosion.tscn")






func close_options():
	
	for i in get_children():
		i.queue_free()
	hide()
	get_tree().paused = false
	EventBus.BuffMenuOverride = false
	
	if EventBus.double_shoot:
		BuffOptions.erase(double_shoot)
	
	if triple_shoot:
		BuffOptions.erase(triple_shoot)
	if EventBus.explosion_buff:
		BuffOptions.erase(explosion)


func show_options():
	get_tree().paused = true
	EventBus.BuffMenuOverride = true
	
	#var option_slot = OptionSlot.instantiate()
	#var rand_pick_buff = BuffOptions.pick_random()
	
	if EventBus.double_shoot == false:
		BuffOptions.append(double_shoot)
	else:
		pass

	if not EventBus.triple_shoot and EventBus.double_shoot:
		BuffOptions.append(triple_shoot)
	else:
		pass
	
	
	if not EventBus.explosion_buff:
		BuffOptions.append(explosion)
	else:
		pass
	
	
	
	BuffOptions.shuffle()
	
	for i in 3:
		var option_slot = BuffOptions[i].instantiate()
		add_child(option_slot)
	
	
	show()
