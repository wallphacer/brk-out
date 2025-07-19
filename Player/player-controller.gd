extends CharacterBody2D

@export var move_speed = 600
@export var buffer = 10
@export var width : float

func _ready():
	width = get_viewport_rect().size.x
func calculate_direction():
	velocity.x
	if Input.is_action_pressed("right"):
		velocity.x = move_speed * 1
	elif Input.is_action_pressed("left"):
		velocity.x = move_speed * -1
	else:
		velocity.x *= .6

func _physics_process(delta: float):
	calculate_direction()
	move_and_slide()
	
	var size = get_node("CollisionShape2D").shape.extents
	if(position.x <= size.x):
		position.x = size.x + buffer
		
	if(position.x > (width - (size.x + buffer))):
		position.x = width - (size.x + buffer)
	
		
	
