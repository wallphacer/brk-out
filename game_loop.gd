extends Node2D

const player_scene = preload("res://Player/player.tscn")
const block_scene = preload("res://Blocks/block.tscn")
const ball_scene = preload("res://Ball/Ball.tscn")

@export var screen_size : Vector2
@export var vertical_offset = .9
@export var horizontal_offset = .5
@export var score = 0

func _ready():
	# Get Screen Size & Max Heights / Widths
	screen_size = get_viewport_rect().size;
	var screen_width = screen_size.y
	var screen_height = screen_size.x
				   
	# Get Player
	var player = player_scene.instantiate();
	player.set_position(Vector2(screen_width * vertical_offset, screen_height * horizontal_offset))
	add_child(player)
	
	# Spawn Block - TEST
	var block = block_scene.instantiate()
	block.set_position(Vector2(player.position.x + 200 , player.position.y))
	add_child(block)
	
	block.block_destroyed.connect(_on_block_destroyed)
	
	# Spawn Ball - TEST
	var ball = ball_scene.instantiate()
	add_child(ball)	
	
func _on_block_destroyed():
	score += 1
	print("Game Updated Score!")
