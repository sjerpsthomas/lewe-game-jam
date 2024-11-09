extends Node2D


# navigates to dummy world
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world/dummy/dummy_world.tscn")
