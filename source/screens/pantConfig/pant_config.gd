'''
	Modulo PantConfig
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 19 / 02 / 2024
	Fecha de ultima modificacion: 26 / 02 / 2024
	Descripcion: Se implementa la pantalla de configuracion del juego
'''

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_btn_pant_principal_pressed() -> void:
	get_tree().change_scene_to_file("res://source/screens/pantPrin/pant_principal.tscn")

func _on_btn_idioma_pressed() -> void:
	language_control()

func language_control() -> void:
	var language_settings = CONFIG_FILE.load_lenguaje_setting()
	var al=language_settings.lengua_activa
	match (al):
		"es":
			al = "en"
		"en":
			al = "fr"
		"fr":
			al = "es"
	CONFIG_FILE.update_lenguaje_setting("lengua_activa", al)
	TranslationServer.set_locale(al)

func _on_btn_guardar_idioma_pressed() -> void:
	CONFIG_FILE.save_full_config()
