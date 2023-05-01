extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$GPUParticles2D.emitting = true
	$CureTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_cure_area_2d_area_entered(area):
	if(area.has_method("destroy_colony")):
		area.destroy_colony()	


func _on_cure_area_2d_body_entered(body):
	if(body.has_method("destroy_bacteria")):
		body.destroy_bacteria()

func _on_cure_timer_timeout():
	queue_free()
