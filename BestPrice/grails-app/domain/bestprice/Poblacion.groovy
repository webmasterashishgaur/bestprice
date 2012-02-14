package bestprice

import java.util.Date;

class Poblacion {
	Estado estado
	
	String nombre
	String nombreCorto

	Estatus estatus
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		nombre(size:4..40)
		nombreCorto(size:4..20)
	}
	
	def beforeInsert = {
		estatus.id = 1
	}
	
}
