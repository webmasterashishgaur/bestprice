package bestprice

class Marca {

	String nombre
	String nombreCorto
	int estatus
	
	static constraints = {
		nombre(size:4..40)
		nombreCorto(size:4..20)
	}
	
	def beforeInsert = {
		estatus = 1
	}
	
	def beforeUpdate = {
		estatus = 0
	}
	
}
