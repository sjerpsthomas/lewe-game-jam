class_name Tower
extends Node2D

var next_tower: String = "res://tower/jassie_tower/middle_jassie_tower.tscn"
var cost_to_upgrade: int = 0
@export var cost_label: RichTextLabel
var mouse_entered: bool = false
var projectile_to_spawn: String
var parent_slot: TowerSlot

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
	print(projectile.position)
	add_child(projectile)

func _on_projectile_timer_timeout() -> void:
	createProjectile()
