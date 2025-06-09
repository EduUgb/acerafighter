class_name PlayerPainState
extends PlayerState

@onready var hurt_box: Area2D = $HurtBox

const AirSPEED: float = 200
var golpeado: bool

func enter() -> void:
	super()
	golpeado = false

	player.animacion.play(hitAnima)
	player.animacion.animation_finished.connect(func(_anim): golpeado = true)

	# Aplicar knockback una sola vez aquí
	var knockDir: Vector2 = hurt_box.areaGolpeada.global_position - player.global_position
	player.velocity.x = knockDir.normalized().x * 500  # ajustar la fuerza aquí si es necesario
	
func exit() -> void:
	super()
	player.velocity.x = 0
	print(player.velocity.x)

func process_physics(delta: float) -> estados:
	if golpeado:
		return idleEstado  

	# Frenado gradual hasta que termine la animación
	player.velocity.x = move_toward(player.velocity.x, 0, 800 * delta)
	player.velocity.y += gravity * delta
	player.move_and_slide()
	
	return null

func process_input(event: InputEvent) -> estados:
	return null

func get_move_dir() -> float:
	return Input.get_axis(izquierda, derecha)  

func muevete(move_dir: float) -> void:
	player.velocity.x = move_dir * AirSPEED
