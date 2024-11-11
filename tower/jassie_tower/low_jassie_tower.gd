class_name LowJassieTower
extends JassieTower

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_tower = "res://tower/jassie_tower/middle_jassie_tower.tscn"
	projectile_to_spawn = "res://projectiles/jassie_projectiles/low/jassie_projectile_low.tscn"
	cost_to_upgrade = 1000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func createProjectile():
	var projectile_scene = load(projectile_to_spawn)
	var projectile = projectile_scene.instantiate()
	var tower_slot = get_parent()
	var spawn_position
	spawn_position = tower_slot.getClosestPathPositionFromTower()
	spawn_position.x += rng.randf_range(-20, 20)
	spawn_position.y += rng.randf_range(-20, 20)
	spawn_position = tower_slot.getClosestPathPosition(spawn_position)
	print("Spawned projectile: ", projectile)
	spawnProjectile(spawn_position, projectile)


func _on_projectile_timer_timeout() -> void:
	print("projectile spawn")
	createProjectile()
	pass # Replace with function body.
