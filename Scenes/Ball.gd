extends RigidBody2D

var bricks_in_row = 0
var point_multi = 1
export var base_point = 5

export var speedup = 1
const MAXSPEED = 500

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		# Kill bricks when hit
		if body.is_in_group("bricks"):
			bricks_in_row += point_multi
			get_node("/root/World").score += bricks_in_row * base_point
			get_node("/root/World").brick_count -= 1
			body.queue_free()
			if get_node("/root/World").brick_count <= 0:
				print("no more bricks")
		
		# Change speed & direction when hitting paddle
		if body.get_name() == "Paddle":
			bricks_in_row = 0
			var velocity = get_linear_velocity() * speedup
			print(velocity)
			
			if velocity.x >= MAXSPEED:
				velocity.x = MAXSPEED
				
			if velocity.y >= MAXSPEED:
				velocity.y = MAXSPEED
				
			set_linear_velocity(velocity)
	
	# Ball reaches bottom of screen
	if get_position().y > get_viewport_rect().end.y:
		queue_free()
		print("ball is gone")
		get_node("/root/World").lives -= 1
