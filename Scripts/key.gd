extends Area2D

var keyed = false
@onready var door = get_node("../door")

func _process(delta: float) -> void:
	if !keyed:
		door.get_child(1).disabled = true
	else:
		door.get_child(0).play()
		await  door.get_child(0).animation_finished
		door.get_child(0).frame = 1
		door.get_child(1).disabled = false
		
func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.play("pick_up")
	$pick_up.play()
	$AudioStreamPlayer.play()
	await $AnimatedSprite2D.animation_finished
	if body.is_in_group("player"):
		queue_free()

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player") && !keyed:
		keyed = true
