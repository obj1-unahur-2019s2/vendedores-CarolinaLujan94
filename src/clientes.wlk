import vendedores.*
import centro_de_distribucion.*

class Cliente {
	var vendedores = []
	
	
	method puedeSerAtendido() {  }
	method clienteInseguro() { vendedores.filter{ v=>v.esFirme() and v.esVersatil()} }
	method clienteDetallista() { vendedores.filter {v=>v.esProducto().Certificacines() > 3} }
	method clienteHumanista() { vendedores.any{v=>v.vendedorFisico()} }
}
