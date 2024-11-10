extends Node2D


func _on_sound_finished() -> void:
	queue_free()
