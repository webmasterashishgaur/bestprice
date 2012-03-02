package bestprice

import java.util.Date;

class Poblacion extends Comun{
	static belongsTo = [estado:Estado]
	String nombre
	String nombreCorto

	static constraints = {
		nombre(blank:false, size:4..40)
		nombreCorto(blank:false, size:4..20)
	}
	
	def beforeInsert = {
		estatus.id = 1
	}
	
}
