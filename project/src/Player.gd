# Controls player movement and processes physics
extends KinematicBody2D

signal player_death
const SPEED = 180
const GRAVITY = 30
const JUMPFORCE = -550
var _velocity = Vector2(0,0)
onready var has_sword
onready var _node_enemy_1 = get_node("/root/World/Enemy1")
onready var _animation_control = $AnimatedSprite

func _ready():
	has_sword = false
	_play_idle_animation()
	_node_enemy_1.connect("_hit_player", self, "_on_player_hit")
	
func _physics_process(delta):
	if is_on_floor() and (!Input.is_action_pressed("move_left") and (!Input.is_action_pressed("move_right"))):
		_play_idle_animation()
	if Input.is_action_pressed("move_right"):
		_velocity.x = SPEED 
		_animation_control.play("run")
		_animation_control.flip_h = false
	elif Input.is_action_just_released("move_right"):
		_play_idle_animation()
	if Input.is_action_pressed("move_left"):
		_velocity.x = -SPEED
		_animation_control.flip_h = _velocity.x < 0
		_animation_control.play("run")
	elif Input.is_action_just_released("move_left"):
		_play_idle_animation()
	_velocity.y = _velocity.y + GRAVITY
	if not is_on_floor():
		_animation_control.play("jump")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_velocity.y = JUMPFORCE
	_velocity = move_and_slide(_velocity,Vector2.UP)
	_velocity.x = lerp(_velocity.x,0,0.5)


func _play_idle_animation():
	if has_sword:
		_animation_control.play("idle_sword")
	if !(has_sword):
		_animation_control.play("idle")


func _on_player_hit():
	_animation_control.play("death")
	set_physics_process(false)
	
	
func _on_Area2D_area_entered(area):
	pass
