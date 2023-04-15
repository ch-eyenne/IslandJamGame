extends CharacterBody2D

@onready var is_active = false
@onready var player = $"../Player"

<<<<<<< HEAD
var is_sticked = false
=======
>>>>>>> bcaf5fe8bfdaaa628fa0c4f4dbfb03329f77504e
var new_position
func _ready():
	add_collision_exception_with(player)
	pass

func _physics_process(dt: float) -> void:
<<<<<<< HEAD
	if self.is_active and !self.is_sticked and position != new_position:
		velocity = (lerp(position, new_position, .3) - position) /dt
		move_and_slide()
	if !self.is_active and !self.is_sticked:
		self.position = player.position
		pass
	if self.is_sticked:
		self.velocity = Vector2.ZERO
		pass
	if !self.is_active:
=======
	if self.is_active and position != new_position:
		velocity = (lerp(position, new_position, .100) - position) /dt
		move_and_slide()
	if self.position == new_position:
		reset()
	if !self.is_active:
		self.position = player.position
		pass
	
	if self.is_active == false:
>>>>>>> bcaf5fe8bfdaaa628fa0c4f4dbfb03329f77504e
		#self.visible = false
		pass
	if self.is_active:
		self.visible = true
	pass

func hook_shot():
	new_position = get_global_mouse_position()
<<<<<<< HEAD
	self.is_sticked = false
=======
>>>>>>> bcaf5fe8bfdaaa628fa0c4f4dbfb03329f77504e
	pass

func reset():
	self.position = player.position
	self.is_active = false
<<<<<<< HEAD
	self.is_sticked = false
	player.is_hooked = false
=======
>>>>>>> bcaf5fe8bfdaaa628fa0c4f4dbfb03329f77504e
	pass


func _on_hook_active_timer_timeout():
	reset()
	pass # Replace with function body.
