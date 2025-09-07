class_name PlayerGolpeState
extends PlayerState

# CONSTANTES
const AirSPEED: float = 200
var tipoGolpe: String = "normal"
var atacando: bool

	
func set_tipo_golpe(tipo: String) -> void:
	tipoGolpe = tipo

func enter():
	super()
	atacando= false
	match tipoGolpe:
		"normal":
			player.animacion.play(golpeAnima)
			player.animacion.animation_finished.connect(func(_anim): atacando=true)
			
		"arriba":
			player.animacion.play(golpeArribaAnima)
			player.animacion.animation_finished.connect(func(_anim): atacando=true)


		"abajo":
			player.animacion.play(golpeAbajoAnima)
			player.animacion.animation_finished.connect(func(_anim): atacando=true)
		"aire":
			player.animacion.play(golpeAbajoAnima)
			player.animacion.animation_finished.connect(func(_anim): atacando=true)
		"especial":
			player.animacion.play(especialAnima3)
			player.animacion.animation_finished.connect(func(_anim): atacando=true)
		_:
			player.animacion.play(golpeAnima) # default
			
	

	
func process_physics(delta: float) -> estados:
	if atacando:
		if player.velocity.y > 0:
			print("Golpe terminado: cayendo, cambio a fallEstado")
			return fallEstado
		elif player.is_on_floor():
			if player.quiere_agacharse():
				print("Golpe terminado: agacharse")
				return agacharseEstado
			else:
				print("Golpe terminado: idle")
				return idleEstado
		else:
			print("Golpe terminado: salto")
			return fallEstado
	return null
	
	

	
