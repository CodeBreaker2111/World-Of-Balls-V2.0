extends Node2D

const enimy1 = preload("res://Enimy1.tscn")
var rng = RandomNumberGenerator.new()

func _on_spawn1():
	var i = 0
	while(i < 6):
		i += 1
		var Enemy = enimy1.instantiate()
		Enemy.position.x = rng.randi_range(0, 700)
		add_child(Enemy)

func _ready():
	Enemy1Data.speed = 1000
	print("Secret Loaded.")

func _on_Button_pressed():
	get_tree().change_scene_to_file("res://UI1.tscn")
