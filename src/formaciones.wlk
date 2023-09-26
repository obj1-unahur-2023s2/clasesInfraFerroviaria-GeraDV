import vagones.*
class Formacion {
	const vagones = []
	method agregarVagon(unVagon){
		vagones.add(unVagon)
	}
	method pasajerosMaximos(){
		return vagones.sum({v => v.cantidadPasajerosMaxima()})
	}
	
	method cantidadVagonesPopulares(){
		return vagones.count({v => v.esPopular()})
	}
	
	method esFormacionCarguera(){
		return vagones.all({v => v.esCarguero()})
	}
	
	method dispersionDePesos(){
		return self.pesoMaximo() - self.pesoMinimo()
	}
	
	method pesos(){
		return vagones.map{v => v.pesoMaximo()}
	}
	
	method pesoMaximo(){
		return self.pesos().max()
	}
	
	method pesoMinimo(){
		return self.pesos().min()
	}
	
	method baniosFormacion(){
		return vagones.count({v => v.tieneBanios()})
	}
	
	method estaEquilibrada(){
		return self.cantidadMaximaPasajeroEnUnVagon()-self.cantidadMinimaPasajeroEnUnVagon() <= 20
	}
	
	method vagonesDePasajeros(){
		return vagones.filter({v => v.cantidadPasajerosMaxima()>0})
	}
	
	method cantidadMaximaPasajeroEnUnVagon(){
		return self.vagonesDePasajeros().max({v => v.cantidadPasajerosMaxima()}).cantidadPasajerosMaxima()
	}
	
	method cantidadMinimaPasajeroEnUnVagon(){
		return self.vagonesDePasajeros().min({v => v.cantidadPasajerosMaxima()}).cantidadPasajerosMaxima()
	}
	
	method estaOrganizada(){
		return not (1..vagones.size()-1).any({i => vagones.get(i).cantidadPasajerosMaxima() > 0 and vagones.get(i-1).cantidadPasajerosMaxima() == 0})
	}
}
