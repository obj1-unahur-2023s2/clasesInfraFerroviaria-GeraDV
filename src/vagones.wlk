class Pasajero{
	const property ancho
	const property largo
	const property tieneBanios
	var property estaOrdenado = true
	
	method cantidadPasajerosMaxima(){
		return if(estaOrdenado){self.cantidadPasajerosOrdenado()}else{0.max(self.cantidadPasajerosOrdenado()-15)}
	}
	
	method cantidadPasajerosOrdenado(){
		return if(ancho<=3){8*largo}else{10*largo}
	}
	
	method cargaMaxima(){
		return if(tieneBanios){300}else{800}
	}
	
	method pesoMaximo(){
		return 2000 + 80 * self.cantidadPasajerosMaxima() + self.cargaMaxima()
	}
	
	method esPopular(){
		return self.cantidadPasajerosMaxima()>50
	}
	
	method esCarguero()= self.pesoMaximo()>=1000
	
	method hacerMantenimiento(){
		estaOrdenado = true
	}
	
	method esDePasajeros() = self.cantidadPasajerosMaxima() > 0
}


class Carga{
	const property cargaMaximaIdeal
	var property maderas
	
	method cantidadPasajerosMaxima() = 0
	
	method cargaMaxima(){
		return 0.max(cargaMaximaIdeal - (maderas * 400))
	}
	
	method pesoMaximo(){
		return 1500 + self.cargaMaxima()
	}
	
	method tieneBanios() = false
	
	method esPopular() = self.cantidadPasajerosMaxima()>50
	
	method hacerMantenimiento(){
		maderas = 0.max(maderas-2)
	}
	
	method esDePasajeros() = self.cantidadPasajerosMaxima() > 0
}


class Dormitorio{
	const property compartimientos
	var property camas
	
	method cantidadPasajerosMaxima(){
		return compartimientos * camas
	}
	
	method cargaMaxima()=1200
	
	method pesoMaximo(){
		return 4000 + 80*self.cantidadPasajerosMaxima() + self.cargaMaxima()
	}
	
	method tieneBanios() = true
	
	method esPopular() = self.cantidadPasajerosMaxima()>50
	
	method hacerMantenimiento(){}
	
	method esDePasajeros() = self.cantidadPasajerosMaxima() > 0
}