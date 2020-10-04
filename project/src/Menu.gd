extends Node2D

var _gameplay_scene = preload("res://src/World.tscn").instance()

func _on_Play_Button_pressed():
	queue_free()
	get_tree().get_root().add_child(_gameplay_scene)
	
