extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"CharacterBody2D/pause-menu".hide()
	$"CharacterBody2D/level-finished".current_level = "res://scene/levels/level3.tscn"
	$"CharacterBody2D/level-finished".next_level = "res://scene/levels/level3.tscn"
	$"CharacterBody2D/game-over".hide()
	$Timer.start()
	$"CharacterBody2D/level-finished".hide()
	$CharacterBody2D.life = 3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CharacterBody2D/Camera2D/time_left.text = "Time left: %.2f" %($Timer.time_left)
	if $CharacterBody2D.life == 0:
		game_over()
	pass

func game_over() -> void:
	get_tree().paused = true
	$"CharacterBody2D/game-over/GameOver".play()
	$"CharacterBody2D/game-over".last_scene = "res://scene/levels/level3.tscn"
	$"CharacterBody2D/game-over".show()

func _on_timer_timeout() -> void:
	game_over()
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != $CharacterBody2D:
		return
	$CharacterBody2D.life -= 1
	
	var tmp = $CharacterBody2D/Camera2D/health.text
	$CharacterBody2D.move_to_last_checkpoint()
	$CharacterBody2D/Camera2D/health.text = tmp.left(-2)
	
	pass # Replace with function body.


func _on_level_finished_body_entered(body: Node2D) -> void:
	
	pass # Replace with function body.


func _on_checkpoint_body_entered(body: Node2D) -> void:
	if body != $CharacterBody2D:
		return
	$CharacterBody2D.last_checkpoint = $CharacterBody2D.position
	pass # Replace with function body.
