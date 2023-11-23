extends CharacterBody2D


const SPEED = 300.0
<<<<<<< Updated upstream
=======
@onready var Apples = get_node("Camera2D/VBoxContainer/Apples")
@onready var Money = get_node("Camera2D/Money")
@onready var Trees = get_node("Camera2D/VBoxContainer/Trees")
@onready var Paths = get_node("Camera2D/VBoxContainer/Paths")
>>>>>>> Stashed changes


func _physics_process(delta):
	
<<<<<<< Updated upstream
=======
	Apples.text = "Apples: " + str(GameMaster.Apples)
	Money.text = "$" + str(GameMaster.Money)
	Trees.text = "Trees: " + str(GameMaster.Trees)
	Paths.text = "Paths: " + str(GameMaster.Paths)
	
>>>>>>> Stashed changes
	var directionx = Input.get_axis("left", "right")
	var directiony = Input.get_axis("up", "down")
	var movement = Vector2(directionx,directiony).normalized()
	
	velocity = movement * SPEED
	
	move_and_slide()
<<<<<<< Updated upstream
=======
	
	if Input.is_action_just_pressed("Build Mode"):
		# Shortened
		GameMaster.BuildMode = not GameMaster.BuildMode

func _on_area_2d_input_event(viewport, event, shape_idx):
	# nesting reduction
	if event != InputEventMouseButton:
		return
	GameMaster.Money += GameMaster.Apples * 2
	GameMaster.Apples = 0


func _on_button_pressed():
	# Using return statements to decrease nesting, looks better
	if GameMaster.Money < 50:
		return
	for i in 5:
		var RandCard = randi_range(1,2)
		match RandCard:
			1:
				GameMaster.Trees += 1
			2:
				GameMaster.Paths += 1
	GameMaster.Money -= 50
>>>>>>> Stashed changes
