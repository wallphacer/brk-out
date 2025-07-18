extends Area2D

signal block_destroyed

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(other):
	print("Block was hit!")
	block_destroyed.emit()
	print("Signal emitted!")
	queue_free()
	return
