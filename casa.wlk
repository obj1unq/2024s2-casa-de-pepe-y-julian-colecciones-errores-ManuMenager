import cosas.* 
import cuentas.*
object casaDePepeYJulian {
	const property cosas = []
	var property cuenta = cuentaCorriente 

	method comprar(cosa) {
		cuenta.extraer(cosa.precio())
		cosas.add(cosa)
	}

	method cantidadDeCosasCompradas() {
		return cosas.size()
	}

	method tieneAlgun(categoria) {
		return cosas.any({cosa => cosa.categoria() == categoria})
	}

	method vieneDeComprar(categoria) {
		return not cosas.isEmpty() and cosas.last().categoria() == categoria
	}

	method esDerrochona() {
		return cosas.sum({cosa => cosa.precio()}) >= 9000
	}

	method compraMasCara() {
		return cosas.max({cosa => cosa.precio()})

	}

	method comprados(categoria){
		return cosas.filter({cosa => cosa.categoria() == categoria})
	}

	method malaEpoca() {
		//return cosas.all({cosa => cosa.categoria() == comida})	//No esta mal para este caso particular
		return cosas.all({cosa => cosa.categoria().esComestible()}) //Preferible porque es polimorfica
	}

	method queFaltaComprar(lista) {
		return lista.filter({elem => not self.estaComprado(elem)})
	}

	method estaComprado(cosa) {
		return cosas.contains(cosa)
	}

	method faltaComida() {
		return self.comprados(comida).size() < 2
		//return self.cantidadDeComida < 2}) Otra opción pero no reutiliza otros metodos
	}

	method cantidadDeComida() {
		return cosas.count({cosa => cosa.categoria().esComestible()})
	}

	method categoriasCompradas() {
		return cosas.map({cosa => cosa.categoria()}).withoutDuplicates()
	}
}
