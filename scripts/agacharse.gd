class_name PlayerAgacharseState
extends PlayerState

# CONSTANTES
const AirSPEED: float = 200


func enter() -> void:
	super()
	player.animacion.play(agacharseAnima)


func process_physics(delta: float) -> estados:
	if not Input.is_action_pressed(abajo):
		return idleEstado
	
	if player.velocity.x != 0:
		return caminarAbajoEstado
		
	else:
		player.animacion.play(agacharseAnima)
			# Aplicar movimiento horizontald
	
		
	muevete(get_move_dir())
	
	# Aplicar gravedad
	player.velocity.y += gravity * delta
	
	# Mover al personaje
	player.move_and_slide()
	
	# Transición a estado de caída cuando empieza a descender
	if player.velocity.y > 0:
		return fallEstado
		
	return null
	
	
func process_input(event: InputEvent) -> estados:
	if event.is_action_pressed(arriba):
		return saltoEstado
	
	if event.is_action_pressed(golpe):
		return golpeAbajoEstado
	
	if event.is_action_pressed(golpeArriba):
		return golpeArribaEstado  # Permitir el ataque hacia arriba desde el estado agachado

	return null



		

		
	return null
func get_move_dir() -> float:
	return Input.get_axis(izquierda, derecha)  
	
func muevete(move_dir: float) -> void:
	player.velocity.x = move_dir * AirSPEED
	
	
