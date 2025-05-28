class_name Playernuevo
extends CharacterBody2D

@export var SPEED: float = 200.0
@export var JUMP_FORCE: float = -400.0  # Negativo porque Y aumenta hacia abajo
@export var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animacion: AnimationPlayer = $AnimationPlayer

var estado_actual: String = "idle"  # Puede ser "idle", "walk", "jump"
var movimientoKey: String = "teclas"
var izquierda: String = "izquierda"
var derecha: String = "derecha"
var arriba: String = "arriba"

func _physics_process(delta: float) -> void:
	# Aplicar gravedad siempre
	velocity.y += gravity * delta
	
	# Manejar entrada
	var move_dir = Input.get_axis(izquierda, derecha)
	var is_jumping = Input.is_action_just_pressed(arriba) and is_on_floor()
	
	# Lógica de estados
	if is_jumping:
		velocity.y = JUMP_FORCE
		estado_actual = "jump"
		animacion.play("jump")
	elif not is_on_floor():
		estado_actual = "jump"
	elif move_dir != 0:
		estado_actual = "walk"
		animacion.play("caminar")
	else:
		estado_actual = "idle"
		animacion.play("idle")
	
	# Aplicar movimiento
	velocity.x = move_dir * SPEED
	move_and_slide()
