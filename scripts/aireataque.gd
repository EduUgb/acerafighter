class_name PlayerGolpeAireState
extends PlayerState

# CONSTANTES
const AirSPEED: float = 200

var atacando: bool



func enter() -> void:
	super()
	atacando= false

	player.animacion.play(golpeAbajoAnima)
	player.animacion.animation_finished.connect(func(_anim): atacando=true)


func process_physics(delta: float) -> estados:
	if atacando:
		if player.is_on_floor():
			if player.quiere_agacharse():
				return agacharseEstado
		return idleEstado



		
	
	return null
	

	
