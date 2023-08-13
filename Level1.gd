extends Node2D

var playing = true
var rng = RandomNumberGenerator.new()
var lives = 3
const enimy1 = preload("res://Enimy1.tscn")
const end = preload("res://Level_End.tscn")
var lvl2unlock = LevelUnlock.level2

func _process(delta) -> void:
	var levelTime = $Level_Timer.time_left
	$Label.text = str(lives)
	$Level_Time.text = "%.1f" % levelTime
	if lives < 1:
		dead()


func _on_Spawn1():
	if playing == true:
		var thing = enimy1.instantiate()
		thing.position.x = rng.randi_range(0, 700)
		add_child(thing)
		$Spawn1.start(rng.randi_range(5, 9))
		thing.connect("death", Callable(self, "_on_death"))

func _ready():
		rng.randomize()
		if Settings.BG == false:
			$Back_Ground.hide()
		if Settings.BG == true:
			$Back_Ground.show()
		Enemy1Data.speed = 200
		print("Level1 Loaded.")

func _on_death():
	lives -= 1


func _on_Spawn2_timeout():
	if playing == true:
		var thing = enimy1.instantiate()
		thing.position.x = rng.randi_range(0, 700)
		add_child(thing)
		$Spawn2.start(rng.randi_range(7, 10))
		thing.connect("death", Callable(self, "_on_death"))


func _time_up():
	playing = false
	get_tree().call_group("enimy", "leave_pls")
	LevelFait.won = true
	LevelFait.lives = lives
	get_tree().change_scene_to_packed(end)
	if lives > 1:
		LevelUnlock.level2 = true
		var num = rng.randi_range(0, 1)
		if num == 1:
			pass
		if lvl2unlock == true:
			print("Congrats! You beat level1... again. huh. Well, no point in celebrating I guess. Gosh! It took me like an hour to set this party up.")
		else:
			print("Congrats! You beat level1! Now level2 is unlocked.")
	Inventory.AS1 = "SpeedPotion"

func dead():
	playing = false
	get_tree().call_group("enimy", "leave_pls")
	$Level_Timer.stop()
	LevelFait.won = false
	LevelFait.lives = 0
	$Pop.expload()
	await get_tree().create_timer(1 * 2).timeout
	get_tree().change_scene_to_packed(end)
