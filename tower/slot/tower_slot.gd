class_name TowerSlot
extends Node2D

@export var available_towers: Array[String]
@export var slot_sprite: Sprite2D

# (sets the tower)
func set_tower(new_tower: String) -> void:
	slot_sprite.visible = false
	if new_tower == null: return
	print(new_tower)
	var instance = load(new_tower)
	add_child(instance.instantiate())

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	set_tower(available_towers[0])
