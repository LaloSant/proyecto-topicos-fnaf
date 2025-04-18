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
	posicionAnt = position
	
