extends State
class_name PalIdle

@export var pal : Pal
@export var move_speed := 75
var player : Player

func Enter():
	if player.is_inside_tree():
		player = get_tree().get_first_node_in_group("Aloft_Alt")
	else:
		return	
			
func Update(delta: float):
	pass
	
func Physics_Update(delta: float):
	var direction = player.global_position - pal.global_position
	
	if direction.length() > 75:
		pal.velocity = direction.normalized() * move_speed
	else:
		pal.velocity = Vector2()
