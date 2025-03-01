'''
	Modulo personaje
	Creado por: Eduardo Jair Bautista Santiesteban
	Fecha de creacion: 26 / 02 / 2024
	Fecha de ultima modificacion: 26 / 02 / 2024
	Descripcion: Se implementa personaje
'''

extends CharacterBody2D

@onready var p = $sprite
var speed:int = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	p.animation="idle_abj"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_anything_pressed():
		if _input_two_keys("ui_up", "WASD_W"):
			p.play("caminar_arr")	
			velocity.y -= speed * delta
			if _input_two_keys("ui_left", "WASD_A"):
				velocity.x -= speed * delta 
			elif _input_two_keys("ui_right", "WASD_D"):
				velocity.x += speed * delta 
		else:
			if _input_two_keys("ui_down", "WASD_S"):
				p.play("caminar_abj")	
				velocity.y += speed * delta
				if _input_two_keys("ui_left", "WASD_A"):
					velocity.x -= speed * delta 
				elif _input_two_keys("ui_right", "WASD_D"):
					velocity.x += speed * delta 
			else:
				if _input_two_keys("ui_left", "WASD_A"):
					p.play("caminar_izq")	
					velocity.x -= speed * delta
				if _input_two_keys("ui_right", "WASD_D"):
					p.play("caminar_der")	
					velocity.x += speed * delta
		$Camara.position = p.position
	else:
		_player_stopped()
		

func _input_two_keys(k1:String, k2:String) -> bool:
	return Input.is_action_pressed(k1) or Input.is_action_pressed(k2)
	
func _player_stopped() -> void:
	match(p.animation):
		"caminar_der":
			p.animation = "idle_der"
		"caminar_izq":
			p.animation = "idle_izq"
		"caminar_arr":
			p.animation = "idle_arr"
		"caminar_abj":
			p.animation = "idle_abj"

func _on_tp_abajo_body_entered(body: Node2D) -> void:
	print("Body entered")
