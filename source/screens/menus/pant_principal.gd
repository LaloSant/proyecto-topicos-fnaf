'''
	Modulo PantPrincipal
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 17 / 02 / 2025
	Fecha de ultima modificacion: 23 / 03 / 2025
	Descripcion: Se implementa la pantalla principal del juego.
'''

extends Node2D

func _ready() -> void:
	$Panel/btn_iniciar.grab_focus()

func _process(_delta: float) -> void:
	pass

func _on_btn_salir_pressed() -> void:
	get_tree().quit()

func _on_btn_config_pressed() -> void:
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_config.tscn")


func _on_btn_creditos_pressed() -> void:
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_creditos.tscn")


func _on_btn_iniciar_pressed() -> void:
	SCN_FADE_IN.cambia_escena("res://source/screens/juego/mundo/mundo.tscn")

func _on_timer_video_intro_timeout() -> void:
	SCN_FADE_IN.cambia_escena("res://source/screens/menus/pant_video_intro.tscn")
