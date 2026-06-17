extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"CharacterBody2D/pause-menu".hide()
	$Timer.start()
	$CharacterBody2D/health.text = "Health: ❤️❤️❤️"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CharacterBody2D/time_left.text = "Time left: %.2f" %($Timer.time_left)
	if $CharacterBody2D.life == 0:
		# replace this with a "Try again" scene or something
		get_tree().change_scene_to_file("res://scene/main.tscn")
	pass


func _on_timer_timeout() -> void:
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != $CharacterBody2D:
		return
	$CharacterBody2D.life -= 1
	
	var tmp = $CharacterBody2D/health.text 
	$CharacterBody2D/health.text = tmp.left(-2)
	
	pass # Replace with function body.
