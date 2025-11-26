class_name PlayerPainState
extends PlayerState




@onready var hurt_box: Area2D = $HurtBox


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
	var knockDir: Vector2 = player.global_position - hurt_box.areaGolpeada.global_position 
	player.velocity.x = knockDir.normalized().x * 500  # ajustar la fuerza aquí si es necesario

	player.recibir_dano(10)  # Por ejemplo, quita 10 de vida
	
func exit() -> void:
	super()

	player.velocity = Vector2.ZERO

func process_physics(delta: float) -> estados:
	if golpeado:
		return idleEstado  

	# Frenado gradual hasta que termine la animación
	player.velocity.x = move_toward(player.velocity.x, 0, 1000 * delta)
	player.velocity.y += gravity * delta
	player.move_and_slide()
	
	return null

func process_input(event: InputEvent) -> estados:
	# Retornar null aquí bloquea la entrada.
	# Si el evento es el de salto, lo 'consumimos' para que no se propague.
	if event.is_action_pressed("arriba"):
		return null
	
	return null
