# Controls game progress, item pickups, and game end scenarios
extends Node2D

onready var _sword_pickup_animation := $AreaSwordPickup/AnimatedSprite
onready var _sword_pickup := $AreaSwordPickup
onready var _player := $Player
onready var _HUD_gameover_label := $Player/Camera2D/HUD/GameOverLabel
onready var _HUD_finishgame_label := $Player/Camera2D/HUD/FinishedGameLabel
onready var _HUD_swordinventory_image := $Player/Camera2D/HUD/SwordInventoryImage
onready var _HUD_swordhint_label := $Player/Camera2D/HUD/AttackHintLabel
onready var _music_loop := $MusicLoop

func _ready():
	_player.connect("player_death", self, "_game_over")
	_sword_pickup_animation.play("standby")
	_HUD_gameover_label.hide()
	_HUD_swordinventory_image.hide()
	_HUD_swordhint_label.hide()
	_HUD_finishgame_label.hide()
	_music_loop.play()
	
func _process(_delta):
	if Input.is_action_just_pressed("reload_game"):
		get_tree().reload_current_scene()


func _on_Area2D_area_entered(_area):
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


func _on_FinishArea_entered(area):
	_HUD_finishgame_label.show()
