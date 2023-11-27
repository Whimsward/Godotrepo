extends Page

@onready var world = preload("res://Assets/Scenes/world.tscn")
@onready var test = preload("res://Assets/Scenes/test_zone.tscn")


func _ready():
	pass
		
func _on_start_index_pressed(index):
	if index == 0:
		next_scene = world
		$SceneManager.load_chosen_zone(next_scene)
	if index == 1:
		next_scene = test
		$SceneManager.load_chosen_zone(next_scene)



