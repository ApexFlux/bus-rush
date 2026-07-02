extends CharacterBody2D
var ghost_wrapped_time: float = 0.0

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
@export var last_checkpoint : Vector2
@export var life = 3

@export var DASH_SPEED = 450.0
var is_dashing: bool = false
var dash_direction = 1
var cooled_down = true

@onready var anim = $AnimationPlayer
@onready var sprite = $AnimatedSprite2D # Grab this once to keep code clean
@onready var dash_timer = $DashTimer

func die() -> void:
	anim.play("die")

func move_to_last_checkpoint() -> void:
	position = last_checkpoint

func _physics_process(delta: float) -> void:
	# --- 1. APPLY GRAVITY ---
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# --- 2. HANDLE JUMP ---
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if is_on_wall():
		if Input.is_action_just_pressed("move_jump"):
			velocity.y = JUMP_VELOCITY
	# --- 3. HANDLE MOVEMENT ---
	var direction := Input.get_axis("move_left", "move_right")
	
	# Handle Dash
	if Input.is_action_just_pressed("dash") and not is_dashing and cooled_down:
		start_dash(direction)
	
	if direction:
		velocity.x = direction * SPEED
		
		# Flip the sprite visually based on direction
		if direction < 0:
			sprite.flip_h = true
		elif direction > 0:
			sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if is_dashing:
		velocity.x = DASH_SPEED*direction
	
	ghost_wrapped_time += delta
	if ghost_wrapped_time >= 0.1 and is_dashing:
		spawn_ghost()
		ghost_wrapped_time = 0.0
	#move_and_slide()
	# --- 4. MOVE THE CHARACTER ---
	move_and_slide()
	# --- 5. HANDLE ANIMATIONS ---
	# We do this last so the animations don't fight each other!
	if not is_on_floor():
		# If moving up, play jump. If moving down, play fall.
		if velocity.y < 0:
			anim.play("jump")
		else:
			anim.play("fall")
	else:
		# If on the floor, check if we are moving horizontally
		if direction != 0:
			anim.play("run")
		else:
			anim.play("idle")

func spawn_ghost():
	var ghost = AnimatedSprite2D.new()
	
	# Copy the sprite frames and configuration
	ghost.sprite_frames = $AnimatedSprite2D.sprite_frames
	ghost.animation = $AnimatedSprite2D.animation
	ghost.frame = $AnimatedSprite2D.frame
	ghost.flip_h = $AnimatedSprite2D.flip_h
	
	# Match the player's exact transform/position
	ghost.global_position = global_position
	ghost.rotation = rotation
	ghost.scale = scale
	
	# Give it a ghostly blue tint
	ghost.modulate = Color(0.3, 0.6, 1.0, 0.6) 
	ghost.show_behind_parent = true
	#ghost.z_index = $AnimatedSprite2D.z_index-1 # z_index - 1
	# Attach the fading logic script
	ghost.set_script(preload("res://scene/dash_ghost.gd"))
	
	# Add it to the world (parent), so it stays put while the player moves away
	get_parent().add_child(ghost)

func start_dash(dir: float):
	is_dashing = true
	
	# Determine dash direction. Default to the way the player is facing 
	# if they aren't holding left or right.
	#if dir != 0:
	#	dash_direction = Vector2(dir, 0).normalized()
	#else:
		# Fallback: Check which way your sprite is facing if standing still
	#	dash_direction = Vector2(-1 if $Sprite2D.flip_h else 1, 0)
	
	dash_timer.start()
	
func _on_dash_timer_timeout() -> void:
	is_dashing = false
	cooled_down = false
	$DashTimer/cooldown_timer.start()
	velocity.x = SPEED


func _on_cooldown_timer_timeout() -> void:
	cooled_down = true
