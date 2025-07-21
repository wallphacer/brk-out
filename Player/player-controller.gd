extends CharacterBody2D

@export var move_speed = 700
@export var buffer = 10
@export var width : float

func _ready():
	width = get_viewport_rect().size.x
	
func calculate_direction():
	if Input.is_action_pressed("right"):
		velocity = Vector2.RIGHT * move_speed
	elif Input.is_action_pressed("left"):
		velocity = Vector2.LEFT * move_speed
	else:
		velocity *= .6

func _physics_process(delta: float):
	calculate_direction()
	move_and_slide()
	
	var size = get_node("CollisionShape2D").shape.extents
	if(position.x <= size.x):
		position.x = size.x + buffer
		
	if(position.x > (width - (size.x + buffer))):
		position.x = width - (size.x + buffer)
	
		
	
