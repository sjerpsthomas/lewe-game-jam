extends Node2D

@export var patrol_path: Path2D
@export var move_speed = 100
var patrol_offset = 0
var patrol_length = 0
var is_done_moving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if !patrol_path:
		queue_free()
	patrol_length = patrol_path.curve.get_baked_length()
	move_speed /= 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_done_moving:
		move_enemy(delta)
	
func move_enemy(delta: float):
	patrol_offset += move_speed
	position = patrol_path.curve.sample_baked(patrol_offset)
	if patrol_offset >= patrol_length:
		is_done_moving = true
