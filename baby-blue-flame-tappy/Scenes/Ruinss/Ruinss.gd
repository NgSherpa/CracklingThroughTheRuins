extends Node2D

class_name Ruinss
@onready var sparkles_aka_laser: Area2D = $"Sparkles aka Laser"
@onready var score_sound: AudioStreamPlayer = $ScoreSound


const SPEED : float = 120.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_flame_died.connect(on_flame_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta
	
func on_flame_died() -> void:
	disconnect_sparkles()

func _on_screen_notifier_screen_exited() -> void:
	queue_free()

func disconnect_sparkles() -> void:
	if sparkles_aka_laser.body_exited.is_connected(_on_sparkles_aka_laser_body_exited):
		sparkles_aka_laser.body_exited.disconnect(_on_sparkles_aka_laser_body_exited)


func _on_life_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Flame:
		body.die()





func _on_sparkles_aka_laser_body_exited(body: Node2D) -> void:
	if body is Flame:
		score_sound.play()
		disconnect_sparkles()
		SignalHub.emit_on_point_scored()
