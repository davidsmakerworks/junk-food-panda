extends Node2D

var food_scene  = load("res://Food.tscn")

func _on_Timer_timeout():
	var food_node = food_scene.instance()
	
	food_node.position.x = randi() % 500
	food_node.position.y = randi() % 300
	
	add_child(food_node)
