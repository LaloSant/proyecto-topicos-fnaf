'''
	Modulo Edificio T
	Creado por: Eduardo Jair Bautista Santiesteban
	Modificado por:
	Fecha de creacion: 27 / 02 / 2025
	Fecha de ultima modificacion: 06 / 03 / 2025
	Descripcion: Se implementa el nivel del edificio T
'''

extends Node2D



func _on_tp_pb_body_entered(_body: Node2D) -> void:
	var personaje = $Personaje
	personaje.position.x = -254
	personaje.position.y = 428


func _on_tp_p_1_body_entered(_body: Node2D) -> void:
	var personaje = $Personaje
	personaje.position.x = -292
	personaje.position.y = -14


func _on_tp_entrada_body_entered(_body: Node2D) -> void:
		get_tree().change_scene_to_file("res://source/screens/pantCreditos/pant_creditos.tscn")


func _on_tp_salon_body_entered(_body: Node2D) -> void:
	var personaje = $Personaje
	personaje.position.x = 758
	personaje.position.y = 50


func _on_tp_pasillo_body_entered(_body: Node2D) -> void:
	var personaje = $Personaje
	personaje.position.x = 216
	personaje.position.y = -7
