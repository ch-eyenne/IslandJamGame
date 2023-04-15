extends CharacterBody2D


@export var speed = 400
@export var jump_speed = -350
@export var acceleration = 15
@export var friction = 15

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_input(delta):
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = lerp(velocity.x, direction * speed, acceleration * delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction * delta)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
	
func _physics_process(delta):
	velocity.y += gravity * delta
	get_input(delta)
	move_and_slide()
