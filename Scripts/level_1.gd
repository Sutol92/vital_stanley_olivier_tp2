extends Node2D

var current_level: int = 0
 
func _ready():
	current_level = 1
	print("Niveau courant :", current_level)
	$player.level_selected = 1
