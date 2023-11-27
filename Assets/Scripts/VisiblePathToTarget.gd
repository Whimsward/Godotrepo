extends Line2D

@export var source : CharacterBody2D
@export var target : Marker2D

func draw_path():
	set_point_position(0,source.position)
	set_point_position(1,target.position)
	
func _process(delta):
	draw_path()
