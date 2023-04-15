extends CharacterBody2D


@export var speed = 400
@export var jump_speed = -350
@export var acceleration = 15
@export var friction = 15

@onready var hook  = $"../Hook"
@onready var hook_active_timer = $"../Hook/hook_active_timer"

var mousepoint
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


# hook

func _unhandled_input(event):
	if Input.is_action_just_pressed("click") and !hook.is_active:
		hook.is_active = true
		hook.hook_shot()
	elif Input.is_action_just_pressed("click") and hook.is_active:
		reset_hook()
		pass

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if hook.is_active:
		hook_active_timer.start()
		pass
	pass # Replace with function body.

func reset_hook():
		hook.reset()
		pass
