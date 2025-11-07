extends CharacterBody2D

@onready var game = get_node("/root/game")
@export var jump_height = -400  # saute un peu moins haut
@export var gravity = 1200      # retombe plus vite
@export var acceleration = 600
@export var max_speed = 200

var direction = Vector2.ZERO

var level_selected: int

@onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	direction = Vector2.ZERO
	if global_position.y > 1000:  # si le joueur tombe trop bas
		respawn()
	# Déplacement gauche/droite
	if Input.is_action_pressed("walk_right"):
		direction.x += 1
	if Input.is_action_pressed("walk_left"):
		direction.x -= 1

	# Saut
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_height
			$jump.play()
		elif is_on_wall():
			velocity.y = jump_height
			$jump.play()

	# Gravité personnalisée
	if not is_on_floor():
		velocity.y += gravity * delta

	# Mouvement horizontal fluide
	velocity.x = move_toward(velocity.x, direction.x * max_speed, acceleration * delta)

	# Appliquer le mouvement
	move_and_slide()

	# Animation
	if not is_on_floor():
		anim.play("jump")
		if direction.x < 0:
			anim.flip_h = true
		if direction.x > 0:
			anim.flip_h = false
	elif direction.x != 0:
		anim.play("walk")
		anim.flip_h = direction.x < 0
	else:
		anim.stop()

var speed: float = 200.0
var spawn_position: Vector2
var ui: CanvasLayer  # référence à ton interface

func _ready():
	add_to_group("player")
	spawn_position = global_position

func respawn():
	if level_selected == 1:
		var death = load("res://Scenes/game_over1.tscn")
		get_tree().change_scene_to_packed(death)
	elif level_selected == 2:
		var death = load("res://Scenes/game_over2.tscn")
		get_tree().change_scene_to_packed(death)
	
	
