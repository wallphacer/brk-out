extends CharacterBody2D

@export var speed = 300;
@onready var collision_shape_2d = $CollisionShape2D

signal touched_dead
func _ready():
	var player = get_node("../Breaker")
	var initial_location = Vector2(0,0)
	if player != null:
		print("Player found")
		initial_location = Vector2(player.position.x, player.position.y - 100)
	position = initial_location
	velocity = Vector2(.2,1)

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if(!collision):
		return
	
	_destroy_block(collision.get_collider())
	velocity = velocity.bounce(collision.get_normal())
	

func _destroy_block(other):
	if other.name != "Breaker" && !other.name.contains("wall"):
		other.queue_free()
	if other.name.contains("dead"):
		print("Dead Signal Emitted")
		touched_dead.emit()
		
		
func reset():
	var player = get_node("../Breaker")
	var initial_location = Vector2(0,0)
	if player != null:
		print("Player found")
		initial_location = Vector2(player.position.x, player.position.y - 100)
	position = initial_location
	velocity = Vector2(.2,1)
