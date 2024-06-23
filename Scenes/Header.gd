extends Control

func _ready():
	setup_labels_headers()

func _process(delta):
	if Globals.flag_icon.position == Vector2(0,0) or Globals.mine_text_field.position == Vector2(0,0):
		change_sizes_positions_headers()
	
func change_sizes_positions_headers():
	Globals.mine_text_field.position = Globals.mine_text_field.position - Vector2(50, 0)
	Globals.flag_icon.position = Globals.flag_count_label.position
	Globals.flag_icon.offset = Vector2(25, 0)
	
func header_settings():
	self.custom_minimum_size = Vector2(Globals.grid_size.x, 40)
	self.add_theme_constant_override("separation", self.custom_minimum_size.x/3)
	self.position = Vector2((get_parent().get_viewport_rect().size.x / 2) - (self.custom_minimum_size.x / 2), 10)
	
func add_children_to_header():
	self.add_child(Globals.time_lapse_label)
	self.add_child(Globals.flag_count_label)
	self.add_child(Globals.flag_icon)
	self.add_child(Globals.mine_text_field)

func time_lapse_settings():
	Globals.time_lapse_label.vertical_alignment = 1
	Globals.time_lapse_label.custom_minimum_size = Vector2(100, Globals.time_lapse_label.size.y)
	
func flag_label_settings():
	Globals.flag_count_label.label_settings = header_settings()
	Globals.flag_count_label.text = str(Globals.flag_count)
	Globals.flag_count_label.vertical_alignment = 1
	
func flag_icon_settings():
	Globals.flag_icon.texture = Globals.flag_cell
	
func label_settings():
	var label_settings = LabelSettings.new()
	label_settings.set_font_color("white")
	label_settings.set_font_size(20)
	return header_settings
	
func setup_labels_headers():
	header_settings()
	add_children_to_header()
	time_lapse_settings()
	flag_label_settings()
	header_settings()

	#print("time label", Globals.time_lapse_label.size, Globals.time_lapse_label.position)
	#print("flag label", Globals.flag_count_label.size, Globals.flag_count_label.position)
	#print("flag icon", Globals.flag_icon.get_rect().size, Globals.flag_icon.position)
	#print("mine text", Globals.mine_text_field.size, Globals.mine_text_field.position)
