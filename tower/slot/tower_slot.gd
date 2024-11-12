class_name TowerSlot
extends Node2D

@export var available_towers: Array[String]
@export var slot_sprite: Sprite2D
@export var cost_label: RichTextLabel
var current_child_tower: Tower = null
var path: Path2D

# (sets the tower)
func set_tower(new_tower: String) -> void:
	slot_sprite.visible = false
	if new_tower == null: return
	# Removes current tower if there is one
	if current_child_tower:
		self.remove_child(current_child_tower)
		current_child_tower.queue_free()
	# Adds new tower to scene
	var current_child_scene = load(new_tower)
	current_child_tower = current_child_scene.instantiate()
	current_child_tower.parent_slot = self
	add_child(current_child_tower)
	# Only displays upgrade cost if it is upgradeable
	if current_child_tower.isUpgradeable():
		cost_label.text = "[center][color=black]"+str(current_child_tower.cost_to_upgrade)+"[/color][/center]"
		cost_label.visible = true
	else:
		cost_label.visible = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	if current_child_tower == null:
		set_tower(available_towers[0])
	elif current_child_tower.next_tower == null:
		return
	else:
		set_tower(current_child_tower.next_tower)

func getClosestPathPositionFromTower():
	return path.curve.get_closest_point(global_position)

func getClosestPathPosition(position: Vector2):
	return path.curve.get_closest_point(position)
