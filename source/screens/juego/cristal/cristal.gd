extends Node2D

func _ready() -> void:
	$Personaje.defaultSpeed = GLOBAL.pers_default_speed * 0.5
	match GLOBAL.marker_actual:
		
			GLOBAL.MarkerPosicion.mk_CristalEntrada:
				$Personaje.position = $Markers/Cristal.position
	if not $Personaje.has_lamp():
		$Items/DWNeedLampara.mostrar_dialogo()
	$Personaje/Linterna.visible = $Personaje.tieneLampara
	$Items/item_lampara.visible = !GLOBAL.pers_tieneLampara
