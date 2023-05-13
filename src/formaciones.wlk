import vagones.*

class Formacion{
	const property formacion = []
	
	method capacidad(){
		return formacion.sum({v=>v.capacidad()})
	}
	
	method vagonPopular(){
		return formacion.count({v=>v.capacidad()>50})
	}
	
	method esCarguera(){
		return formacion.all({v=>v.cargaMax()>=1000})
	}
	
	method masPesado(){
		return formacion.max({v=>v.pesoMax()})
	}
	
	method masLiviano(){
		return formacion.min({v=>v.pesoMax()})
	}
	
	method dispersionPeso(){
		return self.masPesado().pesoMax()-self.masLiviano().pesoMax()
	}
	
	method cantidadBanios(){
		return formacion.count({v=>v.banio()})
	}
	
	method mantenimiento(){
		formacion.forEach({v=>v.mantenimiento()})
	}

	//UN POCO MAS SALADOS

	method equilibrada(){
		return (self.vagonesMinMax().last().capacidad()-self.vagonesMinMax().first().capacidad())<=0020
	}
	//metodo auxiliar a equilibrada()
	method vagonesMinMax(){
		const lista = []
		lista.add(formacion.min({v=>v.capacidad()}))
		lista.add(formacion.max({v=>v.capacidad()}))
		return lista
	}
	
	
	
	
	
	
}