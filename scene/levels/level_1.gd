extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"CharacterBody2D/pause-menu".hide()
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CharacterBody2D/Label.text = "Time left: %.2f" %($Timer.time_left)
	pass


func _on_timer_timeout() -> void:
	pass # Replace with function body.
