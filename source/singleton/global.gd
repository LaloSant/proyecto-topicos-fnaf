'''
	Modulo global
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 21 / 02 / 2025
	Fecha de ultima modificacion: 11 / 03 / 2025
	Descripcion: Se implementa el singleton global
'''

extends Node
enum MarkerPosicion{mk_EdificioAmbSalon,mk_EdificioAmbEntrada,mk_EdificioAmbFuera,mk_EdificioTSalon,mk_EdificioTEntrada ,mk_EdificioTFuera, mk_EPrinFuera}

#Declaraciones de variables globales
var pers_default_speed:int
var pers_factorSneak:float 
var pers_factorRun:float 
var pers_nombre:String
var enem_tipo:String
var pers_salud:int
var pers_tieneLampara:bool
var contador_dia:int
var marker_actual = MarkerPosicion.mk_EdificioTSalon

func _ready() -> void:
	#Carga de idioma activo
	var lenguaje_settings = CONFIG_FILE.load_lenguaje_setting()
	TranslationServer.set_locale(lenguaje_settings.lengua_activa)
	#Asignacion de datos
	var personaje_settings = CONFIG_FILE.load_personaje_setting()
	pers_default_speed = personaje_settings.default_speed
	pers_factorRun = personaje_settings.factorRun
	pers_factorSneak = personaje_settings.factorSneak
	pers_nombre = personaje_settings.nombre
	pers_salud = personaje_settings.currentHealth
	pers_tieneLampara = personaje_settings.tieneLampara
	#Carga datos partida
	var partida_settings = CONFIG_FILE.load_partida_setting()
	contador_dia = partida_settings.dia
	marker_actual = partida_settings.marcador

## Guarda datos importantes de la partida
func guardarPartida() -> void:
	CONFIG_FILE.save_partida_setting("dia", contador_dia)
	CONFIG_FILE.save_partida_setting("marcador", marker_actual)
	CONFIG_FILE.save_partida_setting("tieneLampara", pers_tieneLampara)
	
##Evalua posicion y que escena cargar
func continuarPartida() -> void:
	if GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioTSalon:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/edifT/edificio_t.tscn")
	else:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/mundo/mundo.tscn")
