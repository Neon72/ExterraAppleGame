extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta):
	
	var directionx = Input.get_axis("left", "right")
	var directiony = Input.get_axis("up", "down")
	var movement = Vector2(directionx,directiony).normalized()
	
	velocity = movement * SPEED
	
	move_and_slide()
