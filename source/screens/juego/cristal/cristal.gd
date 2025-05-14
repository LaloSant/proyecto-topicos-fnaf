extends Node2D

func _ready() -> void:
	$Personaje.defaultSpeed = GLOBAL.pers_default_speed * 0.5
