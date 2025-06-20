class_name PlayerGolpeState
extends PlayerState

# CONSTANTES
const AirSPEED: float = 200

var atacando: bool



func enter() -> void:
	super()
	atacando= false

	player.animacion.play(golpeAnima)
	player.animacion.animation_finished.connect(func(_anim): atacando=true)


	
func process_physics(delta: float) -> estados:

	if atacando and player.velocity.y > 0:
		return fallEstado
		
	if atacando:
		if player.is_on_floor():
			if player.quiere_agacharse():
				return agacharseEstado
		return idleEstado

	
	return null
	
	

	
