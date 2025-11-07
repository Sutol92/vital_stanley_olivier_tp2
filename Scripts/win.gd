extends Control

func _ready():
	$Level_1.pressed.connect(_on_jouer_1_pressed)
	$Level_2.pressed.connect(_on_jouer_2_pressed)
	$Button.pressed.connect(_on_jouer_3_pressed)
	$AudioStreamPlayer.play()
	await $AudioStreamPlayer.finished
	$AudioStreamPlayer2.play()

func _on_jouer_1_pressed():
	var game = load("res://Scenes/level_1.tscn")
	get_tree().change_scene_to_packed(game)
 
func _on_jouer_2_pressed():
	var game_2 = load("res://Scenes/level_2.tscn")
	get_tree().change_scene_to_packed(game_2)

func _on_jouer_3_pressed():
	var game_3 = load("res://Scenes/game.tscn")
	get_tree().change_scene_to_packed(game_3)
