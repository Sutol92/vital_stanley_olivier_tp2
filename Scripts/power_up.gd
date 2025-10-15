extends Area2D

@export var jump_power = -600


	
func _on_body_entered(body):
	$AnimatedSprite2D.play("pick_up")
	$pick_up.play()
	await $AnimatedSprite2D.animation_finished
	if body.is_in_group("player"):
		if "jump_height" in body:
			body.jump_height = jump_power
		queue_free()
