@icon("res://Textures/apple.png")

class_name CellMaker

var layer : int
var position : Vector2i
var tileMap : TileMap
var cType : String
var cClass : String

var types = {
	"00": "Grass",
	"01": "Tree",
	"10": "Soil",
	"02": "Path1",
	"03": "Path2",
	"04": "Path3",
	"05": "Path4",
	"06": "Path5",
	"07": "Path6",
	"08": "Path7",
	"09": "Path8",
	"11": "Soil9",
	"12": "Path10",
	"13": "Path11",
	"14": "Path12",
	"15": "Path13",
	"16": "Path14",
	"17": "Path15",
	"18": "Path16",
	"19": "Path17"
}

var classes = {
	"00": "Grass",
	"01": "Tree",
	"02": "Path",
	"03": "Path",
	"04": "Path",
	"05": "Path",
	"06": "Path",
	"07": "Path",
	"08": "Path",
	"09": "Path",
	"10": "Soil", 
	"11": "Soil",
	"12": "Path",
	"13": "Path",
	"14": "Path",
	"15": "Path",
	"16": "Path",
	"17": "Path",
	"18": "Path",
	"19": "Path"
}

func _init(tileMap, position, layer):
	
	self.layer = layer
	self.position = position
	self.tileMap = tileMap
	
	self.cType = types[str(tileMap.get_atlas_coords().x)+str(tileMap.get_atlas_coords().x)]
	self.cClass = classes[str(tileMap.get_atlas_coords().x)+str(tileMap.get_atlas_coords().x)]
	if tileMap.get_cell_source_id(layer,position) == -1:
		self.cType = "None"
		
func name_to_atlas(name : String, condition : String):
	if name not in types:
		print("Failed to convert: Name is not in the dictionary ")
		return null
	
	var prod : Vector2i
	var metal : String
	
	if condition == "type":
		metal = types[name]
		
	if condition == "class":
		metal = classes[name]
	
	prod.x = int(metal[0])
	prod.y = int(metal[1])
	
	return prod

func erase():
	tileMap.erase_cell(layer, position)
	
func path_reset():
	tileMap.set_cells_terrain_connect(layer, [position], 0, -1, true)

func change_cell_to(newType: String, condition: String):
	erase()
	path_reset()
	tileMap.set_cell(layer, position, 0, name_to_atlas(newType, condition), 0)
