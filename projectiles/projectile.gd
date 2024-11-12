class_name Projectile
extends Node2D

var damage: int
var destroyedOnDamage: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().has_method("take_damage"):
		area.get_parent().take_damage(damage)
		if destroyedOnDamage:
			get_parent().amount_of_projectiles -= 1
			queue_free()
