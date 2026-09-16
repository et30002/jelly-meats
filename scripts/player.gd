extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -700.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var knife_collision: CollisionShape2D = $AnimatedSprite2D/KnifeHit/KnifeCollision



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	
	# Flip the sprite.
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations.
	# Enable attack collision box.
	if Input.is_action_just_pressed("attack"):
		knife_collision.disabled = false
		animated_sprite.play("attack")
		await animated_sprite.animation_finished
	elif direction == 0:
		knife_collision.disabled = true
		animated_sprite.play("idle")
	
	# Move the sprite.
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		


	move_and_slide()
