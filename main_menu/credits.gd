extends Node2D


func _on_meuk_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")
