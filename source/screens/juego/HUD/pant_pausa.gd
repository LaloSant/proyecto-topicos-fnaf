'''
	Modulo pantalla pausa
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 14 / 05 / 2025
	Fecha de ultima modificacion: 14 / 05 / 2025
	Descripcion: Se implementa escena de pantalla pausa
'''

class_name PantPausa extends CanvasLayer
var pausaSFX = preload("res://resources/audio/pausa.mp3")
var pausaExitSFX = preload("res://resources/audio/pausaExit.mp3")
var on_pause:bool

func _ready() -> void:
	$fondo/hbox/btnContinuar.grab_focus()

func _input(event: InputEvent) -> void:
	pass

func _on_btn_continuar_pressed() -> void:
	procesar()

func _on_btn_guardar_pressed() -> void:
	GLOBAL.guardarPartida()

func _on_btn_menu_prin_pressed() -> void:
	procesar()
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_principal.tscn")

func procesar():
	on_pause = !on_pause
	get_tree().paused=!get_tree().paused
	var sonido = pausaSFX if on_pause else pausaExitSFX
	$SFX.stream = sonido
	$fondo.visible = !$fondo.visible
	if $fondo.visible:
		$fondo/hbox/btnContinuar.grab_focus()
		$SFX.play()
	else:
		$SFX.play()
