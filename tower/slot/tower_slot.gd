class_name TowerSlot
extends Node2D


var tower: Tower = null
@export var slot_sprite: Sprite2D
var mouse_entered = false

# (sets the tower)
func set_tower(new_tower: Tower) -> void:
	slot_sprite.visible = false
	if new_tower != null: return
	tower = new_tower

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and mouse_entered:
			set_tower(null)


func _on_area_2d_mouse_entered() -> void:
	mouse_entered = true

func _on_area_2d_mouse_exited() -> void:
	mouse_entered = false
