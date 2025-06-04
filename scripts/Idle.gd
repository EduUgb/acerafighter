class_name PlayerIdleStates
extends PlayerState

func enter() -> void:
	player.animacion.play(idleAnima)


func process_input(event: InputEvent) -> estados:
	# Solo verifica el salto aquí
	if event.is_action_pressed(arriba) and player.is_on_floor():
		return saltoEstado

	
	elif event.is_action_pressed(abajo) and player.is_on_floor():
		return agacharseEstado
	
	elif event.is_action_pressed(golpe):
		return golpeEstado

	elif event.is_action_pressed(golpeArriba):
		return golpeArribaEstado
		
	return null

func process_physics(delta: float) -> estados:
	# Verificación continua de movimiento
	var move_dir = get_move_dir()
	
	if move_dir != 0:
		return caminarEstado

	
	elif not player.is_on_floor():
		return fallEstado
		
	return null

func get_move_dir() -> float:
	return Input.get_axis(izquierda, derecha)
