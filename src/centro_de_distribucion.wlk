import vendedores.*

class CentroDeDistribucion inherits Vendedor {
	var ciudades
	var vendedores = []

	method ciudadDondeEsta(ciudad) { return ciudades == ciudad }	
	method vendedorEstrella() { vendedores.sum{v=>v.esFirme().max()} }
	method puedeCubrirCiudad(provincia) { vendedores.filter{v=>v.puedeTrabajar(provincia)}}	
	method esVendedorGenerico() { vendedores.filter{v=>v.esProducto().Certificaciones() } }
	method esRobusto() { vendedores.sum{v=>v.esFirme() >= 3 } }
	
	method repartirCertificacion(certificacion) { vendedores.all{v=>v.add(certificacion)} }
	method vendedorConAfinidad() { return self.ciudadDondeEsta(ciudades) == vendedores.puedeTrabajar() }
	method vendedorCandidato() { return self.vendedorConAfinidad() and vendedores.esVersatil() }
}