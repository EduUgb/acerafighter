extends Area2D

@onready var padre = get_parent()  # Este será jugador2

func _ready():
	collision_layer = 0
	collision_mask = 2
	await get_tree().process_frame  # Espera 1 frame
	area_entered.connect(_on_area_entered)


#definido en el script padre del jugador estático
func _on_area_entered(area: Area2D) -> void:
	if area is HitBox:
		if padre.has_method("recibir_golpe"):  
			padre.recibir_golpe()


 
