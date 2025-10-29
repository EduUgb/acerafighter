extends Sprite2D


func _ready():
	# 1. Verificar si hay una textura guardada en el Autoload Global
	if Global.background_texture != null:
		
		# 2. Asignar la textura al nodo de fondo
		# Si es un TextureRect:
		self.texture = Global.background_texture
		
		# Si fuera un Sprite2D:
		# self.texture = Global.background_texture 
		
		print("✅ Fondo de escena cambiado con la textura de Global.")
	else:
		# Esto se ejecuta si no se seleccionó ninguna imagen (es null)
		print("⚠️ No hay textura de fondo guardada en Global; usando la textura por defecto de la escena.")
