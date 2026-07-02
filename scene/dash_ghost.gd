extends AnimatedSprite2D

func _ready():
	# Stop the ghost from playing the animation further
	stop() 
	
	# Fade the ghost out over 0.2 seconds, then delete it
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	tween.tween_callback(queue_free)
