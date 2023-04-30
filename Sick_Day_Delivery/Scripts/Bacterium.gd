extends Area2D

signal on_enemy_ded

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(_body):
	await $MobAudioController.act(0)
	emit_signal("on_enemy_ded")
	queue_free()
