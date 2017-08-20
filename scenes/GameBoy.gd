extends Control

export(PackedScene) var main_scene
export(bool) var palette_limit = true
export(bool) var grid = true
export(bool) var glass = true
export(bool) var sun = true

func _ready():
	get_node("game-control/view").add_child(main_scene.instance())
	get_node("Palette").set_hidden(not palette_limit)
	get_node("Grid").set_hidden(not grid)
	get_node("Glass").set_hidden(not glass)
	get_node("TheSun").set_hidden(not sun)
