extends CharacterBody2D

@onready var is_active = false
@onready var player = $"../Player"

var new_position
func _ready():
	add_collision_exception_with(player)
	pass

func _physics_process(dt: float) -> void:
	if self.is_active and position != new_position:
		velocity = (lerp(position, new_position, .100) - position) /dt
		move_and_slide()
	if self.position == new_position:
		reset()
	if !self.is_active:
		self.position = player.position
		pass
	
	if self.is_active == false:
		#self.visible = false
		pass
	if self.is_active:
		self.visible = true
	pass

func hook_shot():
	new_position = get_global_mouse_position()
	pass

func reset():
	self.position = player.position
	self.is_active = false
	pass


func _on_hook_active_timer_timeout():
	reset()
	pass # Replace with function body.
