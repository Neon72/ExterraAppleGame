extends TileMap


var sel = 1
var PathAtlasCoords = [Vector2i(2,0),Vector2i(3,0),Vector2i(4,0),Vector2i(5,0),Vector2i(6,0), Vector2i(7,0),Vector2i(8,0),Vector2i(9,0), Vector2i(2,1),Vector2i(3,1),Vector2i(4,1),Vector2i(5,1),Vector2i(6,1), Vector2i(7,1),Vector2i(8,1),Vector2i(9,1)]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("1"):
		sel=1
	if Input.is_action_just_pressed("2"):
		sel=2
	if Input.is_action_just_pressed("3"):
		sel=3
	var mouse :Vector2 = get_global_mouse_position()
	var cell :Vector2 = self.local_to_map(mouse)
	if Input.is_mouse_button_pressed(1):
		self.erase_cell(0,cell)
		if sel==1:
			self.set_cells_terrain_connect(0,[cell],0,-1,true)
			self.set_cell(0,cell,0,Vector2i(0,0),0)
		if sel==2:
			self.set_cells_terrain_connect(0,[cell],0,-1,true)
			self.set_cell(0,cell,0,Vector2i(1,0),0)
		if sel==3:
			self.set_cells_terrain_connect(0,[cell],0,0,true)
