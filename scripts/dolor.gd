class_name PlayerPainState
extends PlayerState

#variables de vida
var vidaMax: float = 100
var vidaActual: float = 100


@onready var hurt_box: Area2D = $HurtBox

const AirSPEED: float = 200
var golpeado: bool
var final: CanvasLayer


func set_gameover_ui(ui: CanvasLayer) -> void:
	final = ui
	
func enter() -> void:
	super()
	golpeado = false

	player.animacion.play(hitAnima)
	player.animacion.animation_finished.connect(func(_anim): golpeado = true)

	# Aplicar knockback una sola vez aquí
	var knockDir: Vector2 = hurt_box.areaGolpeada.global_position - player.global_position
	player.velocity.x = knockDir.normalized().x * 500  # ajustar la fuerza aquí si es necesario

	recibirDanio(3)  # Por ejemplo, quita 10 de vida
	
func exit() -> void:
	super()
	player.velocity.x = 0


func process_physics(delta: float) -> estados:
	if golpeado:
		return idleEstado  

	# Frenado gradual hasta que termine la animación
	player.velocity.x = move_toward(player.velocity.x, 0, 800 * delta)
	player.velocity.y += gravity * delta
	player.move_and_slide()
	
	return null

func process_input(event: InputEvent) -> estados:
	# Retornar null aquí bloquea la entrada.
	# Si el evento es el de salto, lo 'consumimos' para que no se propague.
	if event.is_action_pressed("arriba"):
		return null
	
	return null

func get_move_dir() -> float:
	return Input.get_axis(izquierda, derecha)  

func muevete(move_dir: float) -> void:
	player.velocity.x = move_dir * AirSPEED


func recibirDanio(cantidad: float) -> estados:
	
	vidaActual = clamp(vidaActual - cantidad, 0 , vidaMax)
	ActualizarSalud()
	
	if vidaActual <= 0:
		
		if is_instance_valid(final):
			final.mostrar()
			await get_tree().process_frame
	return null
	
func ActualizarSalud() -> void:
	if is_instance_valid(player.vida):
		player.vida.value = vidaActual
