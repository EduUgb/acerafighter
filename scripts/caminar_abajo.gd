class_name PlayerCaminarAbajoState
extends PlayerState

# CONSTANTES
const SPEED: float = 200     

func enter() -> void:
	super()                   
	player.animacion.play(walkagaAnima)

func exit() -> void:
	super()                   
	player.velocity.x = 0.0   

func process_physics(delta: float) -> estados:
	muevete(get_move_dir())

	# Si ya no se mantiene abajo, volver a idle
	if not Input.is_action_pressed(abajo):
		return idleEstado
	
	# Si no se mueve en horizontal, volver al estado agachado estático
	if get_move_dir() == 0.0 || !Input.is_action_pressed(abajo):
		return agacharseEstado if Input.is_action_pressed(abajo) else idleEstado
	

	muevete(get_move_dir())

	super(delta)  
	return null   

func process_input(event: InputEvent) -> estados:
	print(player.velocity.x)
	if event.is_action_pressed(golpeArriba):
		print("Golpe arriba recibido en caminar abajo")
		return golpeArribaEstado
		
	if event.is_action_pressed(golpe):
		print("Golpe recibido en caminar abajo")
		return golpeAbajoEstado
	return null

func get_move_dir() -> float:
	return Input.get_axis(izquierda, derecha)  

func muevete(move_dir: float) -> void:
	player.velocity.x = move_dir * SPEED  
