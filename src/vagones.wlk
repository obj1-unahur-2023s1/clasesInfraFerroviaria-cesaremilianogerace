class Pasajero{
	const largo
	const ancho
	var property banio = false
	var property ordenado = true
	
	method capacidadMax(){
		if (ancho>3) { return 10*largo}
			else {return 8*largo}
	}
	
	method capacidad(){
		if (ordenado) {return self.capacidadMax()}
			else {return 0.max(self.capacidadMax()-15)}
	}
	
	method cargaMax(){
		if (banio) { return 300}
			else {return 800}
	}
	
	method pesoMax(){
		return 2000+80*self.capacidad()+self.cargaMax()
	}
	
	method mantenimiento(){
		ordenado = true
	}
	
	//POLIMORFISMO
	method eficiente()=0
	method arrastre() = 0
	method velocidadMax() = 0
}

class Carga{
	const property cargaIdeal
	var property maderas
	
	method cargaMax(){
		return 0.max(cargaIdeal-400*maderas)
	}
	
	method capacidad() = 0
	
	method banio() = false
	
	method pesoMax(){
		return 1500+self.cargaMax()
	}

	method mantenimiento(){
		maderas = 0.max(maderas-2)
	}
	
	//POLIMORFISMO
	method eficiente()=0
	method arrastre() = 0
	method velocidadMax() = 0
}

class Dormitorio{
	const compartimentos
	const camas
	
	method capacidad(){
		return compartimentos*camas
	}
	method banio() = true
	
	method cargaMax() = 1200
	
	method pesoMax() = 4000+80*self.capacidad()+self.cargaMax()
	
	//POLIMORFISMO
	method mantenimiento(){}
	method eficiente()=0//
	method arrastre() = 0
	method velocidadMax() = 0
}

class Locomotora{
	const property peso
	const property arrastre
	const property velocidadMax
	
	method eficiente(){
		return arrastre>=5*peso
	}
	
	//POLIMORFISMO
	method capacidad()=0
	method banio()=false
	method cargaMax()=0
	method pesoMax()= peso
	method mantenimiento(){}
}
