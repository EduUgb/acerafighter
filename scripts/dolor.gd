class_name PlayerPainState
extends PlayerState


@onready var hurt_box: Area2D = $HurtBox
const AirSPEED: float = 200

var golpeado: bool



func enter() -> void:
	super()
	golpeado= false

	player.animacion.play(hitAnima)
	player.animacion.animation_finished.connect(func(_anim): golpeado=true)


	
func process_physics(delta: float) -> estados:

	if golpeado and player.velocity.y > 0:
		return fallEstado
		
	if golpeado:
		return idleEstado

	
	return null
	
	
func process_input(event: InputEvent) -> estados:


	return null
func get_move_dir() -> float:
	return Input.get_axis(izquierda, derecha)  
	
func muevete(move_dir: float) -> void:
	player.velocity.x = move_dir * AirSPEED
	
	
