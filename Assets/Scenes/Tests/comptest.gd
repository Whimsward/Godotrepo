extends Node2D

@onready var floor_collide = $TestFloor/CollisionShape2D
@onready var see_the_floor = $TestFloor/CollisionShape2D/Polygon2D

func _ready():
	see_the_floor.polygon = floor_collide.polygon
