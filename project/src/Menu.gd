# Handles button press to switch to gameplay screen, and applies
# transition animation
extends Node2D

var _gameplay_scene = preload("res://src/World.tscn")

func _ready():
	$TransitionLayer.hide()
	$AnimationPlayer.play("title_loop")
	
	
func _on_Play_Button_pressed():
	$TransitionLayer.show()
	$Camera2D/HUD/Button.hide()
	$Camera2D/HUD/TitleLabel.hide()
	$Camera2D/HUD/NoteLabel.hide()
	$Camera2D/HUD/CreatedLabel.hide()
	var timer = Timer.new()
	timer.set_wait_time(1.5)
	add_child(timer)
	timer.start()
	$AnimationPlayer.play("transition")
	yield(timer, "timeout")
	queue_free()
	get_tree().get_root().add_child(_gameplay_scene.instance())
