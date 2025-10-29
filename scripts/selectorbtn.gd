extends Button

@onready var  panel2 = $"../Panel2"
@onready var  panel3 = $"../Panel3"
@onready var  panel4 = $"../Panel4"
@onready var  panel5 = $"../Panel5"

@export var new_texture: Texture 



func _ready() -> void:
	
	panel2.visible = false
	panel3.visible = false
	panel4.visible = false
	panel5.visible = false

func _on_pressed():
			
	
	Global.background_texture = new_texture
	
	if Global.background_texture == null:
		pass
	else:
		get_tree().change_scene_to_file("res://escenas/pruebaF.tscn")





func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/selector.tscn")







func _on_paredbtn_pressed() -> void:
	new_texture = load("res://escenarios/pared.jpeg")
	if not panel2.visible:
		panel2.visible = true
		panel3.visible = false
		panel4.visible = false
		panel5.visible = false


func _on_cecotbtn_pressed() -> void:
	new_texture = load("res://escenarios/Cecot Escenario.png")
	if not panel3.visible:
		panel2.visible = false
		panel3.visible = true
		panel4.visible = false
		panel5.visible = false


func _on_discobtn_pressed() -> void:
	new_texture = load("res://escenarios/disco.png")
	if not panel5.visible:
		panel2.visible = false
		panel3.visible = false
		panel4.visible = false
		panel5.visible = true


func _on_maizalbtn_pressed() -> void:
	new_texture = load("res://escenarios/Maizal escenario.png")
	if not panel4.visible:
		panel2.visible = false
		panel3.visible = false
		panel4.visible = true
		panel5.visible = false
