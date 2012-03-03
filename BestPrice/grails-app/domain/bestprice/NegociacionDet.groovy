package bestprice

import java.util.Date;

class NegociacionDet {
	
	def springSecurityService
	
	static belongsTo = [negociacionEnc:NegociacionEnc]
	
	String comentarios
	Date dateCreated
	String usuario
	
    static constraints = {
		comentarios(blank:false, size:4..1000)
		usuario(blank:true)
    }
	
	def beforeInsert = {
		if(springSecurityService.currentUser){
			usuario = springSecurityService.currentUser.username 
		}
	}
	
}
