package bestprice

class NecesidadEncService {

    def serviceMethod() {
    }
	
	def enviaCorreoPosiblesCompradores(String titulo) {
		System.out.println(titulo)
		if(titulo.compareTo("") != 0){
			def srchResults = Vendedor.search("comentarios:"+titulo+""|10 , defaultOperator: "or")
			System.out.println(srchResults.results)
			//render(view: "list", model: [necesidadEncInstanceList: srchResults.results, necesidadEncInstanceTotal:srchResults.total])
		}else{
			//redirect(action: "list")
		}
		
	}
}
