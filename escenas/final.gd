extends CanvasLayer

@onready var panel = $Panel
@onready var againbtn = $Panel/againbtn  # asegúrate que el nodo exista exactamente con ese nombre
@onready var numeros = $"../cvtime"
@onready var salirbtn2: Button = $Panel/salirbtn
@onready var guiabtn2: Button = $Panel/guiabtn
@onready var vida1: ProgressBar =$"../CanvasLayer/vidaBar"
@onready var vida2: ProgressBar =$"../CanvasLayer2/vidaBar2"
@onready var lbl_ganador: Label = $Panel/lbl_ganador
@onready var p1: Panel =$Panel/Player1
@onready var p2: Panel =$Panel/Player2
@onready var draw: Panel = $Panel/draw
@onready var audio = $"../AudioStreamPlayer2D"
func _ready():
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	panel.visible = false
	print(againbtn)  # debug: verificar que no sea null
	againbtn.pressed.connect(Callable(self, "_alpresionar"))
	salirbtn2.pressed.connect(Callable(self, "_on_salirbtn"))
	p1.visible = false
	p2.visible = false
	draw.visible = false

func _process(delta):
	comparar_vidas()

func mostrar():
	audio.playing = true
	panel.visible = true
	numeros.visible = false
	get_tree().paused = true

func ocultar():
	panel.visible = false

	get_tree().paused = false

func _alpresionar():
	ocultar()
	await get_tree().process_frame
	get_tree().reload_current_scene()

func comparar_vidas():
	var dato1 = vida1.value
	var dato2 = vida2.value
	
	if dato1 > dato2:
		lbl_ganador.text = "EL GANADOR ES:"
		p1.visible = true
		audio.playing = true
		draw.visible = false
	if dato2 > dato1:
		lbl_ganador.text = "EL GANADOR ES:"
		p2.visible = true
		draw.visible = false
	if dato1 == dato2:
		draw.visible = true
		lbl_ganador.visible = false
		
func _on_salirbtn() -> void:
	ocultar()
	get_tree().change_scene_to_file("res://escenas/menu.tscn")
