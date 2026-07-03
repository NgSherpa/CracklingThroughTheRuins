extends Control

class_name GameUI
@onready var waiting_timer: Timer = $WaitingTimer
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound

@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var press_space_label: Label = $MarginContainer/PressSpaceLabel
@onready var score_label: Label = $MarginContainer/ScoreLabel

var _points : int = 0


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		GameManager.load_main_scene()
	if press_space_label.visible and event.is_action_pressed("power"):
		GameManager.load_main_scene()
func _ready() -> void:
	SignalHub.on_flame_died.connect(on_flame_died)
	SignalHub.on_point_scored.connect(on_point_scored)
	update_score_label()

func on_flame_died() -> void:
	game_over_label.show()
	game_over_sound.play()
	waiting_timer.start()
	ScoreManager.high_score = _points


func on_point_scored() -> void:
	_points +=1
	update_score_label()


func update_score_label() -> void:
	score_label.text = "%03d" % _points


func _on_waiting_timer_timeout() -> void:
	game_over_label.hide()
	press_space_label.show()
	
