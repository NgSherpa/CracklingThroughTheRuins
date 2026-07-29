extends Node

@onready var ruins_holder: Node = $RuinsHolder
@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lower_spawn: Marker2D = $LowerSpawn
const RUINSS = preload("res://Scenes/Ruinss/Ruinss.tscn")





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_ruins()
	
func spawn_ruins() -> void:
	var new_ruins : Ruinss = RUINSS.instantiate()
	var y_pos : float = randf_range(
		upper_spawn.position.y, 
		lower_spawn.position.y
	)
	new_ruins.position = Vector2(
		upper_spawn.position.x,
		y_pos
	)
	ruins_holder.add_child(new_ruins)
	
	

func _on_spawn_timer_timeout() -> void:
	spawn_ruins()
