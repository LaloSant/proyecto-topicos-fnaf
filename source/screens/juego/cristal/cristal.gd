'''
	Modulo Edificio Ambiental
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 19 / 05 / 2025
	Fecha de ultima modificacion: 19 / 05 / 2025
	Descripcion: Se implementa el nivel del edificio Cristal
'''

extends Node2D
@onready var ruta_parte_1F= $Rutas/RtaParte1/RtaFParte1
@onready var ruta_parte_2F = $Rutas/RtaParte2/RtaFParte2
@onready var ruta_parte_3F = $Rutas/RtaParte3/RtaFParte3
@onready var ruta_parte_4F = $Rutas/RtaParte4/RtaFParte4
@onready var ruta_parte_5F = $Rutas/RtaParte5/RtaFParte5
@onready var ruta_parte_6F = $Rutas/RtaParte6/RtaFParte6

func _ready() -> void:
	$Personaje.defaultSpeed = GLOBAL.pers_default_speed * 0.5
	##$Enemigos/Guardia1.speed*=2.5
	##$Enemigos/Guardia2.speed*=3
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
	$Enemigos/Guardia3.actualizarPos(ruta_parte_3F,delta)
	$Enemigos/Guardia4.actualizarPos(ruta_parte_4F,delta)
	$Enemigos/Guardia5.actualizarPos(ruta_parte_5F,delta)
	$Enemigos/Guardia6.actualizarPos(ruta_parte_6F,delta)

	
