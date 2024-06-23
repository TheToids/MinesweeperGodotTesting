extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	#Globals.mine_text_field.anchor_left = 1
	
	Globals.mine_text_field.add_theme_font_size_override("font_size", 20)
	#Globals.mine_text_field.set_anchors_preset(PRESET_CENTER_RIGHT)
	#Globals.mine_text_field.size = Vector2(95,31)
	Globals.mine_text_field.set_right_icon(Globals.death_cell)
	Globals.mine_text_field.set_context_menu_enabled(false)
	Globals.mine_text_field.max_length = 2
	Globals.mine_text_field.placeholder_text = "10"
	Globals.mine_text_field.flat = true
	#Globals.mine_text_field.alignment = 0
	Globals.mine_text_field.text_changed.connect(_on_LineEdit_text_changed)
	Globals.mine_text_field.text_submitted.connect(_on_LineEdit_text_entered)	
	Globals.mine_text_field.focus_entered.connect(_on_focus_entered)
	


	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	#print(Globals.flag_count)
	#if Globals.mines - Globals.flag_count > 0 and Globals.mine_text_field.text != "": Globals.mine_text_field.text = str(Globals.mines - Globals.flag_count) + "/" + str(Globals.mines)
	#else: Globals.mine_text_field.text = "0"

func _on_focus_entered():
	Globals.mine_text_field.clear()
	
func _on_LineEdit_text_changed(event):
	
	Globals.mine_text_field.max_length = 2
	if event.is_valid_float():
		Globals.mine_text_field.text = str(int(Globals.mine_text_field.text))
		Globals.mine_text_field.caret_column = len(Globals.mine_text_field.get_text())
	else: 
		Globals.mine_text_field.delete_char_at_caret()
		
		
func _on_LineEdit_text_entered(_event):
	Globals.mine_text_field.release_focus()
	if Globals.mine_text_field.get_text().contains("/"): return
	Globals.mine_text_field.max_length = 5
	Globals.mine_text_field.text = str(int(Globals.mine_text_field.text))
	Globals.mine_text_field.text = Globals.mine_text_field.get_text() + "/" + Globals.mine_text_field.get_text()
	Globals.mines = int(Globals.mine_text_field.get_text().get_slice("/", 0))



func _unhandled_input(event):
	if event is InputEventMouseButton and event.is_released():
		if Globals.mine_text_field.has_focus():
			Globals.mine_text_field.release_focus()
			Globals.mine_text_field.max_length = 5
			Globals.mine_text_field.text = str(int(Globals.mine_text_field.text))
			if Globals.mine_text_field.get_text().is_valid_float() and int(Globals.mine_text_field.get_text()) == 0: 
				Globals.mine_text_field.text = "0/0"
			else:
				Globals.mine_text_field.text = Globals.mine_text_field.get_text() + "/" + Globals.mine_text_field.get_text()
				Globals.mines = int(Globals.mine_text_field.get_text().get_slice("/", 0))
			$"../Grid".chooseMines()
			$"../Grid".popGrid()

	
	
