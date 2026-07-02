extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"CharacterBody2D/pause-menu".hide()
	$"CharacterBody2D/level-finished".current_level = "res://scene/levels/level3.tscn"
	$"CharacterBody2D/level-finished".next_level = "res://scene/levels/level3.tscn"
	$"CharacterBody2D/game-over".hide()
	$Timer.start()
	$"CharacterBody2D/level-finished".hide()
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
	
	var tmp = $CharacterBody2D/health.text
	$CharacterBody2D.move_to_last_checkpoint()
	$CharacterBody2D/health.text = tmp.left(-2)
	
	pass # Replace with function body.


func _on_level_finished_body_entered(body: Node2D) -> void:
	
	pass # Replace with function body.


func _on_checkpoint_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_2_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint2/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_3_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint3/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_4_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint4/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_5_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint5/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_6_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint6/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_7_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint7/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_8_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint8/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_9_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint9/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_10_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint10/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_11_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint11/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_12_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint12/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_13_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint13/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_14_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint14/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_15_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint15/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_16_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint16/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_17_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint17/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_18_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint18/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_19_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint19/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_20_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint20/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_21_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint21/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_22_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint22/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_23_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint23/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_24_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint24/CollisionShape2D".position
	pass # Replace with function body.


func _on_checkpoint_25_body_entered(body: Node2D) -> void:
	$CharacterBody2D.last_checkpoint = $"checkpoint25/CollisionShape2D".position
	pass # Replace with function body.
