extends CharacterBody2D  

#animaciones
@onready var sprite = $AnimatedSprite2D
@export var salto = "salto"
var golpe = "golpe"

@export var movimiento = Vector2.ZERO
var GRAVEDAD = 2500

var ppm = 150
var VELOCIDAD : float = ppm*3.0
const FUERZA_SALTO = 900



func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVEDAD * delta
	
	# Movimiento horizontal
	var dirHoriz = Input.get_axis("izquierda", "derecha")
	velocity.x = dirHoriz * VELOCIDAD
	
	# Salto
	if Input.is_action_just_pressed("arriba") and is_on_floor():
		velocity.y = -FUERZA_SALTO
		sprite.play(salto)
	elif not is_on_floor() and velocity.y >= 20:
		sprite.play("default")
		

	move_and_slide()
	
func _process(_delta):
	var jugador2 = get_node("../jugador2")

	var diferencia = jugador2.global_position.x - global_position.x
	if diferencia > -654:
		sprite.flip_h = false
	elif diferencia < -977:
			sprite.flip_h = true
	
