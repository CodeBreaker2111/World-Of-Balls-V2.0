extends Node2D

var slide = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Tutorial loaded.")
	$Sprite2D.show()
	$Description1.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_slide_button_pressed():
	slide += 1
	
	if slide > 2:
		slide = 1
	
	if slide == 1:
		$Sprite2D.show()
		$Description1.show()
	
	else:
		$Sprite2D.hide()
		$Description1.hide()
