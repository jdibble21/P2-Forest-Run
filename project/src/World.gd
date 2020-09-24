extends Node2D

onready var _sword_pickup_animation = $CollectableSword/AnimatedSprite
onready var _sword_pickup = $CollectableSword
onready var _node_player = $Player
onready var _node_enemy = $Enemy1

func _ready():
	_sword_pickup_animation.play("standby")


func _on_Area2D_area_entered(area):
	_sword_pickup.hide()
	$Player.has_sword = true
	
