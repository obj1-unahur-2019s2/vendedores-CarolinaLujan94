class Vendedores {
	var certificaciones
	var puntajePorCertificaciones
	
	method esVersatil() { return certificaciones >= 3 }
	method esFirme() { return puntajePorCertificaciones >= 30 }
	method puedeTrabajar(provincia)
}

class VendedorFijo inherits Vendedores {
	var ciudad
	
	method ciudadEnLaQueVive() { return ciudad }
	method esInfluyente() {  }
}

class VendedorViajante inherits Vendedores {
	var property provincias = []

	method provinciaEnLaQuePuedeTrabajar(provincia) { return provincia == provincias } 
	method esInfluyente() { provincias.sum{p=>p.poblacion() >= 10000000} }
}

class ComercioCorresponsal inherits Vendedores {
	var ciudades = []
	var provincias = []
	
	method ciudadQueTieneSucursal(ciudad) { return ciudad == ciudades }
	method esInfluyente() { ciudades.sum{c=>c.ciudadQueTieneSucursal() > 5 or provincias.sum() > 3 } }
}

object certificaciones {
	var property puntos = 0
		
	method puntos() { return puntos }
	method esProducto() { return true } 
}

class Provincia {
	var property poblacion
	
	method poblacionQueTiene() { return poblacion }
}