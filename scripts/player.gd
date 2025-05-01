extends CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

'''Notes:
physics_process runs at a fixed rate 60 times per second by default and helps physics run 
smoothly. Is great for physics bodies/anything that moves/collides with its environment.'''

func _physics_process(delta: float) -> void:	
	#If the player is not standing on a platform, we add gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	#If we press w and the player is on a platform we jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	
	#Change Flip-h in accordance to the direction of the player
	if direction > 0: 	#Moving to the right
		animated_sprite.flip_h = false
	elif direction < 0:	#Moving to the left
		animated_sprite.flip_h = true

	#Play movement animations
	if is_on_floor():	#If the player is standing on the floor
		if direction == 0: #Player standing still
			animated_sprite.play("idle")
		else:	#If not then do the run animation
			animated_sprite.play("run")
	else:	#Else we are in the air
		animated_sprite.play("jump")
		
	

	#Apply the movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
