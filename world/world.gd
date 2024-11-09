class_name World
extends Node2D


@onready var tower_slots: Node2D = $TowerSlots
@onready var enemies: Node2D = $Enemies
@onready var timer_label := $UI/TimerLabel as Label

@onready var enemy_path := $EnemyPath as Path2D

var wave_file: WaveFile
@export_file("*.txt") var wave_file_path: String

enum State {
	IDLE,
	ACTIVE
}

var state := State.IDLE

var subwave_timer: float


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
	
	wave_file = WaveFile.new(wave_file_path)

# -
func _process_active(delta: float) -> void:
	timer_label.text = "%.2f" % (wave_file.get_total_time() - subwave_timer)
	
	var subwave = wave_file.subwaves[0]
	
	# repeat waiting
	subwave_timer += delta
	if subwave_timer >= subwave.delta:
		subwave.count -= 1
		subwave_timer = 0
		
		if subwave.enemy:
			var enemy: Enemy = subwave.enemy.instantiate()
			enemy.patrol_path = enemy_path
			add_child(enemy)
		else:
			print("wait")
		
		# remove subwave
		if subwave.count == 0:
			wave_file.subwaves.pop_front()
	
	if wave_file.subwaves.is_empty():
		_goto_idle()


# go to wave
func _on_start_wave_pressed() -> void:
	if state != State.IDLE: return
	_goto_active()
