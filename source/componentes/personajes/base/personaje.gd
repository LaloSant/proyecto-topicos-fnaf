'''
	Modulo Personaje
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 27 / 02 / 2025
	Fecha de ultima modificacion: 23 / 03 / 2025
	Descripcion: Se implementa la logica del personaje.
'''

class_name Personaje extends CharacterBody2D

var lastAnimation = "idle_abj"
var defaultSpeed = GLOBAL.pers_default_speed
var speed = defaultSpeed
var spriteSet:Resource = preload("res://source/componentes/personajes/lalo/laloSprites.tres")
var puedeMoverse:bool = true

func _ready() -> void:
	defaultSpeed = GLOBAL.pers_default_speed
	cambiarSprite(spriteSet)

func _physics_process(_delta: float) -> void:
	if !puedeMoverse:
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
			_cambiarAnimacion("caminar_abj")
		else:
			_cambiarAnimacion("caminar_arr")
		move_and_slide()
		return
	
	if direction.x != 0:
		velocity.x = direction.x * speed
		if direction.x > 0:
			_cambiarAnimacion("caminar_der")
		else:
			_cambiarAnimacion("caminar_izq")
	else:
		velocity.x = 0
		match(lastAnimation):
			"caminar_der":
				$sprite.play("idle_der")
			"caminar_izq":
				$sprite.play("idle_izq")
	if direction.y != 0:
		velocity.y = direction.y * speed
		if direction.y > 0:
			_cambiarAnimacion("caminar_abj")
		else:
			_cambiarAnimacion("caminar_arr")
	else:
		velocity.y = 0
		match(lastAnimation):
			"caminar_arr":
				$sprite.play("idle_arr")
			"caminar_abj":
				$sprite.play("idle_abj")
	move_and_slide()
	
func _process(_delta: float) -> void:
	if Input.is_action_pressed("CntlKey"):
		speed = defaultSpeed / 1.5
		$sprite.speed_scale = 0.75
	elif Input.is_action_pressed("ShiftKey"):
		speed = defaultSpeed * 1.5
		$sprite.speed_scale = 1.5
	else:
		speed = defaultSpeed
	if Input.is_action_pressed("ui_accept"):
		cambiarSprite(preload("res://source/componentes/personajes/yael/yaelSprites.tres"))

func _cambiarAnimacion(animacion:String) -> void:
	$sprite.play(animacion)
	lastAnimation = animacion

func cambiarSprite(spriteSetNew:Resource) -> void:
	$sprite.set_sprite_frames(spriteSetNew)
	
func setPuedeMoverse(valor:bool) -> void:
	puedeMoverse = valor
