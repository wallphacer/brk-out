extends Node2D

const player_scene = preload("res://Player/player.tscn")
const block_scene = preload("res://Blocks/block.tscn")
const ball_scene = preload("res://Ball/ball.tscn")
const game_over = preload("res://end_game.tscn")

# Signals
signal score_update(new_score : int)
signal life_update(new_life : int)

@export var screen_size : Vector2
@export var vertical_offset = .9
@export var horizontal_offset = .5
@export var score: int
@export var life : int

func _ready():
	score = 0
	life = 3
	
	life_update.emit(life)
	score_update.emit(score)
	# Get Screen Size & Max Heights / Widths
	screen_size = get_viewport_rect().size;
	var screen_width = screen_size.y
	var screen_height = screen_size.x
				   
	# Get Player
	var player = player_scene.instantiate();
	player.set_position(Vector2(screen_width * vertical_offset, screen_height * horizontal_offset))
	add_child(player)
	
	# Spawn Ball - TEST
	var ball = ball_scene.instantiate()
	ball.touched_dead.connect(_on_dead_touched)
	add_child(ball)	
	
func _on_block_destroyed():
	score += 1
	print("Game Updated Score!")
	score_update.emit(score)

func _on_dead_touched():
	print("Dead signal received")
	score -= 5
	if score <= 0:
		score = 0
		life -= 1
		life_update.emit(life)
	score_update.emit(score)
	
	if life < 0:
		change_to_game_over()

	
func reset():
	score = 0
	life = 3
	score_update.emit(score)
	# Get Screen Size & Max Heights / Widths
	screen_size = get_viewport_rect().size;
	var screen_width = screen_size.y
	var screen_height = screen_size.x
	var player = player_scene.instantiate();
	player.set_position(Vector2(screen_width * vertical_offset, screen_height * horizontal_offset))
	
func change_to_game_over():
	get_tree().change_scene_to_packed(game_over)
