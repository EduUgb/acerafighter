class_name PlayerCaminaState
extends PlayerState

# CONSTANTES
const SPEED: float = 200     
   

# Se ejecuta cuando el estado se activa
func enter() -> void:
	super()                   
	player.animacion.play(caminarAnima)

# Se ejecuta cuando el estado se desactiva
func exit() -> void:
	super()                   
	player.velocity.x = 0.0   

# Lógica de física (se ejecuta cada frame de física)
func process_physics(delta: float) -> estados:

	muevete(get_move_dir())

	
	# Si no hay input de movimiento, cambia a estado idle
	if get_move_dir() == 0.0: 
		return idleEstado
	
	super(delta)  
	return null   
	
# PlayerIdleState.gd
func process_input(event: InputEvent) -> estados:
	super(event)

	if event.is_action_pressed(arriba): return saltoEstado

	
	elif event.is_action_pressed(abajo) and player.is_on_floor():
		return agacharseEstado
	
	elif event.is_action_pressed(golpe) and player.is_on_floor():
		return golpeEstado
		
	return null
# Obtiene dirección de movimiento (-1: izquierda, 0: quieto, 1: derecha)
func get_move_dir() -> float:
	return Input.get_axis(izquierda, derecha)  
	
# Aplica movimiento horizontal al personaje
func muevete(move_dir: float) -> void:
	player.velocity.x = move_dir * SPEED  
	
