'''
	Modulo Config
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 21 / 02 / 2024
	Fecha de ultima modificacion: 21 / 02 / 2024
	Descripcion: Se implementa singleton de configuracion
'''

extends Node

var file_path="res://config.cfg"
var config = ConfigFile.new()

func _ready() -> void:
	if !FileAccess.file_exists(file_path):
		#Seccion Lenguaje
		config.set_value("Lenguaje", "lengua_activa", "es")
		config.save(file_path)
		print("Archivo config.cfg creado")
	else:
		config.load(file_path)
		print("Archivo config.cfg cargado")

#Seccion Lenguaje
func save_full_config():
	config.save(file_path)
	print("Archivo config.cfg cargado")
	
func update_lenguaje_setting(key:String, value):
	config.set_value("Lenguaje", key, value)
	
func load_lenguaje_setting():
	var lenguaje_settings = {}
	for key in config.get_section_keys("Lenguaje"):
		lenguaje_settings[key]=config.get_value("Lenguaje", key)
	return lenguaje_settings
