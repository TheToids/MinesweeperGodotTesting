extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.mine_text_field.size = Vector2(120,50)
	Globals.mine_text_field.max_length = 2
	Globals.mine_text_field.placeholder_text = "[Enter Mines]"
	Globals.mine_text_field.flat = true
	Globals.mine_text_field.set_select_all_on_focus(true)

	self.add_child(Globals.mine_text_field)
	Globals.mine_text_field.text_changed.connect(_on_LineEdit_text_changed)
	Globals.mine_text_field.text_submitted.connect(_on_LineEdit_text_entered)
	#Globals.mine_text_field.connect("mouse_exited", _mouse_exited)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_LineEdit_text_changed(event):
	Globals.mine_text_field.max_length = 2
	if event.is_valid_float():
		Globals.mine_text_field.text = str(int(Globals.mine_text_field.text))
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
			Globals.mine_text_field.text = str(int(Globals.mine_text_field.text))
			if Globals.mine_text_field.get_text().contains("/"): return
			Globals.mine_text_field.max_length = 5
			Globals.mine_text_field.text = Globals.mine_text_field.get_text() + "/" + Globals.mine_text_field.get_text()
			Globals.mines = int(Globals.mine_text_field.get_text().get_slice("/", 0))

	
	
