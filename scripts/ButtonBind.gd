extends Button

export(String) var bind_action = ''

func _ready():
	set_opacity(0)
	connect("button_down", self, "_on_button_pressed")
	connect("button_up", self, "_on_button_released")


func _on_button_pressed():
	prints(self, bind_action, "PRESSED")
	Input.action_press(bind_action)

func _on_button_released():
	prints(self, bind_action, "RELEASED")
	Input.action_release(bind_action)
