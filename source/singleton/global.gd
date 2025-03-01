'''
	Modulo global
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 21 / 02 / 2024
	Fecha de ultima modificacion: 19 / 02 / 2024
	Descripcion: Se implementa el singleton global
'''

extends Node

#Declaraciones de variables globales


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Carga de idioma activo
	var lenguaje_settings = CONFIG_FILE.load_lenguaje_setting()
	TranslationServer.set_locale(lenguaje_settings.lengua_activa)
	pass # Replace with function body.
