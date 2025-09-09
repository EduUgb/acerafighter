extends Node2D

@onready var final: CanvasLayer = $final
@onready var lblt: Label = $cvtime/tiempo
@onready var tiempo: Timer = $cvtime/Timer
@onready var pausa: Button = $pausa

var escena_actual = null

var tiempoTotal: int = 60 #segundos

func _ready() -> void:
	tiempo.wait_time = 1.0   # cada segundo
	tiempo.one_shot = false
	tiempo.timeout.connect(_timeout)
	pausa.pressed.connect(Callable(self, "_alpresionar2"))
	escena_actual = get_tree().current_scene
	iniciar_contador(60) 
	
	
	
	
func iniciar_contador(segundos: int):
	tiempoTotal = segundos
	lblt.text = str(tiempoTotal)
	tiempo.start()
	
func _timeout():
	tiempoTotal -= 1
	lblt.text = str(tiempoTotal)

	if tiempoTotal <=0:
		tiempo.stop()
		if is_instance_valid(final):

			final.mostrar()
			await get_tree().process_frame
			

func ocultar2():
	pausa.visible = true
	get_tree().paused = false

func _alpresionar2():
	ocultar2()
	await get_tree().process_frame
	if is_instance_valid(final):
		final.mostrar()
		await get_tree().process_frame
