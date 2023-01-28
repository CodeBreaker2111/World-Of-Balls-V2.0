extends Node2D

var lives = 3
var playing = true
var rng = RandomNumberGenerator.new()
const enimy = preload("res://Enimy1.tscn")
const SpikeBall = preload("res://SpikeBall.tscn")
var lvl2beat = LevelUnlock.level3

func _ready():
	if Settings.BG == false:
		$Back_Ground.hide()
	if Settings.BG == true:
		$Back_Ground.show()
	$Label.text = String(lives)
	$Spawn1.start()
	$Spawn2.start()
	$Spawn3.start()
	$Spawn4.start()
	$Pop.reset()
	$Game_Time.start()
	Enemy1Data.speed = 200
	print("Level2 Loaded.")

func _process(delta) -> void:
	if playing == true:
		var timeLeft = $Game_Time.time_left
		$Level_Time.text = "%.1f" % timeLeft
	else:
		$Level_Time.text = "0.0"

func _on_Spawn1_timeout():
	if playing == true:
		var thing = enimy.instance()
		thing.position.x = rng.randi_range(0, 700)
		add_child(thing)
		$Spawn1.start(rng.randi_range(1, 4))
		thing.connect("death", self, "_on_death")


func _on_Spawn2_timeout():
	if playing == true:
		var thing = enimy.instance()
		thing.position.x = rng.randi_range(0, 700)
		add_child(thing)
		$Spawn1.start(rng.randi_range(5, 10))
		thing.connect("death", self, "_on_death")


func _on_Spawn3_timeout():
	if playing == true:
		var thing = enimy.instance()
		thing.position.x = rng.randi_range(0, 700)
		add_child(thing)
		$Spawn3.start(rng.randi_range(10, 15))
		thing.connect("death", self, "_on_death")


func _on_death():
	lives -= 1
	$Label.text = String(lives)
	if lives == 0:
		dead()


func _times_up():
	playing = false
	get_tree().call_group("enimy", "leave_pls")
	LevelFait.lives = lives
	if lives > 1:
		LevelFait.won = true
		LevelUnlock.level3 = true
		if lvl2beat == true:
			print("Congrats! You beat level1... again. huh. Well, no point in celebrating I guess. Gosh! It took me like an hour to set this party up.")
		else:
			print("Congrats! You beat level1! Now level2 is unlocked. Actually level3 is still under developement. But you will be able to play it sometime.")
	get_tree().change_scene("res://Level_End.tscn")

func dead():
	playing = false
	get_tree().call_group("enimy", "leave_pls")
	LevelFait.lives = 0
	LevelFait.won = false
	$Pop.expload()
	yield(get_tree().create_timer(1 * 2), "timeout")
	get_tree().change_scene("res://Level_End.tscn")


func _on_Spawn4_timeout():
	if playing == true:
		var thing = SpikeBall.instance()
		thing.position.x = rng.randi_range(0, 700)
		add_child(thing)
		thing.connect("death", self, "_on_death")
		$Spawn4.start(5)
