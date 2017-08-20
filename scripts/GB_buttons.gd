extends Node2D

export(bool) var debug = false
var test_actions = InputMap.get_actions()

func _ready():
	set_process(debug)

func _process(delta):
	for action in test_actions:
		if Input.is_action_pressed(action):
			prints(action, Input.is_action_pressed(action))
