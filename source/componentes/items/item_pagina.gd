'''
	Modulo item lampara
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 12 / 05 / 2025
	Fecha de ultima modificacion: 12 / 05 / 2025
	Descripcion: Se implementa componente de item pagina
'''

class_name Pagina extends Area2D
signal item_obtenido
@export var num_pagina:int

func _on_body_entered(body: Node2D) -> void:
	if body is Personaje:
		if !body.has_pagina_x(num_pagina):
			body.set_pagina_x(num_pagina)
			print("Obtenido")
			emit_signal("item_obtenido")
