extends Control
const settings = preload("res://Settings.tscn")

func _process(delta) -> void:
	pass

func _settings_pressed():
	get_tree().change_scene_to_packed(settings)


func _on_Level_1_pressed():
	print("Loading Level1...")
	get_tree().change_scene_to_file("res://Level1.tscn")

func _ready():
	if LevelUnlock.level2 == true:
		$Level_2/Sprite2D.hide()
		$Level_2.text =  "Level2"
	else:
		$Level_2/Sprite2D.show()
		$Level_2.text = ""
	if Settings.BG == false:
		$Back_Ground.hide()
	if Settings.BG == true:
		$Back_Ground.show()


func _on_Level2():
	if LevelUnlock.level2 == true:
		print("Loading Level2...")
		get_tree().change_scene_to_file("res://Level2.tscn")
	else:
		print("Level2 is currently locked. Beat level1(Survive with 2 lives) to unlock level2.")


func _on_Other_pressed():
	pass

func _easter_egg():
	print("Loading Secret...")
	get_tree().change_scene_to_file("res://Level3.tscn")


func _on_options_2_pressed():
	print("Loading tutorial...")
	get_tree().change_scene_to_file("res://how_to_play.tscn")
