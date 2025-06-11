class_name PlayerSaltaState
extends PlayerState

# CONSTANTES
const AirSPEED: float = 200
const FUERZA_SALTO = -800   # Negativo porque en Godot hacia arriba es negativo


func enter() -> void:
	super()
	player.velocity.y = FUERZA_SALTO  # Aplicar fuerza de salto           
	player.animacion.play(saltoAnima)

func exit() -> void:
	super()                   
	player.velocity.x = 0.0   



func process_physics(delta: float) -> estados:
	# Aplicar movimiento horizontal
	muevete(get_move_dir())
	
	# Aplicar gravedad
	player.velocity.y += gravity * delta
	
	# Mover al personaje
	player.move_and_slide()
	
	# Transición a estado de caída cuando empieza a descender
	if player.velocity.y > 0:
		return fallEstado
		
	if player.is_on_floor():
		if player.quiere_agacharse():
			return agacharseEstado
		return idleEstado
		
		
	return null
	
func process_input(event: InputEvent) -> estados:
	if event.is_action_pressed(golpe):
		return golpeAireEstado
	return null

	
func get_move_dir() -> float:
	return Input.get_axis(izquierda, derecha)  
	
func muevete(move_dir: float) -> void:
	player.velocity.x = move_dir * AirSPEED
