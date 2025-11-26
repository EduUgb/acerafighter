extends CanvasLayer

@onready var panel = $Panel
@onready var againbtn = $Panel/againbtn
@onready var numeros = $"../cvtime"
@onready var salirbtn2: Button = $Panel/salirbtn
@onready var guiabtn2: Button = $Panel/guiabtn
@onready var vida1: ProgressBar = $"../CanvasLayer/vidaBar"
@onready var vida2: ProgressBar = $"../CanvasLayer/vidaBar2"
@onready var lbl_ganador: Label = $Panel/lbl_ganador
@onready var p1: Panel = $Panel/Player1
@onready var p2: Panel = $Panel/Player2
@onready var draw: Panel = $Panel/draw
@onready var audio = $AudioStreamPlayer2D

var fin_mostrado: bool = false

func _ready():

	# CORRECCIÓN 1: Usar ALWAYS para que revise la vida mientras juegas
	# y también detecte los botones cuando se pause.
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	panel.visible = false
	print(againbtn)
	againbtn.pressed.connect(_alpresionar)
	salirbtn2.pressed.connect(_on_salirbtn)
	
	# Ocultamos los paneles de ganador al inicio
	p1.visible = false
	p2.visible = false
	draw.visible = false
	lbl_ganador.visible = false
	audio.play()

func _process(delta):
	# Solo revisamos vidas si el juego NO ha terminado aún
	if not fin_mostrado:
		verificar_muerte()

func mostrar():
	# Evitar que se llame múltiples veces
	if fin_mostrado: return
	
	fin_mostrado = true
	audio.play()
	panel.visible = true
	if numeros: numeros.visible = false
	get_tree().paused = true
	
	# Calculamos quién ganó justo antes de mostrar
	definir_ganador()

func ocultar():
	panel.visible = false
	get_tree().paused = false
	fin_mostrado = false

func _alpresionar():
	ocultar()
	await get_tree().process_frame
	get_tree().reload_current_scene()

# Nueva función específica para detectar muerte instantánea
func verificar_muerte():
	var dato1 = vida1.value
	var dato2 = vida2.value
	
	# CORRECCIÓN 2: Comparamos directamente con 0, 
	# ya que 'barra_vida' no existe en este script.
	if dato1 <= 0 or dato2 <= 0:
		mostrar()

# Lógica para decidir quién ganó (se usa al morir o por tiempo)
func definir_ganador():
	var dato1 = vida1.value
	var dato2 = vida2.value
	
	p1.visible = false
	p2.visible = false
	draw.visible = false
	lbl_ganador.visible = true
	
	if dato1 > dato2:
		lbl_ganador.text = "EL GANADOR ES:"
		p1.visible = true
	elif dato2 > dato1:
		lbl_ganador.text = "EL GANADOR ES:"
		p2.visible = true
	else:
		lbl_ganador.visible = false # O cambiar texto a "EMPATE"
		draw.visible = true

# Esta función la puedes llamar desde tu Timer si se acaba el tiempo
# En tu script del Timer, llama a: final.mostrar()
func comparar_vidas():
	# Mantenemos esta función por si la llamas desde el Timer del tiempo
	mostrar()

func _on_salirbtn() -> void:
	ocultar()
	get_tree().change_scene_to_file("res://escenas/menu.tscn")
