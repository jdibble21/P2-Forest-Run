# Controls game progress, item pickups, scoring, and game events
extends Node2D

signal game_over

const ENEMY_NODE = preload("res://src/Enemy.tscn")

var _game_over := false
var _enemy_defeat := false

onready var _menu_screen = load("res://src/Menu.tscn")
onready var _reload_screen = load("res://src/World.tscn")
onready var _sword_pickup_animation := $AreaSwordPickup/AnimatedSprite
onready var _sword_pickup := $AreaSwordPickup
onready var _player := $Player
onready var _HUD = $Player/Camera2D/HUD
onready var _HUD_gameover_label := $Player/Camera2D/HUD/GameOverLabel
onready var _HUD_finishgame_label := $Player/Camera2D/HUD/FinishedGameLabel
onready var _HUD_swordinventory_image := $Player/Camera2D/HUD/SwordInventoryImage
onready var _HUD_swordhint_label := $Player/Camera2D/HUD/AttackHintLabel
onready var _HUD_score_label := $Player/Camera2D/HUD/FinalScoreLabel
onready var _music_loop := $MusicLoop
onready var _gameover_sound := $GameOver
onready var _win_sound := $GameWin
onready var _enemy_one

func _ready():
	_enemy_one = ENEMY_NODE.instance()
	_enemy_one.position = Vector2(1403.41,214.242)
	_enemy_one.connect("hit_player", self, "_on_player_hit")
	self.add_child(_enemy_one)
	self.connect("game_over", self, "_game_over")
	_player.connect("player_death", self, "_on_game_over")
	_player.connect("enemy1_hit", self, "_on_enemy1_defeat")
	_sword_pickup_animation.play("standby")
	_music_loop.play()
	_hide_labels()
	$AnimationPlayer.play("transition")
	
	
func _process(_delta):
	if Input.is_action_just_pressed("reload_game"):
		queue_free()
		get_tree().get_root().add_child(_reload_screen.instance())
	if Input.is_action_just_pressed("return_to_menu"):
		queue_free()
		get_tree().get_root().add_child(_menu_screen.instance())
		
		
func _on_player_hit():
	emit_signal("game_over")
	$Player/AnimatedSprite.play("death")
	_on_game_over()
	
	
func _hide_labels():
	_HUD_gameover_label.hide()
	_HUD_swordinventory_image.hide()
	_HUD_swordhint_label.hide()
	_HUD_finishgame_label.hide()
	_HUD_score_label.hide()
	
	
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
	
	
func _on_game_over():
	_game_over = true
	_player.set_physics_process(false)
	_HUD_gameover_label.show()
	_HUD.set_process(false)
	_music_loop.stop()
	_gameover_sound.play()
	_calculate_score()
	_HUD_score_label.show()


func _on_FinishArea_entered(_area):
	_music_loop.stop()
	_player.set_physics_process(false)
	_HUD_finishgame_label.show()
	_HUD.set_process(false)
	_win_sound.play()
	_calculate_score()
	_HUD_score_label.show()
	
	
func _calculate_score():
	var total_score
	var time_value = $Player/Camera2D/HUD.rounded_time
	var time_score = _get_time_score(time_value)
	total_score = time_score
	if $Player.has_sword:
		total_score = total_score + 15
	if _enemy_defeat:
		total_score = total_score + 20
	if !_game_over:
		total_score = total_score + 6
	_HUD_score_label.text = "Score: " + str(total_score)
	
	
func _get_time_score(time):
	var score = 0
	if !_game_over:
		if time <= 15:
			score = 25
		if time >= 16 and time < 18:
			score = 17
		if time >= 18 and time < 20:
			score = 13
		if time >= 20 and time < 25:
			score = 10
		if time >=26:
			score = 5
	if _game_over:
		score = 3
	return score
