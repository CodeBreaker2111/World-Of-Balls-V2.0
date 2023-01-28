extends Control

var hold = false
const speedpotion = preload("res://Sprite.tscn")

func _ready():
	if Inventory.AS1 == "SpeedPotion":
		$Buttons/Auto/AS1._load_speed_potion()

func _HS1():
	pass # Replace with function body.

func _HS2():
	pass # Replace with function body.

func _HS3():
	pass # Replace with function body.


func _on_back():
	get_tree().change_scene("res://UI1.tscn")
