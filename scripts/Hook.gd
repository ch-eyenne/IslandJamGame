extends CharacterBody2D

@onready var is_active = false
@onready var player = $"../Player"

var is_sticked = false
var new_position
func _ready():
	add_collision_exception_with(player)
	pass

func _physics_process(dt: float) -> void:
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
		#self.visible = false
		pass
	if self.is_active:
		self.visible = true
	pass

func hook_shot():
	new_position = get_global_mouse_position()
	self.is_sticked = false
	pass

func reset():
	self.position = player.position
	self.is_active = false
	self.is_sticked = false
	player.is_hooked = false
	pass


func _on_hook_active_timer_timeout():
	reset()
	pass # Replace with function body.
