'''
	Modulo HUD
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 24 / 03 / 2025
	Fecha de ultima modificacion: 30 / 04 / 2025
	Descripcion: Se implementa script de HUD
'''

class_name HUD extends CanvasLayer

func actualizar_salud(salud) -> void:
	var stage = (salud / 10) + 1 
	stage = 10 if stage == 11 else stage
	$Salud.frame = stage - 1
	if salud == 100:
		$Salud.frame = 10
	$Salud/ANPSalud.play("danio")
	
func mostrarMisiones():
	$HUD/PanelMisiones.visible = !$HUD/PanelMisiones.visible
	
