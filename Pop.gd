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

func reset():
	$Area2D/Sprite.texture = normal
	$Area2D/Sprite.show()

func expload():
	$Area2D/Sprite.texture = f1
	yield(get_tree().create_timer(1 * 0.05), "timeout")
	$Area2D/Sprite.texture = f2
	yield(get_tree().create_timer(1 * 0.05), "timeout")
	$Area2D/Sprite.texture = f3
	yield(get_tree().create_timer(1 * 0.05), "timeout")
	$Area2D/Sprite.texture = f4
	yield(get_tree().create_timer(1 * 0.05), "timeout")
	$Area2D/Sprite.texture = f5
	yield(get_tree().create_timer(1 * 0.05), "timeout")
	$Area2D/Sprite.texture = f6
	yield(get_tree().create_timer(1 * 0.05), "timeout")
	$Area2D.hide()
