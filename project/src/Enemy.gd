extends KinematicBody2D

const SPEED = 50
const GRAVITY = 30
export var _patrol_distance = 4.0
var _move_direction = 0
var elapsed = 0
var _attck_anim = 0
var _player_detected = false
var _velocity = Vector2(0,0)
onready var _animation_control = $AnimatedSprite
onready var _path_follow = get_parent()

func _process(delta):
	_patrol(delta)
	
	
func _patrol(delta):
	if _player_detected:
		_attck_anim = _attck_anim + delta
		_attack()
		if _attck_anim > 1.0:
			_player_detected = false
		return
	_animation_control.play("patrol")
	elapsed = elapsed + delta
	if elapsed < _patrol_distance: 
		_velocity.x = SPEED
		_animation_control.flip_h = true
	elif elapsed >= _patrol_distance:
		_velocity.x = -SPEED
		_animation_control.flip_h = false
	if elapsed >= _patrol_distance * 2:
		elapsed = 0
	_velocity.y = _velocity.y + GRAVITY
	_velocity = move_and_slide(_velocity,Vector2.UP)
	_velocity.x = lerp(_velocity.x,0,0.5)
	
	
func _attack():
	_velocity = Vector2(0,0)
	_velocity = move_and_slide(_velocity,Vector2.UP)
	_velocity.x = lerp(_velocity.x,0,0.5)
	_animation_control.play("attack")
	
	
func _has_been_defeated():
	pass


func _on_Area2D_area_entered(area):
	_player_detected = true
	
