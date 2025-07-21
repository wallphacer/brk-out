extends Button

var scene = preload("res://game.tscn")

func _on_button_down() -> void:
	print("Starting Game Scene")
	get_tree().change_scene_to_packed(scene)
	
