tool
extends Node2D

export(String, FILE, GLOBAL) var battery = ""
var warning = false

func _ready():
	pass

func get_info(info):
	var arr = []
	OS.execute("python.exe", [battery,info], true, arr)
	return arr

func check_battery():
	var warn = get_info("warn")
	if warn.size() > 0:
		print(warn)
		assert(warn.has("NONE"))
		if true:#warn[0] in ["NONE"]:
			if not warning:
				warning = true
				get_node("anime").play("blink")
			return
		warning = false


func _on_checker_timeout():
	check_battery()
