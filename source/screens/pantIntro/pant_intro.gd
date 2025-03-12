'''
	Modulo Pantalla Intro
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 11 / 03 / 2025
	Fecha de ultima modificacion: 11 / 03 / 2025
	Descripcion: Se implementa la pantalla introductoria del juego.
'''

extends Node2D

func _on_timer_timeout() -> void:
	SCN_FADE_IN._cambia_escena("res://source/screens/pantVideoIntro/pant_video_intro.tscn")
