extends Node2D

func _ready() -> void:
	if GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioXEntrada:
		$Personaje.position = $Markers/Entrada.position
