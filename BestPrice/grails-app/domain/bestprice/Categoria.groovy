package bestprice

import java.util.Date;

class Categoria{

	static hasMany = [necesidadEncs:NecesidadEnc]
	String nombre
	String nombreCorto
	Estatus estatus
	Date dateCreated
	Date lastUpdated

	static constraints = {
		nombre(blank:false, size:4..40)
		nombreCorto(blank:false, size:4..20)
	}
	
	def beforeInsert = {
		estatus.id = 3
	}
	
	static mapping = {
		sort nombreCorto: "asc"
	}
	
}
