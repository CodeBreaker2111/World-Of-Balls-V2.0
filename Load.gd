extends Node

var path = "res://Data/levelsUnlocked.json"

var defult_data = {
	"": 1
}

var data

func _ready():
	pass

func load_game():
	var file = File.new()
	
	if not file.file_exists(path):
		reset_data()
		return
	
	file.open(path, File.READ)
	
	var number = file.get_16()
	data = parse_json(number)
	
	file.close()

func save_game():
	var file
	file = File.new()
	
	file.open(path, File.WRITE)
	file.store_line(to_json(data))
	
	file.close()

func reset_data():
	data = defult_data.duplicate(true)
