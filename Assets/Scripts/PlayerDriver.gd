class_name Player
extends CharacterBody2D

@onready var AnimSprite = $AnimatedSprite2D

@export var movement_data : PlayerMovementData
@export var atk_data : AttackData
@export var Has_Pal = false

#signal attacking

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	apply_gravity(delta)
	handle_jump()
	var direction = Input.get_axis("Left", "Right")
	handle_acceleration(direction,delta)
	animate(direction)
	flip_player(direction)
	move_and_slide()

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
func handle_jump():
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			velocity.y = movement_data.jump_velocity
	else:
		if Input.is_action_just_released("Jump") and velocity.y < movement_data.jump_velocity / 2:
			velocity.y = movement_data.jump_velocity / 2

func handle_acceleration(direction,delta):
	if direction != 0:
		velocity.x = move_toward(velocity.x, movement_data.speed * direction, movement_data.acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x,0,movement_data.friction * delta)
		
func animate(direction):
	if direction:
		AnimSprite.play("Walk")
		#adjust walk to include idle frames
	else:	
		AnimSprite.play("Idle")
		
	if not is_on_floor():
		AnimSprite.play("Lev")

func flip_player(direction):
	if direction < 0:
		AnimSprite.set_flip_h(true)
	else:
		AnimSprite.set_flip_h(false)	

func player_attack():
	pass
