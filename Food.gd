extends Area2D

func _ready() -> void:
    var x = (randi() % 4) * 16
    var y = (randi() % 10) * 16

    $Sprite.region_rect = Rect2(x, y, 16, 16)

func _on_Food_body_entered(body) -> void:
    if body is KinematicBody2D:
        queue_free()
