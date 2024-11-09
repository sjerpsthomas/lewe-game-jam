class_name TowerSlot
extends Node2D

@export var available_towers: Array[String]
@export var slot_sprite: Sprite2D
@export var cost_label: RichTextLabel
var current_child_tower: Tower = null

# (sets the tower)
func set_tower(new_tower: String) -> void:
	slot_sprite.visible = false
	if new_tower == null: return
	if current_child_tower != null:
		self.remove_child(current_child_tower)
		current_child_tower.queue_free()
	var current_child_scene = load(new_tower)
	current_child_tower = current_child_scene.instantiate()
	add_child(current_child_tower)
	if current_child_tower.cost_to_upgrade > 0:
		cost_label.text = "[center]"+str(current_child_tower.cost_to_upgrade)+"[/center]"
		cost_label.visible = true
	else:
		cost_label.visible = false
	print(cost_label.text)
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
