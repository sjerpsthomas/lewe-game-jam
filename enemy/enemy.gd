class_name Enemy
extends Node2D

@export var patrol_path: Path2D
@export var move_speed = 100
@export var attack_damage = 5
@export var attack_timer: Timer
@export var health := 10.0
var patrol_offset = 0
var patrol_length = 0
var is_done_moving = false
signal attack_signal

# Called when the node enters the scene tree for the first time.
func _ready():
	if !patrol_path || !attack_timer:
		queue_free()
	patrol_length = patrol_path.curve.get_baked_length()
	move_speed /= 10
	
	position = patrol_path.curve.sample_baked(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_done_moving:
		move_enemy(delta)
	
func move_enemy(delta: float):
	patrol_offset += move_speed
	position = patrol_path.curve.sample_baked(patrol_offset)
	if patrol_offset >= patrol_length:
		attack_timer.start()
		is_done_moving = true
		

func attack():
	attack_signal.emit()

func attack_timer_out() -> void:
	attack()


# takes damage
func take_damage(damage: float) -> void:
	health -= damage
	
	var particle = preload("res://particle/DamageParticle.tscn").instantiate()
	get_tree().current_scene.get_node("Particles").add_child(particle)
	
	if health <= 0:
		queue_free()
