extends Node2D


func _on_tp_body_entered(body: Node2D) -> void:
	
	if GLOBAL.pers_nombre == "Yael":
		$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Lalo"))
	elif GLOBAL.pers_nombre== "Lalo":
		$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Alan"))
	elif GLOBAL.pers_nombre == "Alan":
				$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Yael"))
	


func _on_cambiador_body_entered(body: Node2D) -> void:
	if GLOBAL.pers_nombre == "Yael":
		$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Lalo"))
	elif GLOBAL.pers_nombre== "Lalo":
		$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Alan"))
	elif GLOBAL.pers_nombre == "Alan":
				$Personaje.cambiarSprite($Personaje.getSpritePorNombre("Yael"))
	
