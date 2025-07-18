extends CharacterBody2D

@export var move_speed = 600

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
	
		
	
