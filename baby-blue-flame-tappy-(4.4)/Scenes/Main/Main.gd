extends Control


@onready var high_score_label: Label = $MC/HighScoreLabel


func _ready() -> void:
	get_tree().paused = false
	high_score_label.text = "%03d" % ScoreManager.high_score

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		GameManager.load_game_scene()
