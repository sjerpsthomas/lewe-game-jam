class_name Tower
extends Node2D

var next_tower: String = "res://tower/jassie_tower/middle_jassie_tower.tscn"
var cost_to_upgrade: int = 0
@export var cost_label: RichTextLabel
var mouse_entered: bool = false
var projectile_to_spawn: String
var parent_slot: TowerSlot
var max_projectiles: int = 0
var amount_of_projectiles: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cost_label.text = "[center]"+str(cost_to_upgrade)+"[/center]"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func isUpgradeable() -> bool:
	return cost_to_upgrade > 0

func createProjectile() -> void:
	pass

func spawnProjectile(spawn_position: Vector2, projectile: Projectile) -> void:
	projectile.position = spawn_position
	add_child(projectile)
	amount_of_projectiles += 1
	print(amount_of_projectiles)

func _on_projectile_timer_timeout() -> void:
	if amount_of_projectiles < max_projectiles:
		createProjectile()
