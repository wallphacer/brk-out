extends Area2D

@export var offset = 1
@export var speed = 300
@export var direction = Vector2(0, 1)
var player : CharacterBody2D

func _ready():
	monitoring = true
	
	player = get_node("../Breaker")
	var initial_location = Vector2(0,0)
	if player != null:
		print("Player found")
		initial_location = Vector2(player.position.x, player.position.y - 100)
	
	connect("body_entered", _on_ball_hit)
	connect("area_entered", _on_ball_hit_area)
	
	position = initial_location
	direction = direction * Vector2.DOWN
	
func move(delta : float):
	position += direction * speed * delta
	
func _physics_process(delta: float):
	move(delta)
	
func _alter_direction():
	direction = direction * Vector2.UP
	direction.x = randf_range(-0.8, 0.8)
	print("Direction Changed")
	
func _on_ball_hit(body: Node2D):
	_alter_direction()
	
func _on_ball_hit_area(area: Area2D):
	_alter_direction()
	print("Ball Signal Success")
