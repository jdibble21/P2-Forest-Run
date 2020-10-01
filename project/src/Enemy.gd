# Contains logic for enemy patrol path, and checks for combat with player
extends KinematicBody2D

signal hit_player
signal defeated

const SPEED := 50
const GRAVITY := 30

var _move_direction := 0
var elapsed = 0 
var _attck_anim = 0
var _idle_check = true
var _player_detected := false
var _velocity := Vector2(0,0)

export var _patrol_distance := 4.0

onready var _animation_control := $AnimatedSprite
onready var _detection_box := $Area2D/CollisionShape2D

func _ready():
	pass
	
func _process(delta):
	_patrol(delta)
	
	
func _patrol(delta):
	if _player_detected:
		if _idle_check:
			_animation_control.play("idle")
		_attck_anim = _attck_anim + delta
		_velocity = Vector2(0,0)
		_velocity = move_and_slide(_velocity,Vector2.UP)
		_velocity.x = lerp(_velocity.x,0,0.5)
		if _attck_anim > 1.5 and _attck_anim < 2.0:
			_idle_check = false
			_attack()
		if _attck_anim > 2.0:
			_player_detected = false
			_attck_anim = 0
			_idle_check = true
		return
	_animation_control.play("patrol")
	elapsed = elapsed + delta
	if elapsed < _patrol_distance: 
		_velocity.x = SPEED
		_animation_control.flip_h = true
		_detection_box.position = Vector2(14,-1.231)
	elif elapsed >= _patrol_distance:
		_velocity.x = -SPEED
		_animation_control.flip_h = false
		_detection_box.position = Vector2(-14,-1.231)
	if elapsed >= _patrol_distance * 2:
		elapsed = 0
	_velocity.y = _velocity.y + GRAVITY
	_velocity = move_and_slide(_velocity,Vector2.UP)
	_velocity.x = lerp(_velocity.x,0,0.5)
	
	
func _attack():
	_idle_check = false
	_animation_control.play("attack")
	if _player_detected:
		emit_signal("hit_player")
		
	
func _enemy1_has_been_defeated():
	#_enemy1.set_process(false)
	#_enemy1_animator.play("death")
	#get_node("/root/World/Enemy1/CollisionShape2D").disabled = true
	pass
	
	
func _enemy2_has_been_defeated():
	#_enemy2.set_process(false)
	#_enemy2_animator.play("death")
	#get_node("/root/World/Enemy2/CollisionShape2D").disabled = true
	pass
	
	
func _on_Area2D_area_entered(_area):
	_player_detected = true
	

func _on_Area2D_area_exited(_area):
	_player_detected = false
