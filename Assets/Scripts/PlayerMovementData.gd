class_name PlayerMovementData
extends Resource
##Serves as a class to define variables for movement of characters 
##directed by the player or relative to their avatar.##


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export_category("Speed")
@export var speed : float = 100
@export var jump_velocity : float = -300
@export var acceleration : float = 600
@export var friction : float = 1000

@export_category("Gravity")
@export var has_gravity = true
@export var gravity_scale : float = 1




