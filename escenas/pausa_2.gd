extends CanvasLayer

@onready var panel2 = $Panel
@onready var againbtn2: Button =  $Panel/againbtn2# asegúrate que el nodo exista exactamente con ese nombre
@onready var numeros = $"../cvtime"
@onready var pausabtn: Button = $"../pausabtn"
@onready var pausa: CanvasLayer = $"../pausa2"
@onready var salirbtn2: Button = $Panel/salirbtn2
@onready var guiabtn2: Button = $Panel/guiabtn2
@onready var audio2 = $"../final/final"
@onready var guia = $"../guia"
var escena_actual = null


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	panel2.visible = false
	#print(againbtn2)  # debug: verificar que no sea null
	againbtn2.pressed.connect(_alpresionar)
	salirbtn2.pressed.connect(_on_pausabtn)
	guiabtn2.pressed.connect(_on_guia)
	
func mostrar():
	panel2.visible = true
	numeros.visible = false
	get_tree().paused = true
	audio2.play()

func ocultar():
	panel2.visible = false   # ocultamos solo el panel
	numeros.visible = true
	get_tree().paused = false
	audio2.stop()
	
func _alpresionar():
	ocultar()
	await get_tree().process_frame



func _on_pausabtn() -> void:
	ocultar()
	get_tree().change_scene_to_file("res://escenas/menu.tscn")
	

func _on_guia() -> void:
	ocultar()
	guia.mostrar()
