extends KinematicBody2D

const SPEED = 100
const GRAVITY = 30
var _velocity = Vector2(0,0)
onready var _animation_control = $AnimatedSprite


func _ready():
	_act()
	pass
	
func _act():
	_patrol_left()
	print("moving left...")
	move_and_slide(_velocity)
	
	var timer = Timer.new()
	timer.set_wait_time(5)
	add_child(timer)
	timer.start()
	yield(timer, "timeout")

	_patrol_right()
	print("moving right...")
	move_and_slide(_velocity)
	
	timer = Timer.new()
	timer.set_wait_time(5)
	
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	
func _patrol_left():
	_velocity.x = -SPEED
	
func _patrol_right():
	_velocity.x = SPEED
