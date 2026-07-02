extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
@export var last_checkpoint : Vector2

@export var life = 3

@onready var anim = $AnimationPlayer
@onready var sprite = $AnimatedSprite2D # Grab this once to keep code clean

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
	
	if direction:
		velocity.x = direction * SPEED
		
		# Flip the sprite visually based on direction
		if direction < 0:
			sprite.flip_h = true
		elif direction > 0:
			sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
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
