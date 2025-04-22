'''
	Modulo Enemigo base
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 9 / 04 / 2025
	Fecha de ultima modificacion: 9 / 04 / 2025
	Descripcion: Se implementa la logica del enmigo base.
'''

class_name Enemigo extends CharacterBody2D
var speed:float = 50
var posicionAnt:Vector2 = position
var currentAnim:String

func actualizarPos(ruta:PathFollow2D, delta:float):
	var anim:String
	ruta.progress += speed * delta
	var difx = position.x - posicionAnt.x
	var dify = position.y - posicionAnt.y
	var difMayorX = (abs(difx) - abs(dify)) > 0 
	if difMayorX:
		anim = "caminar_der" if difx > 0 else "caminar_izq"
	else:
		anim = "caminar_abj" if dify > 0 else "caminar_arr"
	$Sprite.play(anim)
	currentAnim = anim
	posicionAnt = position

func _on_area_danio_body_entered(body: Node2D) -> void:
	if body is Personaje:
		if body.muerto:
			return
		var desdeX:int
		var desdeY:int
		match currentAnim:
			"caminar_der":
				desdeX = 1
			"caminar_izq":
				desdeX = -1
			"caminar_abj":
				desdeY = 1
			"caminar_arr":
				desdeY = -1
		body.recibe_danio(10, desdeX, desdeY)
