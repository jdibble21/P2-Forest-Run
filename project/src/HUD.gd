extends CanvasLayer

var _time := 0.0
var rounded_time
onready var _time_label := $TimerLabel
# Called when the node enters the scene tree for the first time.

func _process(delta):
	_time += delta
	rounded_time = int(_time)
	_time_label.text = "Time: " + str(rounded_time)
