package bestprice

class Pais {
	String nombre
	String nombreCorto
	Boolean estatus
	static constraints = {
		nombre(blank:false, size:4..40, unique:true)
		nombreCorto(blank:false, size:4..20)
	}
	
	def beforeInsert = {
		estatus = true
	}
	
	def beforeUpdate = {
		estatus = false
	}

}
