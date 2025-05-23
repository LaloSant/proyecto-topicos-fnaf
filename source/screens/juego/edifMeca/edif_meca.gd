extends Node2D

func _ready() -> void:
	match GLOBAL.marker_actual:
		GLOBAL.MarkerPosicion.mk_EdificioMecaEntrada:
			$Personaje.position = $Markers/Entrada.position


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Personaje:
		if !GLOBAL.naranjas:
			$Npc/DWChicaNeed.mostrar_dialogo()
