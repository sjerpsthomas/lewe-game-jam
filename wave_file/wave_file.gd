class_name WaveFile
extends RefCounted


class Subwave:
	var enemy: PackedScene
	var count: int
	var delta: float

var subwaves: Array[Subwave] = []

# -
func _init(file_path: String) -> void:
	# open wave file
	var file := FileAccess.open(file_path, FileAccess.READ)
	var txt := file.get_as_text()
	var lines := txt.split('\n')
	
	subwaves.clear()
	
	# parse lines
	for line in lines:
		if line == "": continue
		var line_data := line.split(' ')
		
		var subwave = Subwave.new()
		
		var enemy_path = line_data[0]
		subwave.enemy = null if enemy_path == "" else load("res://" + enemy_path) 
		subwave.count = int(line_data[1])
		subwave.delta = float(line_data[2])
		
		subwaves.append(subwave)
