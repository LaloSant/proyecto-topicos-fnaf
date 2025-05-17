extends Node2D
@onready var ruta_parte_1F= $Rutas/RtaParte1/RtaFParte1
@onready var ruta_parte_2F = $Rutas/RtaParte2/RtaFParte2

func _ready() -> void:
	$Personaje.defaultSpeed = GLOBAL.pers_default_speed * 0.5
	$Enemigos/Guardia1.speed*=2.5
	$Enemigos/Guardia2.speed*=3
	match GLOBAL.marker_actual:
		
			GLOBAL.MarkerPosicion.mk_CristalEntrada:
				$Personaje.position = $Markers/Cristal.position
	if not $Personaje.has_lamp():
		$Items/DWNeedLampara.mostrar_dialogo()
	$Personaje/Linterna.visible = $Personaje.tieneLampara
	$Items/item_lampara.visible = !GLOBAL.pers_tieneLampara
	$Items/ItemPliego.visible = !GLOBAL.pliego
	$Items/ItemPliego.monitorable =!GLOBAL.pliego

func _process(delta: float) -> void:
	$Enemigos/Guardia1.actualizarPos(ruta_parte_1F,delta)
	$Enemigos/Guardia2.actualizarPos(ruta_parte_2F,delta)

	
