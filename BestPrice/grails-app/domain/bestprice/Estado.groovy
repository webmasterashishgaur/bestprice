package bestprice

class Estado {
	Pais pais
	
	String nombre
	String nombreCorto
	Boolean estatus
	
	static constraints = {
		nombre(size:4..40, unique:true)
		nombreCorto(size:4..20)
	}
	
	def beforeInsert = {
		estatus = true
	}
	
	def beforeUpdate = {
		estatus = false
	}
	
}
