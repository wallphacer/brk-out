extends Control


# Could do the below with signals

func _hide_main_menu():
	for child in get_children():
		print(child.name)
		child.set_visible(false)
