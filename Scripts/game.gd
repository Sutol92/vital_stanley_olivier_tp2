extends Node

var current_level: int = 0

func _ready():
	$Control/Level_1.pressed.connect(_on_jouer_1_pressed)
	$Control/Level_2.pressed.connect(_on_jouer_2_pressed)
	$AudioStreamPlayer.play()
 
func _on_jouer_1_pressed():
	current_level = 1
	var game = load("res://Scenes/level_1.tscn")
	get_tree().change_scene_to_packed(game)
 
func _on_jouer_2_pressed():
	current_level = 2
	var game_2 = load("res://Scenes/level_2.tscn")
	get_tree().change_scene_to_packed(game_2)
 
func get_game_over_scene():
	match current_level:
		1:
			return load("res://Scenes/game_over1.tscn")
		2:
			return load("res://Scenes/game_over2.tscn")
		_:
			return null
