'''
	Modulo Personaje
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 27 / 02 / 2025
	Fecha de ultima modificacion: 30 / 04 / 2025
	Descripcion: Se implementa la logica del personaje.
'''

class_name Personaje extends CharacterBody2D

##Nombres: Lalo, Yael, Alan
@export var nombre:String = "Lalo"
#Items
@export var tieneLampara:bool = GLOBAL.pers_tieneLampara
@export var paginas:Array[bool] = GLOBAL.paginas
#Propiedades
var lastAnimation = "idle_abj"
var defaultSpeed = GLOBAL.pers_default_speed
var speed:float = defaultSpeed
var salud:int = GLOBAL.pers_salud
#Estados
var puedeMoverse:bool = true
var golpeando:bool = false
var daniado:bool = false
var muerto:bool = false
# Recursos
var flashlightSound = preload("res://resources/audio/Flashlight.ogg")
var bonkSound = preload("res://resources/audio/Bonk.mp3")
var muerteSound = preload("res://resources/audio/muerte.mp3")
var pagSound= preload("res://resources/audio/tururu.mp3")

func _ready() -> void:
	if GLOBAL.continuar_partida:
		nombre = GLOBAL.pers_nombre
		salud = GLOBAL.pers_salud
		$HUD.actualizar_salud(salud)
		paginas = GLOBAL.paginas
		tieneLampara = GLOBAL.pers_tieneLampara
	else:
		GLOBAL.pers_nombre = nombre
		salud = 100
		GLOBAL.pers_salud = salud
		paginas = [false, false, false, false, false, false, false, false]
		GLOBAL.paginas = paginas
		tieneLampara = false
		GLOBAL.pers_tieneLampara = tieneLampara
		GLOBAL.continuar_partida = true
	cambiarSprite(getSpritePorNombre(nombre))
	defaultSpeed = GLOBAL.pers_default_speed

func _physics_process(_delta: float) -> void:
	if daniado:
		move_and_slide()
		return
	if !puedeMoverse:
		golpeando = false
		match(lastAnimation):
			"caminar_der":
				$sprite.play("idle_der")
			"caminar_izq":
				$sprite.play("idle_izq")
			"caminar_arr":
				$sprite.play("idle_arr")
			"caminar_abj":
				$sprite.play("idle_abj")
		return
	var direction:Vector2 = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	
	if direction.x != 0 and direction.y != 0:
		direction.normalized()
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
		if direction.y > 0:
			cambiar_animacion("caminar_abj")
		else:
			cambiar_animacion("caminar_arr")
		move_and_slide()
		return
	
	if direction.x != 0:
		velocity.x = direction.x * speed
		if direction.x > 0:
			cambiar_animacion("caminar_der")
		else:
			cambiar_animacion("caminar_izq")
	else:
		velocity.x = 0
		if not golpeando:
			match(lastAnimation):
				"caminar_der":
					$sprite.play("idle_der")
				"caminar_izq":
					$sprite.play("idle_izq")
	if direction.y != 0:
		velocity.y = direction.y * speed
		if direction.y > 0:
			cambiar_animacion("caminar_abj")
		else:
			cambiar_animacion("caminar_arr")
	else:
		velocity.y = 0
		if not golpeando:
			match(lastAnimation):
				"caminar_arr":
					$sprite.play("idle_arr")
				"caminar_abj":
					$sprite.play("idle_abj")
	move_and_slide()
	
func _process(_delta: float) -> void:
	if Input.is_action_pressed("CntlKey") or Input.is_action_pressed("Control_B_Circ"):
		speed = defaultSpeed * GLOBAL.pers_factorSneak
		$sprite.speed_scale = GLOBAL.pers_factorSneak
	elif Input.is_action_pressed("ShiftKey") or Input.is_action_pressed("Control_L3"):
		speed = defaultSpeed * GLOBAL.pers_factorRun
		$sprite.speed_scale = GLOBAL.pers_factorRun
	else:
		speed = defaultSpeed

func cambiar_animacion(animacion:String) -> void:
	if not golpeando:
		$sprite.play(animacion)
		lastAnimation = animacion

func cambiarSprite(spriteSetNew:Resource) -> void:
	$sprite.set_sprite_frames(spriteSetNew)
	
func setPuedeMoverse(valor:bool) -> void:
	puedeMoverse = valor
		
##DesdeX = 1 si es de la derecha, -1 si es de la izquierda.
##DesdeY = 1 si es de abajo, -1 si es de arriba.
func recibe_danio(danio:int, desdeX:int, desdeY:int) -> void:
	reproduceSonido("Bonk")
	salud -= danio
	GLOBAL.pers_salud = salud
	if salud <= 0:
		muerto = true
		setPuedeMoverse(false)
		reproduceSonido("Muerte")
		cambiar_animacion("muerte")
	$HUD.actualizar_salud(salud)
	if velocity == Vector2.ZERO:
		velocity.x = defaultSpeed * desdeX
		velocity.y = defaultSpeed * desdeY
	else:
		velocity.x = velocity.x / abs(velocity.x) if velocity.x != 0 else 0.0
		velocity.y = velocity.y / abs(velocity.y) if velocity.y != 0 else 0.0
		velocity = -1 * velocity * defaultSpeed
	daniado = true
	$KnockBackTimer.start()

func _on_knock_back_timer_timeout() -> void:
	daniado = false
	velocity = Vector2.ZERO

func getSpritePorNombre(nom:String) -> Resource:
	match(nom):
		"Lalo":
			return preload("res://source/componentes/personajes/lalo/laloSprites.tres")
		"Yael":
			return preload("res://source/componentes/personajes/yael/yaelSprites.tres")
		"Alan":
			return preload("res://source/componentes/personajes/alan/alanSprites.tres")
	return preload("res://source/componentes/personajes/yael/yaelSprites.tres")

func has_lamp() -> bool:
	return tieneLampara

func has_pagina_x(num_pagina:int) -> bool:
	return paginas.get(num_pagina)

func set_pagina_x(num_pagina:int) -> void:
	paginas.set(num_pagina, true)
	

func toggle_lamp() -> void:
	if has_lamp():
		reproduceSonido("Linterna")
		$Linterna.visible = !$Linterna.visible
	else:
		$Linterna.visible = false

func pick_pag(indice: int) -> void:
	reproduceSonido("Pagina")
	paginas.set(indice,true) 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("TECLA_P") or event.is_action_pressed("Control_Start"):
		if !get_tree().paused and !$HUD/pantPausa.on_pause:
			$HUD/pantPausa.procesar()
	if event.is_action_pressed("TECLA_Q") or event.is_action_pressed("Control_X_cuad"):
		toggle_lamp()
	if event.is_action_pressed("TECLA_E") or event.is_action_pressed("Control_RT_R2"):
		if not golpeando:
			golpeando = true
			golpear()

func golpear() -> void:
	if muerto:
		pass
	$HitBox/HitBoxShape.disabled = false
	match lastAnimation:
		"caminar_abj":
			$sprite.play("punch_abj")
		"idle_abj":
			$sprite.play("punch_abj")
		"caminar_arr":
			$sprite.play("punch_arr")
		"idle_arr":
			$sprite.play("punch_arr")
		"caminar_der":
			$sprite.play("punch_der")
		"idle_der":
			$sprite.play("punch_der")
		"caminar_izq":
			$sprite.play("punch_izq")
		"idle_izq":
			$sprite.play("punch_izq")

func _on_sprite_animation_finished() -> void:
	if golpeando:
		$HitBox/HitBoxShape.disabled = true
		golpeando = false
		cambiar_animacion(lastAnimation)

##Linterna, Bonk, Muerte, Pag
func reproduceSonido(nombreAud:String) -> void:
	match nombreAud:
		"Linterna":
			$SFX.stream = flashlightSound
		"Bonk":
			$SFX.stream = bonkSound
		"Muerte":
			$SFX.stream = muerteSound
			$SFX.volume_db = 0
		"Pagina":
			$SFX.stream= pagSound
	$SFX.play()
