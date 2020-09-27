extends Node2D

onready var _sword_pickup_animation = $CollectableSword/AnimatedSprite
onready var _sword_pickup = $CollectableSword
onready var _node_player = $Player
onready var _node_enemy1 = $Enemy1
onready var _node_enemy2 = $Enemy2
onready var _node_HUD_gameover_label = $Player/Camera2D/HUD/GameOverLabel
onready var _node_HUD_finishgame_label = $Player/Camera2D/HUD/FinishedGameLabel
onready var _node_HUD_swordinventory_image = $Player/Camera2D/HUD/SwordInventoryImage
onready var _node_HUD_swordhint_label = $Player/Camera2D/HUD/AttackHintLabel

func _ready():
	_node_player.connect("player_death", self, "_game_over")
	_sword_pickup_animation.play("standby")
	_node_HUD_gameover_label.hide()
	_node_HUD_swordinventory_image.hide()
	_node_HUD_swordhint_label.hide()
	_node_HUD_finishgame_label.hide()
	
	
func _process(delta):
	if Input.is_action_just_pressed("reload_game"):
		get_tree().reload_current_scene()


func _on_Area2D_area_entered(area):
	_sword_pickup.hide()
	$Player.has_sword = true
	_node_HUD_swordinventory_image.show()
	var timer = Timer.new()
	timer.set_wait_time(5)
	_node_HUD_swordhint_label.show()
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	_node_HUD_swordhint_label.hide()
	
	
func _game_over():
	_node_HUD_gameover_label.show()
	

func _on_FinishArea_entered(area):
	_node_HUD_finishgame_label.show()
