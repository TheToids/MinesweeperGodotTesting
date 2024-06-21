extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	setupLabelsForHeader()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func setupLabelsForHeader():
	self.size = Vector2(Globals.grid_size.x, 50)
	self.position = Vector2((get_parent().get_viewport_rect().size.x / 2) - (self.size.x / 2), 10)
	var header_settings = LabelSettings.new()
	header_settings.set_font_color("black")
	header_settings.set_font_size(20)
	header_settings.set_outline_color("white")
	header_settings.set_outline_size(6)
	
	
	Globals.time_lapse_label.set_custom_minimum_size(Vector2(self.size.x,50))
	Globals.time_lapse_label.label_settings = header_settings
	Globals.time_lapse_label.text = str(int(Globals.time_lapse))
	Globals.time_lapse_label.position = Vector2(Globals.time_lapse_label.position.x - 50, Globals.time_lapse_label.position.y)
	Globals.time_lapse_label.horizontal_alignment = 2
	self.add_child(Globals.time_lapse_label)
	
	#flag_count_label
	Globals.flag_count_label.set_custom_minimum_size(Vector2(self.size.x,50))
	Globals.flag_count_label.label_settings = header_settings
	Globals.flag_count_label.text = str(Globals.flag_count)
	Globals.flag_count_label.horizontal_alignment = 1
	self.add_child(Globals.flag_count_label)
	
	Globals.mine_count_label.set_custom_minimum_size(Vector2(self.size.x,50))
	Globals.mine_count_label.label_settings = header_settings
	Globals.mine_count_label.text = str(Globals.mines) 
	Globals.mine_count_label.horizontal_alignment = 0
	self.add_child(Globals.mine_count_label)
	
	
