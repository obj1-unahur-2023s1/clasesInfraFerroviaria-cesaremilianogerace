import vagones.*


class Formacion{
	const property formacion = []

//ETAPA 1
	
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
	
//ETAPA 2
	
	method velocidadMax(){
		return formacion.filter({x=>x.velocidadMax()>0}).map({x=>x.velocidadMax()}).min()
	}
	
	method eficiente(){
		//return (formacion.filter({x=>x.eficiente() == true})+formacion.filter({x=>x.eficiente() == false})).all({x=>x.eficiente()})
		return (formacion.count({x=>x.eficiente()==false}))==0
	}
	
	method puedeMover(){
		return formacion.sum({v=>v.arrastre()})>=self.pesoTotal()
	}
	//metodo auxiliar a puedeMover()
	method pesoTotal(){
		return formacion.sum({v=>v.pesoMax()})
	}
	
	method empujeFaltante(){
		return 0.max(self.pesoTotal()-formacion.sum({v=>v.arrastre()}))
	}
	
	
	
}