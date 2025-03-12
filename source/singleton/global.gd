'''
	Modulo global
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 21 / 02 / 2025
	Fecha de ultima modificacion: 11 / 03 / 2025
	Descripcion: Se implementa el singleton global
'''

extends Node

#Declaraciones de variables globales
var pers_default_speed:int

func _ready() -> void:
	#Carga de idioma activo
	var lenguaje_settings = CONFIG_FILE.load_lenguaje_setting()
	TranslationServer.set_locale(lenguaje_settings.lengua_activa)
	#Asignacion de datos
	var personaje_settings = CONFIG_FILE.load_personaje_setting()
	pers_default_speed = personaje_settings.default_speed
