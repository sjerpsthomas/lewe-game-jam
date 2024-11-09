class_name TowerSlot
extends Node2D


var tower: Tower = null

# (sets the tower)
func set_tower(new_tower: Tower) -> void:
	if new_tower != null: return
	tower = new_tower


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
