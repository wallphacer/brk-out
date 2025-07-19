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
	direction.x = direction.x * -1
	direction.y = direction.y * -1
	
func _on_ball_hit(body: Node2D):
	if body.name == "Breaker":
		var velocity = global_position - body.global_position
		direction = velocity.normalized()

	
func _on_ball_hit_area(area: Area2D):
	if area.name.contains("Wall"):
		print("This how we do it")
		direction.x = direction.x * -1
	elif area.name == "Ceiling":
		direction.y = Vector2.DOWN.y
	else:
		direction.y *= -1
