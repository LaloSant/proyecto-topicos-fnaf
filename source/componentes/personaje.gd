extends CharacterBody2D

var lastDirection = Vector2.ZERO
var lastAnimation = "iddle_abj"
var defaultSpeed = 150
var speed = defaultSpeed

func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	direction.normalized()
	
	if direction != lastDirection:
		lastDirection = direction
	if direction.x != 0:
		velocity.x = direction.x * speed
		if direction.x == 1:
			$sprite.play("caminar_der")
			lastAnimation = "caminar_der"
		else:
			$sprite.play("caminar_izq")
			lastAnimation = "caminar_izq"
	else:
		velocity.x = 0
		match(lastAnimation):
			"caminar_der":
				$sprite.play("idle_der")
			"caminar_izq":
				$sprite.play("idle_izq")
	if direction.y != 0:
		velocity.y = direction.y * speed
		if direction.y == 1:
			$sprite.play("caminar_abj")
			lastAnimation = "caminar_abj"
		else:
			$sprite.play("caminar_arr")
			lastAnimation = "caminar_arr"
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
