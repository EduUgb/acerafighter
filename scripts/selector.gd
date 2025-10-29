extends Button

@onready var  panel2 = $"../Panel2"
@onready var  panel3 = $"../Panel3"
@onready var  panel4 = $"../Panel4"
@onready var  panel5 = $"../Panel5"

var animaciones_por_panel = {
	"panel2": {
		"idleAnima": "saco2",
		"caminarAnima": "caminar2",
		"saltoAnima": "salto2",
		"caidaAnima": "caida2",
		"agacharseAnima": "agacharse2",
		"golpeAnima": "golpe2",
		"walkagaAnima": "walkaga2",
		"hitAnima": "danio2",
		"golpeAbajoAnima": "golpeAbajo2",
		"golpeArribaAnima": "golpeArriba2",
		"blockAnima": "bloqueo222",
		"especialAnima3": "especial32"
	},
	"panel3": {
		"idleAnima": "idleUnion",
		"caminarAnima": "walkUnion",
		"saltoAnima": "saltoUnion",
		"caidaAnima": "caidaUnion",
		"agacharseAnima": "agacharseUnion",
		"golpeAnima": "golpeUnion",
		"walkagaAnima": "walkagaUnion",
		"hitAnima": "danioUnion",
		"golpeAbajoAnima": "golpeabajoUnion",
		"golpeArribaAnima": "golpearribaUnion",
		"blockAnima": "bloqueoUnion",
		"especialAnima3": "especialUnion"
	},
	
	"panel5": {
		"idleAnima": "idle",
		"caminarAnima": "caminar",
		"saltoAnima": "salto",
		"caidaAnima": "caida",
		"agacharseAnima": "agacharse",
		"golpeAnima": "golpes",
		"walkagaAnima": "walkaga",
		"hitAnima": "danio",
		"golpeAbajoAnima": "golpeAbajo",
		"golpeArribaAnima": "golpeArriba",
		"blockAnima": "bloqueo22",
		"especialAnima3": "especial3"
	}
}



func _ready() -> void:
	panel2.visible = false
	panel3.visible = false
	panel5.visible = false

func _on_pressed():
	var panel_activo = ""
			
	if panel2.visible:
		panel_activo = "panel2"
	elif panel3.visible:
		panel_activo = "panel3"
	elif panel5.visible:
		panel_activo = "panel5"
	if panel_activo != "":
		for key in animaciones_por_panel[panel_activo].keys():
			Global.player_data[key] = animaciones_por_panel[panel_activo][key]
		print("Animaciones aplicadas desde:", panel_activo)
		get_tree().change_scene_to_file("res://escenas/selector2.tscn")
	



func _on_button_2_pressed() -> void:
	if not panel2.visible:
		panel2.visible = true
		panel3.visible = false
		panel5.visible = false
			


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_2.tscn")


func _on_button_4_pressed() -> void:
	if not panel3.visible:
		panel3.visible = true
		panel2.visible = false
		panel5.visible = false


func _on_button_7_pressed() -> void:
	if not panel5.visible:
		panel5.visible = true
		panel2.visible = false
		panel3.visible = false


func _on_button_5_pressed() -> void:
	pass # Replace with function body.
	
