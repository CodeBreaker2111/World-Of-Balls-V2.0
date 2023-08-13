extends Control

func _on_button_back():
	get_tree().change_scene_to_file("res://UI1.tscn")


func _on_BG_toggled(button_pressed):
	Settings.BG = button_pressed
	if Settings.BG == false:
		$Back_Ground.hide()
		print("Background is off.")
	if Settings.BG == true:
		$Back_Ground.show()
		print("Background is on.")

func _ready():
	if Settings.BG == false:
		$Back_Ground.hide()
	if Settings.BG == true:
		$BG_Toggle.button_pressed = true
		$Back_Ground.show()
