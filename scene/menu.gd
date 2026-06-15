extends Node2D



func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/levels/level1.tscn")

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/levels/level2.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/levels/level3.tscn")

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn")
