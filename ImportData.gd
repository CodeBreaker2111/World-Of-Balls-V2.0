extends Node

var item_data
var unlock_data

func _ready():
	var inventory_file = File.new()
	inventory_file.open("res://Data/inventory.json", File.READ)
	var test_json_conv = JSON.new()
	test_json_conv.parse(inventory_file.get_class())
	var itemdata_json = test_json_conv.get_data()
	inventory_file.close()
	item_data = itemdata_json.result
	print(item_data)
	
	var lvls_unlock = File.new()
	lvls_unlock.open("res://Data/levelUnlocks.json", File.READ)
	var test_json_conv = JSON.new()
	test_json_conv.parse(lvls_unlock.get_class())
	var unlockdata_json = test_json_conv.get_data()
	lvls_unlock.close()
	unlock_data = unlockdata_json.result
	print(unlock_data)

