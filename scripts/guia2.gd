extends CanvasLayer

@onready var volverbtn = $Panel/volverGuia
@onready var panel3 = $Panel
@onready var numeros = $"../cvtime"
@onready var audio2 = $"../partida"
@onready var pausa = $"../pausa2"  # ⬅️ nodo de pausa
@onready var audiofinal = $"../final/final"

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	panel3.visible = false
	volverbtn.pressed.connect(_on_volverbtn)

	
func mostrar():
	panel3.visible = true
	numeros.visible = false
	audio2.stop()
	audiofinal.play()
	
func ocultar():
	panel3.visible = false
	numeros.visible = true
	audio2.play()
	audiofinal.stop()

func _on_volverbtn():
	ocultar()     # ⬅️ oculta la guía
	pausa.mostrar()  # ⬅️ vuelve a mostrar el menú de pausa
	
