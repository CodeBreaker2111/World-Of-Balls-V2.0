extends Node2D

var slide = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Tutorial loaded.")
	$Sprite1.show()
	$Description1.show()
	$Sprite2.hide()
	$Description2.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_slide_button_pressed():
	slide += 1
	
	if slide > 2:
		slide = 1
	
	if slide == 1:
		$Sprite1.show()
		$Description1.show()
	
	else:
		$Sprite1.hide()
		$Description1.hide()
	
	if slide == 2:
		$Sprite2.show()
		$Description2.show()
	else:
		$Sprite2.hide()
		$Description2.hide()


func _on_back_button_pressed():
	print("Loading main menu...")
	get_tree().change_scene_to_file("res://UI1.tscn")
