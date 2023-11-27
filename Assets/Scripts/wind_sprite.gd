class_name Pal
extends CharacterBody2D

@export var Has_player = true
@onready var player = get_parent()
@export var MovementData : PlayerMovementData
@export var here = position

# Do I need to reference gravity?
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	apply_gravity(delta)
	handle_direct_movement()
#	follow()
#	animate()
	move_and_slide()

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += (gravity * MovementData.gravity_scale) * delta

#func animate():
#	var movin = Input.get_axis("Left","Right")
	#if movin:
#		$AnimatedSprite2D.play("Flit")
#	else:
#		$AnimatedSprite2D.play("Idle")

func handle_direct_movement():
	if Has_player == false:
		var direction = Input.get_axis("Left", "Right")
		if direction:
			velocity.x = direction * MovementData.speed
		else:
			velocity.x = move_toward(velocity.x, 0, MovementData.speed)
		drift()
	else:
		return

func follow():
	pass

func drift():
	if Input.is_action_pressed("Jump"):
		velocity.y = MovementData.jump_velocity
		pass
