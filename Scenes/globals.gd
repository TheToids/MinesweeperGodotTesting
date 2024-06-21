extends Node

var time_lapse = 0
var mines = 10
var grid_sides = Vector2(10, 10)
var flag_count = 0
var cell_size = Vector2(50, 50) #change to dynamically adjust to int from float
var grid_size = grid_sides * cell_size
var cell_positions = []
var mine_positions = []
var cell_sprites = {}
var grey_cell = preload("res://Textures/Roles/Grey.png")
var green_cell = preload("res://Textures/Roles/Green.png") # change to numbers
var flag_cell = preload("res://Textures/Roles/Anchor.png")
var death_cell = preload("res://Textures/Roles/Death.png")
var Header = Control.new()
var time_lapse_label = Label.new()
var flag_count_label = Label.new()
var mine_count_label = Label.new()
var mine_text_field = LineEdit.new()





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
