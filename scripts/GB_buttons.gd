extends Node2D

var action_prefix = "GB_"
var buttons = [
	"A",
	"B",
	"Start",
	"Select",
	"Up",
	"Down",
	"Left",
	"Right"
]

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var i = 0
	for button in buttons:
		if get_child(i).is_pressed():
			Input.action_press(action_prefix+button)
		else:
			Input.action_release(action_prefix+button)