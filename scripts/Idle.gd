class_name PlayerIdleStates
extends PlayerState


func enter() -> void:
	player.animacion.play(idleAnima)

func process_input(event: InputEvent) -> estados:
	# Golpe especial: 3 teclas simultáneas
	if (Input.is_action_pressed(golpe)
	and Input.is_action_pressed(golpeArriba)
	and Input.is_action_pressed(arriba)
	):
		if player.puede_usar_golpe_especial():
			player.registrar_golpe_especial()
			golpeEstado.set_tipo_golpe("especial")
			return golpeEstado
		return null

	# Golpes normales
	if event.is_action_pressed(golpe):
		player.reset_combo()
		golpeEstado.set_tipo_golpe("normal")
		return golpeEstado
	elif event.is_action_pressed(golpeArriba):
		player.reset_combo()
		golpeEstado.set_tipo_golpe("arriba")
		return golpeEstado

		# Movimiento / otras acciones
	if Input.is_action_just_pressed(arriba) and player.is_on_floor():
		golpeEstado.set_tipo_golpe("normal")
		return saltoEstado
		
	elif event.is_action_pressed(abajo) and player.is_on_floor():
		golpeEstado.set_tipo_golpe("normal")
		return agacharseEstado
	if event.is_action_pressed(block):
		golpeEstado.set_tipo_golpe("normal")
		return bloqueoEstado


	return null



func process_physics(delta: float) -> estados:
	var move_dir := Input.get_axis(izquierda, derecha)
	if move_dir != 0:
		golpeEstado.set_tipo_golpe("normal")
		return caminarEstado
	elif not player.is_on_floor():
		golpeEstado.set_tipo_golpe("normal")
		return fallEstado
	return null
