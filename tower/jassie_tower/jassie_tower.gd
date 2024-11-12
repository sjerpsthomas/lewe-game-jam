class_name JassieTower
extends Tower

var rng = RandomNumberGenerator.new()
var spawn_radius

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func createProjectile():
	var projectile_scene = load(projectile_to_spawn)
	var projectile = projectile_scene.instantiate()
	var spawn_position
	spawn_position = parent_slot.getClosestPathPositionFromTower()
	spawn_position.x += rng.randf_range(-spawn_radius, spawn_radius)
	spawn_position.y += rng.randf_range(-spawn_radius, spawn_radius)
	spawn_position = self.to_global(spawn_position)
	spawn_position = parent_slot.getClosestPathPosition(spawn_position)
	spawnProjectile(spawn_position, projectile)
