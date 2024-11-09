class_name LowJassieTower
extends JassieTower

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_tower = "res://tower/jassie_tower/middle_jassie_tower.tscn"
	cost_to_upgrade = 1000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
