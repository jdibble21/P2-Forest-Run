extends Node2D

onready var _sword_pickup_animation = $CollectableSword/AnimatedSprite

func _ready():
	_sword_pickup_animation.play("standby")

