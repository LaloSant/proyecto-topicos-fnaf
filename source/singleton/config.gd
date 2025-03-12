'''
	Modulo Config
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 21 / 02 / 2025
	Fecha de ultima modificacion: 21 / 02 / 2025
	Descripcion: Se implementa singleton de configuracion
'''

extends Node

var file_path="res://config.cfg"
var config = ConfigFile.new()

func _ready() -> void:
	if !FileAccess.file_exists(file_path):
		#Seccion Lenguaje
		config.set_value("Lenguaje", "lengua_activa", "es")
		
		#Seccion Personaje
		config.set_value("Personaje", "default_speed", 150)
		config.save(file_path)
	else:
		config.load(file_path)

func save_full_config():
	config.save(file_path)
	
#Seccion Lenguaje	
func save_lenguaje_setting(key:String, value):
	config.set_value("Lenguaje", key, value)
	config.save(file_path)

func update_lenguaje_setting(key:String, value):
	config.set_value("Lenguaje", key, value)
	
func load_lenguaje_setting():
	var lenguaje_settings = {}
	for key in config.get_section_keys("Lenguaje"):
		lenguaje_settings[key]=config.get_value("Lenguaje", key)
	return lenguaje_settings

#Seccion personaje	
func save_personaje_setting(key:String, value):
	config.set_value("Personaje", key, value)
	config.save(file_path)

func update_personaje_setting(key:String, value):
	config.set_value("Personaje", key, value)
	
func load_personaje_setting():
	var personaje_settings = {}
	for key in config.get_section_keys("Personaje"):
		personaje_settings[key]=config.get_value("Personaje", key)
	return personaje_settings
