extends Button

@onready var  p1Sanmi =$"../p1Ninja"
@onready var  p1Cusca = $"../p1Cusca"
@onready var  p1Union =$"../p1Union"
@onready var  p1Ninja = $"../p1Ninja"
@onready var  selector = $"../selector"
@onready var  selector2 = $"../selector2"

var animaciones_por_panel = {
	"p1Cusca": {
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
		"p1Sanmi": {
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
	"p1Union": {
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
	
	"p1Ninja": {
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
	ocultado()
	

func _on_pressed():
	var panel_activo = ""
			
	if p1Sanmi.visible:
		panel_activo = "p1Sanmi"
	elif p1Union.visible:
		panel_activo = "p1Union"
	elif p1Cusca.visible:
		panel_activo = "p1Cusca"
	elif p1Ninja.visible:
		panel_activo = "p1Ninja"
	
	if panel_activo != "":
		for key in animaciones_por_panel[panel_activo].keys():
			Global.player_data[key] = animaciones_por_panel[panel_activo][key]
		print("Animaciones aplicadas desde:", panel_activo)
		
		get_tree().change_scene_to_file("res://escenas/selector2.tscn")
	



func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_2.tscn")



func _on_button_5_pressed() -> void:
	pass # Replace with function body.
	


func _on_btn_p_1_cusca_pressed() -> void:
	ocultado()
	if not p1Cusca.visible:
		p1Cusca.visible = true
		

func _on_btn_p_1_union_pressed() -> void:
	ocultado()
	if not p1Union.visible:
		p1Union.visible = true


func _on_btn_p_1_sanmi_pressed() -> void:
	ocultado()
	if not p1Sanmi.visible:
		p1Sanmi.visible = true


func _on_btn_p_1_ninja_pressed() -> void:
	ocultado()
	if not p1Ninja.visible:
		p1Ninja.visible = true


func ocultado():
	p1Sanmi.visible = false
	p1Cusca.visible = false
	p1Union.visible = false
	p1Ninja.visible = false
	
func mostrado():
	p1Sanmi.visible = true
	p1Cusca.visible = true
	p1Union.visible = true
	p1Ninja.visible = true	
