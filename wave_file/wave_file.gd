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
		
		# enable waiting
		if enemy_path == "*":
			subwave.enemy = null
			subwave.count = 1
			subwave.delta = float(line_data[1])
		else:
			subwave.enemy = load("res://" + enemy_path + ".tscn")
			subwave.count = int(line_data[1])
			subwave.delta = float(line_data[2])
		
		subwaves.append(subwave)


# get the total time of the subwave
func get_total_time() -> float:
	var res := 0.0
	
	for subwave in subwaves:
		res += subwave.delta * subwave.count
	
	return res
