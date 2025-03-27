'''
	Modulo Edificio T
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 27 / 02 / 2025
	Fecha de ultima modificacion: 06 / 03 / 2025
	Descripcion: Se implementa el nivel del edificio T
'''

extends Node2D

func _ready() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_Salon"
	$Personaje.defaultSpeed = $Personaje.defaultSpeed * 0.75

func _on_salon_p_1_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_P1"

func _on_p_1_salon_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_Salon"

func _on_p_1_pb_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_Pb"

func _on_pb_p_1_tp_cambio_lugar() -> void:
	$Personaje/HUD/lblInfo.text = "lbl_P1"
