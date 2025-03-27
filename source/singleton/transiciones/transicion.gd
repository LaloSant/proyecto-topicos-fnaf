'''
	Modulo Transicionador
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 26 / 03 / 2025
	Fecha de ultima modificacion: 26 / 03 / 2025
	Descripcion: Se implementa componente de transicionador
'''

class_name transicion extends Area2D
@export var escena:String

func _on_body_entered(body: Node2D) -> void:
	if body is Personaje:
		body.setPuedeMoverse(false)
		GLOBAL.lugarATp = "FrenteEdifT"
		await SCN_FADE_IN.cambia_escena(escena)
