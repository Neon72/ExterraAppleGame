extends TileMap


var sel = 1
var PathAtlasCoords = [Vector2i(2,0),Vector2i(3,0),Vector2i(4,0),Vector2i(5,0),Vector2i(6,0), Vector2i(7,0),Vector2i(8,0),Vector2i(9,0), Vector2i(2,1),Vector2i(3,1),Vector2i(4,1),Vector2i(5,1),Vector2i(6,1), Vector2i(7,1),Vector2i(8,1),Vector2i(9,1)]

var Trees = self.get_used_cells_by_id(0,0,Vector2i(1,0))

func _ready():
	pass # Replace with function body.

var inventory_slots = GameMaster.InventorySlots
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Super Condensed input detector 
	for i in range(1, inventory_slots):
		if Input.is_action_just_pressed(str(i)):
			sel = i
	# Mouse is only referenced for this variable so i just integrated it into
	# the definition
	var cell :Vector2 = self.local_to_map(get_global_mouse_position())
	if Input.is_mouse_button_pressed(1) and GameMaster.BuildMode:
		match sel: 
			1: 
				if self.get_cell_atlas_coords(0,cell) == Vector2i(1,0):
					GameMaster.Trees += 0.5
				if self.get_cell_atlas_coords(0,cell) != Vector2i(1,0) and self.get_cell_atlas_coords(0,cell) != Vector2i(0,0) and self.get_cell_source_id(0,cell) != -1:
					GameMaster.Paths += 0.5
				self.erase_cell(0,cell)
				self.set_cells_terrain_connect(0,[cell],0,-1,true)
				self.set_cell(0,cell,0,Vector2i(0,0),0)
			2:
				if GameMaster.Trees > 0:
					if self.get_cell_atlas_coords(0,cell) == Vector2i(1,0):
						return
					if self.get_cell_atlas_coords(0,cell) != Vector2i(1,0) and self.get_cell_atlas_coords(0,cell) != Vector2i(0,0) and self.get_cell_source_id(0,cell) != -1:
						GameMaster.Paths += 0.5
					self.erase_cell(0,cell)
					self.set_cells_terrain_connect(0,[cell],0,-1,true)
					self.set_cell(0,cell,0,Vector2i(1,0),0)
					GameMaster.Trees -= 0.5
			3:
				if GameMaster.Paths > 0:
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
