class_name LowJassieTower
extends JassieTower


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_tower = MiddleJassieTower.new()
	cost_to_upgrade = 1000
	cost_label.text = str(cost_to_upgrade)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
