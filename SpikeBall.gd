extends Node2D

var t := 0.0
signal death

func _process(delta) -> void:
	t += delta
	$Path2D/PathFollow2D.offset = t * 200
	
	if $Path2D/PathFollow2D.get_position().y > 900:
		queue_free()


func _player_death(area):
	emit_signal("death")
	queue_free()

func leave_pls():
	queue_free()
