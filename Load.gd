#extends Node

#var path = "res://Data/levelsUnlocked.json"

#var defult_data = {
#	"": 1
#}

#var data

#func _ready():
#	pass

#func load_game():
#	var file = File.new()
	
#	if not file.file_exists(path):
#		reset_data()
#		return
	
#	file.open(path, File.READ)
	
#	var number = file.get_16()
#	var test_json_conv = JSON.new()
#	test_json_conv.parse(number)
#	data = test_json_conv.get_data()
	
#	file.close()

#func save_game():
#	var file
#	file = File.new()
	
#	file.open(path, File.WRITE)
#	file.store_line(JSON.new().stringify(data))
	
#	file.close()

#func reset_data():
#	data = defult_data.duplicate(true)
