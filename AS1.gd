extends Button

var item = null
var mousePos
var Item
const speedpotion = preload("res://Sprite.tscn")

func _load_speed_potion():
	print("ok it ran")
	var SpeedPotion = speedpotion.instance()
	SpeedPotion.scale = Vector2(2.1, 2.1)
	SpeedPotion.position = Vector2(570, 890)
	add_child(speedpotion)
	item = speedpotion

func _hold():
	Item = item.instance()
	Item.scale = Vector2(3, 3)
	add_child(Item)

func _process(delta) -> void:
	mousePos = get_viewport().get_mouse_position()
	if Item == null:
		pass
	else:
		Item.position = mousePos
