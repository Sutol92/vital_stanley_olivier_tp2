extends Control

func _ready():
	$Button.pressed.connect(_on_jouer_pressed)
	$AudioStreamPlayer.play()
	
func _on_jouer_pressed():
	var game = load("res://Scenes/game.tscn")
	get_tree().change_scene_to_packed(game)
	
	
