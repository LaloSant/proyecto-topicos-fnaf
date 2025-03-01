'''
	Modulo Config
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 24 / 02 / 2024
	Fecha de ultima modificacion: 24 / 02 / 2024
	Descripcion: Se implementa boton a menu principal
'''

class_name btnAMenuPrin extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		a_menu_prin()

func _on_pressed() -> void:
	a_menu_prin()
	
func a_menu_prin() -> void:
	get_tree().change_scene_to_file("res://source/screens/pantPrin/pant_principal.tscn")
