extends Node2D

const bullet = preload("res://Bullet.tscn")

func _ready():
	$Timer.start(1.5)

func _spawn_bullet():
	var Bullet = bullet.instantiate()
	
	Bullet.rotation_degrees = atan2(Playerdata.playerPosX, Playerdata.playerPosY)
	Bullet.position = atan2(45 / 2, sqrt(3) / 2)
