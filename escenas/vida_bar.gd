class_name BarraVida2
extends ProgressBar

func actualizar(vida_actual: float, vida_max: float = 100.0):
	value = vida_actual
	max_value = vida_max
