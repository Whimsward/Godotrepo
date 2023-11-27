extends Node2D

func load_chosen_zone(next_scene : PackedScene):
	get_tree().change_scene_to_packed(next_scene)
