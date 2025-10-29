# VolumeSlider.gd (Adjunto a tu HSlider)
extends HSlider

func _ready():
	# 1. Cargar el valor guardado en Global y asignarlo al slider.
	# Esto asegura que el slider muestre la posición correcta al cargarse.
	value = Global.volumen
	
	# 2. Aplicar el volumen al Bus Master inmediatamente al cargar la escena.
	Global.apply_volume()
	
	# 3. Conectar la señal para guardar los cambios en tiempo real.
	value_changed.connect(_on_value_changed)

func _on_value_changed(nuevo_valor_lineal: float):
	# 1. Guardar el nuevo valor lineal en el Autoload Global.
	Global.volumen = nuevo_valor_lineal
	
	# 2. Aplicar el volumen inmediatamente.
	Global.apply_volume()


func _on_exit_pressed() -> void:
	# Antes de salir, nos aseguramos de que el último valor ajustado se guarde
	# y se aplique (aunque ya lo hace _on_value_changed).
	Global.apply_volume() 
	get_tree().change_scene_to_file("res://escenas/menu.tscn")
