extends Area2D

func _ready():
	var x = (randi() % 4) * 16
	var y = (randi() % 10) * 16
	
	$Sprite.region_rect = Rect2(x, y, 16, 16)

func _on_Food_body_entered(body):
	if body is KinematicBody2D:
		queue_free()
