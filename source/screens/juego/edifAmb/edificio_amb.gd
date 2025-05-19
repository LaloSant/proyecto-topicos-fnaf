'''
	Modulo Edificio Ambiental
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 22 / 04 / 2025
	Fecha de ultima modificacion: 22 / 04 / 2025
	Descripcion: Se implementa el nivel del edificio Ambiental
'''

extends Node2D
@onready var ruta_Pasillo_F = $Rutas/RtaPasillo/RtaFPasillo

func _ready() -> void:
	if not $Personaje.has_lamp():
		$Items/DWNeedLampara.mostrar_dialogo()
	$Personaje/HUD/lblInfo.text = "lbl_Salon"
	$Personaje.defaultSpeed = $Personaje.defaultSpeed * 0.65
	$Personaje/Linterna.visible = $Personaje.tieneLampara
	match GLOBAL.marker_actual:
		GLOBAL.MarkerPosicion.mk_EdificioAmbEntrada:
			$Personaje.position = $TpNuevo/Entrada.position
	$Items/item_lampara.visible = !GLOBAL.pers_tieneLampara
	
func _process(delta: float) -> void:
	$Enemigos/GuardianP.actualizarPos($Rutas/RtaPasillo/RtaFPasillo, delta)

func _on_salon_p_1_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_P1"

func _on_p_1_salon_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_Salon"

func _on_p_1_pb_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_Pb"

func _on_pb_p_1_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_P1"

func _on_item_lampara_item_obtenido() -> void:
	$Items/DWLampara.mostrar_dialogo()
	GLOBAL.pers_tieneLampara = true
	$Personaje.tieneLampara = true


func _on_personaje_fin_muerte() -> void:
	$Musica.playing= false
	$Enemigos/GuardianP/SFX.playing = false
