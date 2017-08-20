extends Node2D

export(bool) var debug = false

func _ready():
	set_process(debug)

func _process(delta):
	for button in get_children():
		if Input.is_action_pressed(button.bind_action):
			prints(button.bind_action, Input.is_action_pressed(button.bind_action))
