extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Yael/Camera2D.zoom.x = 3
	$Yael/Camera2D.zoom.y = 3
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
