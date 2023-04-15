extends CharacterBody2D


@export var speed = 400
@export var jump_speed = -500
@export var acceleration = 15
@export var friction = 15

@onready var hook  = $"../Hook"
@onready var hook_active_timer = $"../Hook/hook_active_timer"
var direction
var mousepoint
var is_hooked
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_input(delta):
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = lerp(velocity.x, direction * speed, acceleration * delta)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction * delta)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
	
func _physics_process(dt):
	if is_hooked:
		velocity.y = (lerp(position.y, hook.position.y, .03) - position.y) /dt
		velocity.x = lerp(velocity.x, direction * speed, acceleration * dt)
		move_and_slide()
	else:
		velocity.y += gravity * dt
		get_input(dt)
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
		hook.is_sticked = true
		self.is_hooked = true
		hook_active_timer.start()
		pass
	pass 

func reset_hook():
		hook.reset()
		pass
