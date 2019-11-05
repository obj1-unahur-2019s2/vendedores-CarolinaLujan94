class Vendedor {
	var certificaciones = #{}
	
	method esVersatil() { return 
		certificaciones.size() >= 3 and 
		certificaciones.any {c=>c.esProducto()} and certificaciones.any {c=> not c.esProducto()} }
	method esFirme() { return certificaciones.sum {c=>c.puntos() >= 30 } }
	method puedeTrabajar(ciudad)
	method esInfluyente()
	method esVendedorFisico() 
}

class VendedorFijo inherits Vendedor {
	var ciudades
	
	method ciudadEnLaQueVive() { return ciudades }
	override method puedeTrabajar(ciudad) { }
	override method esInfluyente() { return false }
	override method esVendedorFisico() {return true} 
}

class VendedorViajante inherits Vendedor {
	var property provinciasHabilitadas = []

	method provinciaEnLaQuePuedeTrabajar(provincia) { return provincia == provinciasHabilitadas } 
	override method puedeTrabajar(ciudad) { }
	override method esInfluyente() { provinciasHabilitadas.sum{p=>p.poblacionQueTiene().Provincia() >= 10000000} }
	override method esVendedorFisico() {return true}
}

class ComercioCorresponsal inherits Vendedor {
	var ciudadesHabilitadas = []
	var provinciasHabilitadas = []
	
	method ciudadQueTieneSucursal(ciudad) { return ciudad == ciudadesHabilitadas }
	override method puedeTrabajar(ciudad) { }
	override method esInfluyente() { ciudadesHabilitadas.sum{c=>c.ciudadQueTieneSucursal() > 5 or provinciasHabilitadas.sum() > 3 } }
	override method esVendedorFisico() {return false}
}

class Certificaciones {
	var property puntos = 0
		
	method puntos() { return puntos }
	method esProducto() { return false } 
}

class Provincia {
	var property poblacion
	
	method poblacionQueTiene() { return poblacion }
}