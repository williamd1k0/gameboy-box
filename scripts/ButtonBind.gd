extends Button

export(StringArray) var bind_actions = []

func _ready():
	set_opacity(0)
	connect("button_down", self, "_on_button_pressed")
	connect("button_up", self, "_on_button_released")


func _on_button_pressed():
	prints(self, bind_actions, "PRESSED")
	for action in bind_actions:
		Input.action_press(action)

func _on_button_released():
	prints(self, bind_actions, "RELEASED")
	for action in bind_actions:
		Input.action_release(action)
