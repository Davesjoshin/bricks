extends KinematicBody2D

const ball_scene = preload("res://Mini Scenes/Ball.tscn")
var motion = Vector2()
var speed = 20

func _ready():
	set_physics_process(true)
	set_process_input(true)

func _physics_process(delta):
	motion.y = get_position().y
	# var mouse_x = get_viewport().get_mouse_position().x
	
	if Input.is_action_pressed("ui_right"):
		motion.x = motion.x + speed
		if motion.x >= 925:
			motion.x = 925
			print(motion.x)
	elif Input.is_action_pressed("ui_left"):
		motion.x = motion.x - speed
		if motion.x <= 100:
			motion.x = 100

	else:
		motion.x = get_position().x
	
	# set_position(Vector2(mouse_x, y))
	set_position(motion)


func _input(event):
	if event is InputEventKey and event.scancode == KEY_UP and event.pressed == false:
		if get_node("/root/World").lives > 0:
			var ball = ball_scene.instance()
			ball.set_position(get_position()-Vector2(0,16))
			get_tree().get_root().add_child(ball)
		else:
			get_node("/root/World").game_over = true
			print("game over")
		