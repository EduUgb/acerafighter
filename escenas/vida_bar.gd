class_name BarraVida2

extends ProgressBar

var vidaMax: float = 100
var vidaActual: float = 100

func recibirDanio(cantidad: float):
	vidaActual -= cantidad
	
	if vidaActual <= 0:
		print("mal")
	
func ActualizarSalud():
	pass
