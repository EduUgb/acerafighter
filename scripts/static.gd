class_name ObstaculoDaniable
extends CharacterBody2D  # Cambiado a CharacterBody2D para movimiento

# Configuración del movimiento
@export var velocidad := 100.0
@export var distancia_max := 200.0  # Píxeles desde el punto inicial

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var posicion_inicial := global_position

var direccion := 1  # 1 = derecha, -1 = izquierda

func _ready():
	print("Obstaculo listo")
	anim_player.play("saco")  # Estado inicial
	posicion_inicial = global_position  # Guardamos posición inicial

func _physics_process(delta):
	# Movimiento automático
	if anim_player.current_animation != "sacohit":  # Solo se mueve si no está siendo golpeado
		velocity.x = velocidad * direccion
		move_and_slide()
		
		# Cambia de dirección al alcanzar el límite
		if abs(global_position.x - posicion_inicial.x) >= distancia_max:
			direccion *= -1


func recibir_golpe():
	print("Golpe recibido!")
	anim_player.play("sacohit")
	print("auch")
	await anim_player.animation_finished
	anim_player.play("saco")  # Vuelve a animación normal
