extends Node2D

func _ready():
	for child in get_children():
		child.add_to_group("bricks")
		get_node("/root/World").brick_count += 1
	
	# print(get_tree().get_nodes_in_group("bricks"))
