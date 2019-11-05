import vendedores.*

class CentroDeDistribucion inherits Vendedores {
	var ciudades
	var vendedores = []
	var certificacion

	method ciudadDondeEsta(ciudad) { return ciudades == ciudad }	
	method vendedorEstrella() { vendedores.sum{v=>v.puntajePorCertificaciones().max()} }
	method puedeCubrirCiudad(provincia) { vendedores.filter{v=>v.puedeTrabajar(provincia)}}	
	method esVendedorGenerico() { vendedores.filter{v=> not v.esProducto().certificaciones() } }
	method esRobusto() { vendedores.sum{v=>v.esFirme() >= 3 } }
	
	method repartirCertificacion() { vendedores.all{v=>v.add(certificacion)} }
	method vendedorConAfinidad() { return self.ciudadDondeEsta(ciudades) == vendedores.puedeTrabajar() }
	method vendedorCandidato() { return self.vendedorConAfinidad() and vendedores.esVersatil() }
}