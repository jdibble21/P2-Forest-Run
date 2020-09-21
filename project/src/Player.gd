# Controls player movement and processes physics
extends KinematicBody2D

const SPEED = 180
const GRAVITY = 30
const JUMPFORCE = -900
var _velocity = Vector2(0,0)
onready var _animation_control = $AnimatedSprite

func _ready():
	_animation_control.play("idle")
	
	
func _physics_process(delta):
	if _velocity.x == 0 and _velocity.y > 0:
		_animation_control.play("idle")
	if Input.is_action_pressed("move_right"):
		_velocity.x = SPEED 
		_animation_control.play("run")
	elif Input.is_action_just_released("move_right"):
		_animation_control.play("idle")
	if Input.is_action_pressed("move_left"):
		_velocity.x = -SPEED
		_animation_control.play("run")
	elif Input.is_action_just_released("move_left"):
		_animation_control.play("idle")
	_velocity.y = _velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump"):
		_velocity.y = JUMPFORCE
		_animation_control.play("jump")
		
	_velocity = move_and_slide(_velocity)
	_velocity.x = lerp(_velocity.x,0,0.5)
