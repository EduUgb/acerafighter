extends CanvasLayer

@onready var panel = $Panel
@onready var againbtn = $Panel/againbtn  # asegúrate que el nodo exista exactamente con ese nombre
@onready var numeros = $"../cvtime"
@onready var salirbtn2: Button = $Panel/salirbtn
@onready var guiabtn2: Button = $Panel/guiabtn

func _ready():
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	panel.visible = false
	print(againbtn)  # debug: verificar que no sea null
	againbtn.pressed.connect(Callable(self, "_alpresionar"))
	

func mostrar():
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
