class_name Overlay
extends Node
##Defines the Overlay class's functions.##
#Establish variables for child node presses and sibling signals, both of which \
#should hide the overlay and disable its nodes.#

@export var close : Button
@export var disabler : VisibleOnScreenEnabler2D
@export var open : Page

# Called when the node enters the scene tree for the first time.
func _ready():
	open_overlay()
	close_overlay()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func close_overlay():
	if close.button_up or disabler.screen_exited:
		self.hide()
	else:
		return

func open_overlay():
	if open.knock:
		self.show()
		
func hide():
	pass
	
func show():
	pass
