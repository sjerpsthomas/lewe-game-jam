class_name MiddleJassieTower
extends JassieTower


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_tower = "res://tower/jassie_tower/high/high_jassie_tower.tscn"
	projectile_to_spawn = "res://projectiles/jassie_projectiles/middle/jassie_projectile_middle.tscn"
	cost_to_upgrade = 5000
	spawn_radius = 20
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
