class_name World
extends Node2D


@onready var tower_slots: Node2D = $TowerSlots
@onready var enemies: Node2D = $Enemies

@onready var enemy_path := $EnemyPath as Path2D

var wave_file: WaveFile
@export_file("*.txt") var wave_file_path: String

enum State {
	IDLE,
	ACTIVE
}

var state := State.IDLE

var max_subwave_timer: float
var subwave_timer: float

func _ready() -> void:
	_set_tower_slot_paths()

# -
func _process(delta: float) -> void:
	if state == State.IDLE: _process_idle(delta)
	elif state == State.ACTIVE: _process_active(delta)


func _goto_idle() -> void:
	print("Go to idle")
	
	state = State.IDLE
	
	$UI/StartWave/ColorRect.visible = false

# -
func _process_idle(delta: float) -> void:
	pass


func _goto_active() -> void:
	print("Go to active")
	
	state = State.ACTIVE
	
	wave_file = WaveFile.new(wave_file_path)
	max_subwave_timer = wave_file.get_total_time()
	
	$UI/StartWave/ColorRect.visible = true

# -
func _process_active(delta: float) -> void:
	var wave_time := wave_file.get_total_time() - subwave_timer
	
	$UI/StartWave/ColorRect.size.x = 290.0 * (1 - (wave_time / max_subwave_timer))
	
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

func _set_tower_slot_paths() -> void:
	var tower_slots: Array[Node]
	if has_node("TowerSlots"):
		tower_slots = get_node("TowerSlots").get_children()
	if tower_slots and enemy_path:
		for slot in tower_slots:
			slot.path = enemy_path
