extends Node

signal on_flame_died
signal on_point_scored

func emit_on_flame_died() -> void:
	on_flame_died.emit()
	
func emit_on_point_scored() -> void:
	on_point_scored.emit()
