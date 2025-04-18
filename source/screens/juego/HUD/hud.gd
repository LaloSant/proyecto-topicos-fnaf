'''
	Modulo HUD
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 24 / 03 / 2025
	Fecha de ultima modificacion: 24 / 03 / 2025
	Descripcion: Se implementa script de HUD
'''

class_name HUD extends CanvasLayer

func actualizar_salud(salud:int) -> void:
	var stage = (salud / 10) + 1 #0 - 9 = 1. 90 - 100 = 10
	stage = 10 if stage == 11 else stage
	$Salud.frame = stage - 1
