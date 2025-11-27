extends Button



@onready var p1Sanmi = $"../p1Sanmi"
@onready var p1Cusca =$"../p1Cusca"
@onready var p1Union = $"../p1Union"
@onready var p1Ninja =$"../p1Ninja"

@onready var p2Sanmi = $"../p2Sanmi"
@onready var p2Cusca =$"../p2Cusca"
@onready var p2Union = $"../p2Union"
@onready var p2Ninja = $"../p2Ninja"

@onready var p1txt = $"../jugador1txt"
@onready var p2txt = $"../jugador2txt"

# NUEVO (solo guarda qué eligió cada jugador)
var seleccion_p1 := ""
var seleccion_p2 := ""

func _ready():
	ocultado()
	ocultado2()
	
var animaciones_por_panel = {
	"p1Cusca": {
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
	},
	"p1Sanmi": {
		"idleAnima": "idleSanmi",
		"caminarAnima": "sanmiWalk",
		"saltoAnima": "sanmiSalto",
		"caidaAnima": "sanmiFall",
		"agacharseAnima": "sanmiAgachado",
		"golpeAnima": "sanmiAtaque",
		"walkagaAnima": "sanmiWalkaga",
		"hitAnima": "sanmiHit",
		"golpeAbajoAnima": "sanmiAtaqueAbajo",
		"golpeArribaAnima": "sanmiAtaqueArriba",
		"blockAnima": "sanmiEscudo",
		"especialAnima3": "sanmiEspecial"
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

func ocultado():
	p1Sanmi.visible = false
	p1Cusca.visible = false
	p1Union.visible = false
	p1Ninja.visible = false

func ocultado2():
	p2Sanmi.visible = false
	p2Cusca.visible = false
	p2Union.visible = false
	p2Ninja.visible = false

# ---------------------------
# BOTONES PLAYER 1
# ---------------------------

#func _on_btn_p_1_cusca_pressed():
#	ocultado()
#	p1Cusca.visible = true
#	seleccion_p1 = "p1Cusca"
#	guardar_p1()

func _on_btn_p_1_union_pressed():
	ocultado()
	p1Union.visible = true
	seleccion_p1 = "p1Union"
	guardar_p1()
	p1txt.text = "UNION\nSELECCIONADO"
	
func _on_btn_p_1_sanmi_pressed():
	ocultado()
	p1Sanmi.visible = true
	seleccion_p1 = "p1Sanmi"
	guardar_p1()
	p1txt.text = "SAN MIGUEL\nSELECCIONADO"
	
func _on_btn_p_1_ninja_pressed():
	ocultado()
	p1Ninja.visible = true
	seleccion_p1 = "p1Ninja"
	guardar_p1()
	p1txt.text = "CABAÑAS\nSELECCIONADO"
# ---------------------------
# BOTONES PLAYER 2
# ---------------------------

#func _on_btn_p_2_cusca_pressed():
	#ocultado2()
	#p2Cusca.visible = true
	#seleccion_p2 = "p1Cusca"
	#guardar_p2()

func _on_btn_p_2_union_pressed():
	ocultado2()
	p2Union.visible = true
	seleccion_p2 = "p1Union"
	guardar_p2()
	p2txt.text = "UNION\nSELECCIONADO"

func _on_btn_p_2_sanmi_pressed():
	ocultado2()
	p2Sanmi.visible = true
	seleccion_p2 = "p1Sanmi"
	guardar_p2()
	p2txt.text = "SAN MIGUEL\nSELECCIONADO"
	
func _on_btn_p_2_ninja_2_pressed():
	ocultado2()
	p2Ninja.visible = true
	seleccion_p2 = "p1Ninja"
	guardar_p2()
	p2txt.text = "CABAÑAS\nSELECCIONADO"
# ---------------------------------------
# FUNCIONES PARA GUARDAR LA ELECCIÓN
# ---------------------------------------

func guardar_p1():
	if seleccion_p1 == "":
		return
	for key in animaciones_por_panel[seleccion_p1].keys():
		Global.player1_data[key] = animaciones_por_panel[seleccion_p1][key]
	print("SANMI FALL GUARDADO COMO: ", Global.player1_data["caidaAnima"])


func guardar_p2():
	if seleccion_p2 == "":
		return
	for key in animaciones_por_panel[seleccion_p2].keys():
		Global.player2_data[key] = animaciones_por_panel[seleccion_p2][key]
	print("SANMI FALL 2 GUARDADO COMO: ", Global.player2_data["caidaAnima"])
	
func _on_pressed() -> void:
	if not hay_panel_activo():
		print("No podes continuar, no hay personajes seleccionados.")
		return
	
	# SI HAY paneles activos → sí permite ir al otro menú
	
	get_tree().change_scene_to_file("res://escenas/selector2.tscn")
	


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/menu_2.tscn")


func hay_panel_activo() -> bool:
	var p1_ok = p1Sanmi.visible or p1Cusca.visible or p1Union.visible or p1Ninja.visible
	var p2_ok = p2Sanmi.visible or p2Cusca.visible or p2Union.visible or p2Ninja.visible
	return p1_ok and p2_ok
