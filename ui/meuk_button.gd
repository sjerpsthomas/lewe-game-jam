class_name MeukButton
extends Node2D


signal pressed


# emit pressed
func _on_button_pressed() -> void:
	pressed.emit()
