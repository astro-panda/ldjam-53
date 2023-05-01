extends Control

@export var menu : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("cure"):
		if $CanvasLayer/PlayerCell/Pills.emitting == false:
			$CanvasLayer/PlayerCell/Pills.restart()
			$CanvasLayer/PlayerCell/Pills.emitting = true


func _on_return_pressed():
	get_tree().change_scene_to_packed(menu)
