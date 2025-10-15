extends Area2D

var is_switched = false
@onready var bridge = get_node("../bridge")

func _process(delta: float) -> void:
	if !is_switched:
		$levier.play("fermer")
	else:
		$levier.play("ouvert")
		bridge.get_child(0).play()
		await bridge.get_child(0).animation_finished
		bridge.get_child(0).frame = 4

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player") && !is_switched:
		is_switched = true
		bridge.show()
		
