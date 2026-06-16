extends CanvasLayer

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	
func _process(delta: float) -> void:
	testEsc()

func pause():
	show()
	get_tree().paused = true
	#$AnimationPlayer.play_backwards("blur")

func resume():
	hide()
	get_tree().paused = false
	#$AnimationPlayer.play("blur")
	
func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()
		
func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/main.tscn")
