package bestprice

class NecesidadEncService {

    def serviceMethod() {
    }
	
	def enviaCorreoPosiblesCompradores(String titulo, String comentarios) {
		System.out.println(titulo)
		if(titulo.compareTo("") != 0){
			def srchResults = Vendedor.search("comentarios:"+titulo+"" , defaultOperator: "or")
			Iterator iter = srchResults.results.iterator();
			while (iter.hasNext()){
			  def vendedor = (Vendedor) iter.next()
			  System.out.println(vendedor.usuario +" --- "+vendedor.email)
			  sendMail {
				to ""+vendedor.email
				subject "Nueva Demanda publicada: "+titulo
				body "Se ha publicado una nueva Demanda: " +comentarios  
			  }
			}
		}
	}
}
