extends Button

var scene = preload("res://game.tscn")

func _on_button_down() -> void:
	print("Starting Game Scene")
	var game = scene.instantiate()
	get_parent()._hide_main_menu()
	get_parent().add_child(game)
	pass # Replace with function body.
	
