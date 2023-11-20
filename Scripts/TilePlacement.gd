extends TileMap


var sel = 1
var PathAtlasCoords = [Vector2i(2,0),Vector2i(3,0),Vector2i(4,0),Vector2i(5,0),Vector2i(6,0), Vector2i(7,0),Vector2i(8,0),Vector2i(9,0), Vector2i(2,1),Vector2i(3,1),Vector2i(4,1),Vector2i(5,1),Vector2i(6,1), Vector2i(7,1),Vector2i(8,1),Vector2i(9,1)]
var Trees = self.get_used_cells_by_id(0,0,Vector2i(1,0))
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
	if Input.is_mouse_button_pressed(1) and GameMaster.BuildMode:
		if sel==1:
			if self.get_cell_atlas_coords(0,cell) == Vector2i(1,0):
				GameMaster.Trees += 0.5
			if self.get_cell_atlas_coords(0,cell) != Vector2i(1,0) and self.get_cell_atlas_coords(0,cell) != Vector2i(0,0) and self.get_cell_source_id(0,cell) != -1:
				GameMaster.Paths += 0.5
			self.erase_cell(0,cell)
			self.set_cells_terrain_connect(0,[cell],0,-1,true)
			self.set_cell(0,cell,0,Vector2i(0,0),0)
		if sel==2 and GameMaster.Trees > 0:
			if self.get_cell_atlas_coords(0,cell) == Vector2i(1,0):
				return
			if self.get_cell_atlas_coords(0,cell) != Vector2i(1,0) and self.get_cell_atlas_coords(0,cell) != Vector2i(0,0) and self.get_cell_source_id(0,cell) != -1:
				GameMaster.Paths += 0.5
			self.erase_cell(0,cell)
			self.set_cells_terrain_connect(0,[cell],0,-1,true)
			self.set_cell(0,cell,0,Vector2i(1,0),0)
			GameMaster.Trees -= 0.5
		if sel==3 and GameMaster.Paths > 0:
			if self.get_cell_atlas_coords(0,cell) == Vector2i(1,0):
				GameMaster.Trees += 0.5
			if self.get_cell_atlas_coords(0,cell) != Vector2i(1,0) and self.get_cell_atlas_coords(0,cell) != Vector2i(0,0) and self.get_cell_source_id(0,cell) != -1:
				return
			self.erase_cell(0,cell)
			self.set_cells_terrain_connect(0,[cell],0,0,true)
			GameMaster.Paths -= 0.5


func _on_timer_timeout():
	Trees = self.get_used_cells_by_id(0,0,Vector2i(1,0))
	GameMaster.Apples += Trees.size()
	print(GameMaster.Apples)
