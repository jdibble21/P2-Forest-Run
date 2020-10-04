extends Node2D

var _gameplay_scene = preload("res://src/World.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Play_Button_pressed():
	queue_free()
	get_tree().get_root().add_child(_gameplay_scene)
	
