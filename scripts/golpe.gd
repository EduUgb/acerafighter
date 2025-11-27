class_name PlayerGolpeState
extends PlayerState

# CONSTANTES
const AirSPEED: float = 200
var tipoGolpe: String = "normal"
var atacando: bool
var cooldown := 10 
var ruta: String
	
@onready var audio = get_node("/root/Node2D/final/final")
@onready var especialAudio = $"../../CanvasLayer/especial"

	
@onready var efecto: AnimatedSprite2D = $"../../CanvasLayer/videos"
	
func set_tipo_golpe(tipo: String) -> void:
	tipoGolpe = tipo

func enter():
	super()

	atacando = false
	
	var anim = ""

	match tipoGolpe:
		"normal":
			anim = golpeAnima
		"arriba":
			anim = golpeArribaAnima
		"abajo":
			anim = golpeAbajoAnima
		"aire":
			anim = golpeAbajoAnima
		"especial":
			secuencia_especial_completa()
			return
		#	anim = especialAnima3
		_:
			anim = golpeAnima

	player.animacion.play(anim)
	player.animacion.speed_scale = 0.75

	if not player.animacion.animation_finished.is_connected(fingolpe):
		player.animacion.animation_finished.connect(fingolpe)
		
		
func process_physics(delta: float) -> estados:
	if atacando:
		if player.velocity.y > 0:
			#print("Golpe terminado: cayendo, cambio a fallEstado")
			return fallEstado
		elif player.is_on_floor():
			if player.quiere_agacharse():
				#print("Golpe terminado: agacharse")
				return agacharseEstado
			else:
				#print("Golpe terminado: idle")
				return idleEstado
		else:
			#print("Golpe terminado: salto")
			return fallEstado
	return null
	
	

func fingolpe(anim):
	atacando=true 
	player.animacion.speed_scale=1
		
		
func secuencia_especial_completa():
	# 1. PAUSAR Y MOSTRAR EFECTO
	get_tree().paused = true
	efecto.visible = true
	especialAudio.play()
	efecto.play("4") # Asumiendo que tu animacion se llama 'default'

	# 2. ESPERAR A QUE TERMINE EL EFECTO (Sin crear otra función)
	await efecto.animation_finished
	
	# 3. OCULTAR Y DESPAUSAR
	efecto.visible = false
	get_tree().paused = false
	
	# 4. REPRODUCIR ANIMACION DEL PERSONAJE
	player.animacion.play(especialAnima3)
	player.animacion.speed_scale = 1.0
	
	# 5. ESPERAR A QUE TERMINE EL PERSONAJE
	await player.animacion.animation_finished
	
	# 6. TERMINAR EL ESTADO
	fingolpe("fin")
