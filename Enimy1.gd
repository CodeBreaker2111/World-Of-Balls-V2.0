extends Node2D

var t := 0.0
signal death

func _ready() -> void:
	print("enemy spawn")

func _process(delta) -> void:
	t += delta
	$Path2D/PathFollow2D.h_offset = t * Enemy1Data.speed
	
	if $Path2D/PathFollow2D.get_position().y > 900:
		emit_signal("death")
		queue_free()


func _on_Area2D_area_entered(area):
	queue_free()

func leave_pls():
	queue_free()
