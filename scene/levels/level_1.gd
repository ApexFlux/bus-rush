extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"CharacterBody2D/game-over".hide()
	$"CharacterBody2D/pause-menu".hide()
	$Timer.start()
	$CharacterBody2D/health.text = "Health: ❤️❤️❤️"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CharacterBody2D/time_left.text = "Time left: %.2f" %($Timer.time_left)
	if $CharacterBody2D.life == 0:
		game_over()
	pass

func game_over() -> void:
	get_tree().paused = true
	$"CharacterBody2D/game-over".last_scene = "res://scene/levels/level1.tscn"
	$"CharacterBody2D/game-over".show()

func _on_timer_timeout() -> void:
	game_over()
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != $CharacterBody2D:
		return
	$CharacterBody2D.life -= 1
	
	var tmp = $CharacterBody2D/health.text 
	$CharacterBody2D/health.text = tmp.left(-2)
	
	pass # Replace with function body.
