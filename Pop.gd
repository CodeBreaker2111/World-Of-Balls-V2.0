extends Node2D

const f1 = preload("res://PlayerExploadf1.png")
const f2 = preload("res://PlayerExploadf2.png")
const f3 = preload("res://PlayerExploadf3.png")
const f4 = preload("res://PlayerExploadf4.png")
const f5 = preload("res://PlayerExploadf5.png")
const f6 = preload("res://PlayerExploadf6.png")
const normal = preload("res://pop_thing.png")

func _process(delta) -> void:
	if Input.is_action_pressed("ui_left"):
		$Area2D.position += Vector2(-10, 0)
	if Input.is_action_pressed("ui_right"):
		$Area2D.position += Vector2(10, 0)
	Playerdata.playerPosX = $Area2D.position.x
	Playerdata.playerPosY = $Area2D.position.y
	Playerdata.playerVect2 = Vector2($Area2D.position.x, $Area2D.position.y)

func reset():
	$Area2D/Sprite2D.texture = normal
	$Area2D/Sprite2D.show()

func expload():
	$Area2D/Sprite2D.texture = f1
	await get_tree().create_timer(1 * 0.05).timeout
	$Area2D/Sprite2D.texture = f2
	await get_tree().create_timer(1 * 0.05).timeout
	$Area2D/Sprite2D.texture = f3
	await get_tree().create_timer(1 * 0.05).timeout
	$Area2D/Sprite2D.texture = f4
	await get_tree().create_timer(1 * 0.05).timeout
	$Area2D/Sprite2D.texture = f5
	await get_tree().create_timer(1 * 0.05).timeout
	$Area2D/Sprite2D.texture = f6
	await get_tree().create_timer(1 * 0.05).timeout
	$Area2D.hide()
