# Controls player movement and processes physics
extends KinematicBody2D

const SPEED = 180
const GRAVITY = 30
const JUMPFORCE = -550
var _velocity = Vector2(0,0)
var _is_defeated = false
var _has_sword = false
onready var _animation_control = $AnimatedSprite

func _ready():
	_animation_control.play("idle")
	
	
func _physics_process(delta):
	if is_on_floor() and (!Input.is_action_pressed("move_left") and (!Input.is_action_pressed("move_right"))):
		_animation_control.play("idle")
	if Input.is_action_pressed("move_right"):
		_velocity.x = SPEED 
		_animation_control.play("run")
		_animation_control.flip_h = false
	elif Input.is_action_just_released("move_right"):
		_animation_control.play("idle")
	if Input.is_action_pressed("move_left"):
		_velocity.x = -SPEED
		_animation_control.flip_h = _velocity.x < 0
		_animation_control.play("run")
	elif Input.is_action_just_released("move_left"):
		_animation_control.play("idle")
	_velocity.y = _velocity.y + GRAVITY
	
	if not is_on_floor():
		_animation_control.play("jump")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_velocity.y = JUMPFORCE
		
	_velocity = move_and_slide(_velocity,Vector2.UP)
	_velocity.x = lerp(_velocity.x,0,0.5)

func _play_idle_animation():
	if _has_sword:
		pass
		#play sword idle
	if !(_has_sword):
		pass
		_animation_control.play("idle")


func _on_Area2D_area_entered(area):
	pass
