class_name ObstaculoDaniable
extends StaticBody2D  # O CharacterBody2D si necesita movimiento

@onready var anim_player: AnimationPlayer = $AnimationPlayer


func _ready():

	print("Obstaculo listo")  # Debug
	anim_player.stop()
	anim_player.play("saco")  # Forzar estado inicial

func recibir_golpe():
	print("Golpe recibido!")  # Debug para ver si se llama al inicio
	anim_player.play("sacohit")
	print("auch")  # O lo que quieras que haga
	await anim_player.animation_finished
	anim_player.play("saco")  # vuelve a idle
