# Controls game progress, item pickups, and game events
extends Node2D

signal game_over
const ENEMY_NODE = preload("res://src/Enemy.tscn")

onready var _menu_screen = load("res://src/Menu.tscn")
onready var _sword_pickup_animation := $AreaSwordPickup/AnimatedSprite
onready var _sword_pickup := $AreaSwordPickup
onready var _player := $Player
onready var _HUD_gameover_label := $Player/Camera2D/HUD/GameOverLabel
onready var _HUD_finishgame_label := $Player/Camera2D/HUD/FinishedGameLabel
onready var _HUD_swordinventory_image := $Player/Camera2D/HUD/SwordInventoryImage
onready var _HUD_swordhint_label := $Player/Camera2D/HUD/AttackHintLabel
onready var _music_loop := $MusicLoop
onready var _gameover_sound = $GameOver
onready var _win_sound = $GameWin
onready var _enemy_one

func _ready():
	_enemy_one = ENEMY_NODE.instance()
	_enemy_one.position = Vector2(1403.41,214.242)
	_enemy_one.id = 1
	_enemy_one.connect("hit_player", self, "_on_player_hit")
	_enemy_one.connect("defeated", self, "_on_enemy_defeat")
	self.add_child(_enemy_one)
	self.connect("game_over", self, "_game_over")
	_player.connect("player_death", self, "_game_over")
	_player.connect("enemy1_hit", self, "_on_enemy1_defeat")
	_sword_pickup_animation.play("standby")
	_music_loop.play()
	_hide_labels()
	$AnimationPlayer.play("transition")
	
	
func _process(_delta):
	if Input.is_action_just_pressed("reload_game"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("return_to_menu"):
		queue_free()
		get_tree().get_root().add_child(_menu_screen.instance())
		
		
func _on_player_hit():
	emit_signal("game_over")
	$Player/AnimatedSprite.play("death")
	_player.set_physics_process(false)
	
func _hide_labels():
	_HUD_gameover_label.hide()
	_HUD_swordinventory_image.hide()
	_HUD_swordhint_label.hide()
	_HUD_finishgame_label.hide()

func _on_enemy1_defeat():
	_enemy_one._defeat()
	
	
func _on_sword_area_entered(_area):
	_sword_pickup.hide()
	$Player.has_sword = true
	_HUD_swordinventory_image.show()
	var timer = Timer.new()
	timer.set_wait_time(5)
	_HUD_swordhint_label.show()
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	_HUD_swordhint_label.hide()
	
	
func _game_over():
	_HUD_gameover_label.show()
	_music_loop.stop()
	_gameover_sound.play()


func _on_FinishArea_entered(area):
	_music_loop.stop()
	_HUD_finishgame_label.show()
	_win_sound.play()
