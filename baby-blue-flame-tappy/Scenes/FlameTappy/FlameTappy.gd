extends CharacterBody2D

class_name Flame


var _gravity : float = ProjectSettings.get("physics/2d/default_gravity")
var _jumped : bool = false
const JUMP_POWER : float = -350
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		_jumped = true
	if event is InputEventScreenTouch:
		_jumped = true

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += _gravity * delta
	move_and_slide()
	
	if _jumped:
		velocity.y = JUMP_POWER
		_jumped = false
		
	if is_on_floor():
		die()
		
func die() -> void:
	set_physics_process(false)
	animated_sprite_2d.stop()
