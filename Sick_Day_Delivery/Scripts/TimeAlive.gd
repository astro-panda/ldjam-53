extends Label

var time

# Called when the node enters the scene tree for the first time.
func _ready():
	time = 0

func _on_timer_timeout():
	time += 1
	var minutes = time/60
	var seconds = time%60
	text = "%d:%02d" %[minutes, seconds]
