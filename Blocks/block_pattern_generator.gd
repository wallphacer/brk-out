extends Node2D

@export var block_scene = preload("res://Blocks/block.tscn")
@export var offset : int
@export var amount : int

var blocks = []
func _ready():
	offset = 5
	amount = 12
	create_blocks()

func create_blocks():
	var height = get_viewport_rect().size.y
	var width = get_viewport_rect().size.x
	var game = get_parent()
	
	for i in range(amount):
		for j in range(amount):
			var cur_block = block_scene.instantiate()
			var shape : Shape2D = cur_block.get_node("CollisionShape2D").shape
			var size = shape.get_rect()
			cur_block.position.x = (i * size.size.x) + size.size.x
			cur_block.position.y = (j * size.size.y) + size.size.y
			
			cur_block.block_destroyed.connect(game._on_block_destroyed)
			add_child(cur_block)
			blocks.append(cur_block)
			
func reset():
	for block in blocks:
		block.queue_free()
			
