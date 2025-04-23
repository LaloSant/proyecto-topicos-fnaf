'''
	Modulo Mundo Exterior
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 27 / 02 / 2025
	Fecha de ultima modificacion: 26 / 03 / 2025
	Descripcion: Se implementa el nivel del mundo exterior
'''

extends Node2D

func _ready() -> void:
	setPosicionJugador()
	$Personaje/HUD/lblInfo.text = "lbl_dia" + str(GLOBAL.contador_dia)

func setPosicionJugador() -> void: #Para cuando salga de un edificio o empieze partida
	$Personaje/Linterna.visible = false
	match GLOBAL.marker_actual:
		GLOBAL.MarkerPosicion.mk_EdificioTFuera:
			$Personaje.position = $Marcadores/EdificioTFuera.position
		GLOBAL.MarkerPosicion.mk_EPrinFuera:
			$Personaje.position = $Marcadores/EPrincFuera.position
		GLOBAL.MarkerPosicion.mk_EdificioAmbFuera:
			$Personaje.position = $Marcadores/EdificioAmbFuera.position

func _on_area_2d_body_entered(body: Node2D) -> void:
	transparentar(body)

func _on_area_2d_body_exited(body: Node2D) -> void:
	de_transparentar(body)

func transparentar(body:Node2D) -> void:
	if body is Personaje:
		$Transparentar/ANPModulate.play("Fade_Edificios")
		
func de_transparentar(body:Node2D) -> void:
	if body is Personaje:
		$Transparentar/ANPModulate.play_backwards("Fade_Edificios")

func _on_item_lampara_item_obtenido() -> void:
	$Items/DWLampara.mostrar_dialogo()
	GLOBAL.pers_tieneLampara = true
	$Personaje.tieneLampara = true

func _on_tc_edif_t_body_entered(body: Node2D) -> void:
	if body is Personaje:
		GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioTEntrada

func _on_tc_edif_amb_body_entered(body: Node2D) -> void:
	if body is Personaje:
		GLOBAL.marker_actual = GLOBAL.MarkerPosicion.mk_EdificioAmbEntrada
