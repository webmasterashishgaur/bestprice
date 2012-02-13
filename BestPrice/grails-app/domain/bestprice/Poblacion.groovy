package bestprice

class Poblacion {
	Estado estado
	
	String nombre
	String nombreCorto
	Boolean estatus
	
	static constraints = {
		nombre(size:4..40)
		nombreCorto(size:4..20)
	}
	
	def beforeInsert = {
		estatus = true
	}
	
	def beforeUpdate = {
		estatus = false
	}
	
}
