extends CanvasLayer

@export var current_level = "res://scene/levels/level1.tscn"
@export var next_level = "res://scene/levels/level2.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_replay_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file(current_level)
	pass # Replace with function body.


func _on_nextlevel_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file(next_level)
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/menu.tscn")
	pass # Replace with function body.


func _on_level_finished_body_entered(body: Node2D) -> void:
	get_tree().paused = true
	$LevelComplete3.play()
	show()
	pass # Replace with function body.
