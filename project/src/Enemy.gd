extends KinematicBody2D

const SPEED = 80
const GRAVITY = 30
var _move_direction = 0
var elapsed = 0
var _velocity = Vector2(0,0)
onready var _animation_control = $AnimatedSprite
onready var _path_follow = get_parent()

func _process(delta):
	_patrol(delta)
	
func _patrol(delta):
	_animation_control.play("patrol")
	elapsed = elapsed + delta
	print(elapsed)
	if elapsed < 5.0: 
		_velocity.x = SPEED
		_animation_control.flip_h = true
	elif elapsed >= 5.0:
		_velocity.x = -SPEED
		_animation_control.flip_h = false
	if elapsed >= 10.0:
		elapsed = 0
	_velocity = move_and_slide(_velocity)
	_velocity.x = lerp(_velocity.x,0,0.5)
