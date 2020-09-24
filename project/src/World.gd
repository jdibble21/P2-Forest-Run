extends Node2D

onready var _sword_pickup_animation = $CollectableSword/AnimatedSprite
onready var _sword_pickup = $CollectableSword

func _ready():
	_sword_pickup_animation.play("standby")


func _on_Area2D_area_entered(area):
	_sword_pickup.hide()
	$Player.has_sword = true
	
