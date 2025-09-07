class_name ObstaculoDaniable
extends CharacterBody2D  # Cambiado a CharacterBody2D para movimiento

# Configuración del movimiento
@export var velocidad := 100.0
@export var distancia_max := 200.0  # Píxeles desde el punto inicial

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var posicion_inicial := global_position
@onready var vida:  ProgressBar = $CanvasLayer2/vidaBar2
@onready var final: CanvasLayer = $"../final"

#variables de vida
var vidaMax2: float = 100
var vidaActual2: float = 100


var direccion := 1  # 1 = derecha, -1 = izquierda
var invulnerable := true

func _ready():
	vidaActual2 = vidaMax2
	ActualizarSalud2()
	anim_player.play("saco")
	posicion_inicial = global_position
	invulnerable = true
	await get_tree().create_timer(0.5).timeout
	invulnerable = false

func recibir_golpe():
	if invulnerable:
		return
	print("Golpe recibido!")
	anim_player.play("sacohit")
	recibirDanio2(3)
	await anim_player.animation_finished
	anim_player.play("saco")
	
func _physics_process(delta):
	# Movimiento automático
	if anim_player.current_animation != "sacohit":  # Solo se mueve si no está siendo golpeado
		velocity.x = velocidad * direccion
		move_and_slide()
		
		# Cambia de dirección al alcanzar el límite
		if abs(global_position.x - posicion_inicial.x) >= distancia_max:
			direccion *= -1





func recibirDanio2(cantidad: float) -> estados:
	vidaActual2 = clamp(vidaActual2 - cantidad, 0 , vidaMax2)
	ActualizarSalud2()
	
	if vidaActual2 <= 0:
		
		if is_instance_valid(final):
			final.mostrar()
			await get_tree().process_frame
	return null
	
func ActualizarSalud2() -> void:
	if is_instance_valid(self.vida):
		self.vida.value = vidaActual2
