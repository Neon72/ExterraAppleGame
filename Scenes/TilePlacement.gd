extends TileMap

var sel : int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("1"):
		sel = 0
	if Input.is_action_just_pressed("2"):
		sel = 1
	if Input.is_action_just_pressed("3"):
		sel = 2
	var mouse :Vector2 = get_global_mouse_position()
	var cell :Vector2 = self.local_to_map(mouse)
	if Input.is_mouse_button_pressed(1):
		self.set_cell(0,cell,0,Vector2i(sel,0),0)
