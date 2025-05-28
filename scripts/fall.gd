class_name PlayerFallState
extends PlayerState

# Velocidad de movimiento en el aire
const AirSPEED: float = 200     

func enter() -> void:
	super()
	player.animacion.play(caidaAnima)  # Usa la animación de caída si tienes una específica




func process_physics(delta: float) -> estados:
	
		

	# Aplicar gravedad
	player.velocity.y += gravity * delta
	
	# Movimiento horizontal en el aire
	muevete(get_move_dir())
	
	# Mover al personaje
	player.move_and_slide()
	
	# Verificar si hemos tocado el suelo
	if player.is_on_floor():
		# Transición a idle o walk según el input
		if get_move_dir() != 0:
			return caminarEstado
		else:
			return idleEstado
	
	return null

func get_move_dir() -> float:
	return Input.get_axis(izquierda, derecha)  
	
func muevete(move_dir: float) -> void:
	player.velocity.x = move_dir * AirSPEED
