class_name World
extends Node2D


@onready var tower_slots: Node2D = $TowerSlots
@onready var enemies: Node2D = $Enemies
@onready var timer_label := $UI/TimerLabel as Label

var wave_file: WaveFile
@export_file("*.txt") var wave_file_path: String

enum State {
	IDLE,
	ACTIVE
}

var state := State.IDLE

var wave_timer: float

# -
func _ready() -> void:
	wave_file = WaveFile.new(wave_file_path)
	pass

# -
func _process(delta: float) -> void:
	if state == State.IDLE: _process_idle(delta)
	elif state == State.ACTIVE: _process_active(delta)


func _goto_idle() -> void:
	print("Go to idle")
	
	state = State.IDLE
	timer_label.visible = false

# -
func _process_idle(delta: float) -> void:
	pass


func _goto_active() -> void:
	print("Go to active")
	
	state = State.ACTIVE
	timer_label.visible = true
	
	# todo: read from wave file
	wave_timer = 5.0

# -
func _process_active(delta: float) -> void:
	print("Process active")
	
	wave_timer -= delta
	
	timer_label.text = "%.2f" % wave_timer
	
	if wave_timer <= 0:
		_goto_idle()


# go to wave
func _on_start_wave_pressed() -> void:
	if state != State.IDLE: return
	_goto_active()
