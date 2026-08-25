class_name HitBox
extends Area2D

@export_enum("player", "enemy", "none") var AttackerClass: String = "none"
signal _hit_connected

@export var _damage: float = 20
@export var _damage_multiplier: float = 1




func deal_damage():
	pass


func _on_area_entered(area): #attack
	var damage
	if get_parent().is_in_group("bullet"):
		damage = _damage * LevelManager._player_damage
		#print("Witch: my inner hitbox projectile damage is: ", damage)
	else:
		damage = _damage
	if area is HurtBox:
		_hit_connected.emit(damage)
		if area.has_method("receive_hit"):
			area.receive_hit(-(damage))
	if get_parent().is_in_group("enemy") or get_parent().is_in_group("piercing bullets"):
		return
	else:
		get_parent().queue_free()
	_hit_connected.emit(_damage * 3)
	if get_parent().is_in_group("enemy"):
			pass
