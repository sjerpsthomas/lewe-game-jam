class_name Tower
extends Node2D

var next_tower = "res://tower/jassie_tower/middle_jassie_tower.tscn"
var cost_to_upgrade = 0
@export var cost_label: RichTextLabel
var mouse_entered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cost_label.text = "[center]"+str(cost_to_upgrade)+"[/center]"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
