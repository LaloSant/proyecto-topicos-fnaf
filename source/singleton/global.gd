'''
	Modulo global
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 21 / 02 / 2025
	Fecha de ultima modificacion: 19 / 05 / 2025
	Descripcion: Se implementa el singleton global
'''

extends Node
enum MarkerPosicion{mk_EdificioAmbSalon, mk_EdificioAmbEntrada, mk_EdificioAmbFuera,
		mk_EdificioTSalon, mk_EdificioTEntrada, mk_EdificioTFuera, 
		mk_EPrinFuera, mk_EnsambleEntrada, mk_EnsambleFuera,mk_CristalEntrada,mk_CristalFuera}

#Declaraciones de variables globales
@onready var audioMaster = AudioServer.get_bus_index("Master")
@onready var audioMusica = AudioServer.get_bus_index("Musica")
@onready var audioSFX = AudioServer.get_bus_index("SFX")
@onready var audioVoz = AudioServer.get_bus_index("Voz")
@onready var continuar_partida:bool = false
@onready var controles_tactiles:bool = false

#Seccion personaje
var pers_default_speed:int
var pers_factorSneak:float 
var pers_factorRun:float 
var pers_nombre:String
var enem_tipo:String
var pers_salud:int

#Seccion partida
var pliego:bool
var pers_tieneLampara:bool
var contador_dia:int
var marker_actual = MarkerPosicion.mk_EdificioTSalon
var escena_actual = ""
var paginas:Array[bool] = [false, false, false, false, false, false, false, false]

#Seccion audio
var nivelAudioMaster:float
var nivelAudioMusica:float
var nivelAudioSFX:float
var nivelAudioVoz:float

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
	controles_tactiles = personaje_settings.contTactiles
	#Carga de datos audio
	var audio_settings = CONFIG_FILE.load_audio_setting()
	nivelAudioMaster = audio_settings.master
	nivelAudioMusica = audio_settings.musica
	nivelAudioSFX = audio_settings.sfx
	nivelAudioVoz = audio_settings.voz

## Guarda datos importantes de la partida
func guardarPartida() -> void:
	SAVEFILE.salva_partida()
	#CONFIG_FILE.save_partida_setting("dia", contador_dia)
	#CONFIG_FILE.save_partida_setting("marcador", marker_actual)
	#CONFIG_FILE.save_partida_setting("paginas", personaje.paginas)
	#CONFIG_FILE.save_personaje_setting("tieneLampara", personaje.has_lamp())
	#CONFIG_FILE.save_personaje_setting("currentHealth", personaje.salud)

##Evalua posicion y que escena cargar
func continuarPartida() -> void:
	continuar_partida = true
	SAVEFILE.carga_partida()
	if GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioTSalon:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/edifT/edificio_t.tscn")
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioTEntrada:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/edifT/edificio_t.tscn")
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioAmbEntrada:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/edifAmb/edificio_amb.tscn")
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioTFuera:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/mundo/mundo.tscn")
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EdificioAmbFuera:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/mundo/mundo.tscn")
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EnsambleFuera:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/mundo/mundo.tscn")
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_EnsambleEntrada:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/ensamble/ensamble.tscn")
	elif GLOBAL.marker_actual==GLOBAL.MarkerPosicion.mk_CristalEntrada:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/cristal/cristal.tscn")
	elif GLOBAL.marker_actual == GLOBAL.MarkerPosicion.mk_CristalFuera:
		SCN_FADE_IN.cambia_escena("res://source/screens/juego/mundo/mundo.tscn")
	else: 
		print("Configura en GLOBAL:gs continuar partida")

func cambiar_bus_audio(bus, valor) -> void:
	AudioServer.set_bus_volume_db(bus, linear_to_db(valor))
	AudioServer.set_bus_mute(bus, valor<0.05)
