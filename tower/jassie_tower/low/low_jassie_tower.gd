class_name LowJassieTower
extends JassieTower

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_tower = "res://tower/jassie_tower/middle/middle_jassie_tower.tscn"
	projectile_to_spawn = "res://projectiles/jassie_projectiles/low/jassie_projectile_low.tscn"
	cost_to_upgrade = 2000
	spawn_radius = 15
	max_projectiles = 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
