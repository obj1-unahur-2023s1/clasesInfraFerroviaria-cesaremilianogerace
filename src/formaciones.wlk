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
	
	
}