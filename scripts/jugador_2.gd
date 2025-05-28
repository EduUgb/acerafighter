extends CharacterBody2D  

@onready var sprite = $AnimatedSprite2D


@export var movimiento = Vector2.ZERO
var GRAVEDAD = 2500

var ppm = 150
var VELOCIDAD : float = ppm*3.0
const FUERZA_SALTO = 900



func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVEDAD * delta
	
	# Movimiento horizontal
	var dirHoriz = Input.get_axis("izquierda2", "derecha2")
	velocity.x = dirHoriz * VELOCIDAD
	
	# Salto
	if Input.is_action_just_pressed("arriba2") and is_on_floor():
		velocity.y = -FUERZA_SALTO

	move_and_slide()
	
func _process(_delta):
	var jugador1 = get_node("../jugador1")
	
		
	var diferencia = jugador1.global_position.x - global_position.x
	print(global_position)
	if diferencia > 1000:
		sprite.flip_h = false
	elif diferencia < 977:
			sprite.flip_h = true
