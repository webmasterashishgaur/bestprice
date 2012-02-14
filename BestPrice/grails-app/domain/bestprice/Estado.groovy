package bestprice

import java.util.Date;

class Estado {
	Pais pais
	
	String nombre
	String nombreCorto
	
	Estatus estatus
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		nombre(size:4..40, unique:true)
		nombreCorto(size:4..20)
	}
	
	def beforeInsert = {
		estatus.id = 1
	}
	
}
