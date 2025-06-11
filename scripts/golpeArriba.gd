class_name PlayerArribaState
extends PlayerState

# CONSTANTES
const AirSPEED: float = 200

var atacando: bool



func enter() -> void:
	super()
	atacando= false

	player.animacion.play(golpeArribaAnima)
	player.animacion.animation_finished.connect(func(_anim): atacando=true)


	
func process_physics(delta: float) -> estados:

	if atacando and player.velocity.y > 0:
		return fallEstado
		
	if atacando:
		return agacharseEstado

	
	return null
	
	
func process_input(event: InputEvent) -> estados:


	return null
func get_move_dir() -> float:
	return Input.get_axis(izquierda, derecha)  
	
func muevete(move_dir: float) -> void:
	player.velocity.x = move_dir * AirSPEED
	
	
