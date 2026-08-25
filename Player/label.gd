class_name DebugHudLabel
extends Label

@export var player: PlayerChar

@export var health_component: HealthComponent
@export var hit_box: HitBox


func _ready():
	if not player:
		position.x = -30
		position.y = -74

func _process(_delta):
	if health_component != null:
		text = str(health_component._curr_health, " / ", health_component._max_health)
	show_bullet_demage_debug()
	show_level(LevelManager._player_level)

func show_bullet_demage_debug():
	if hit_box != null:
		#var show_damage = hit_box._damage * ((float(LevelManager._player_level / 10)) + hit_box._damage_multiplier)
		var show_damage = LevelManager.bullet_current_damage
		text = str(show_damage)
#_damage = _damage * ((LevelManager._player_level / 10) + _damage_multiplier)


func show_level(level):
	if name == "levelLabel":
		text = str("Lv.",level)
