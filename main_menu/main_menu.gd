extends Node2D

var time := 0.0

@onready var start_y = $Title.position.y

# -
func _process(delta: float) -> void:
	time += delta
	
	$Title.position.y = start_y + 20 * sin(time * 2)


# navigates to dummy world
func _on_meuk_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world/dummy/dummy_world.tscn")


func _on_meuk_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/credits.tscn")
