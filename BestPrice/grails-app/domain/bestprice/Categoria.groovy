package bestprice

class Categoria extends Comun{

	static hasMany = [necesidadEncs:NecesidadEnc]
	String nombre
	String nombreCorto

	static constraints = {
		nombre(blank:false, size:4..40)
		nombreCorto(blank:false, size:4..20)
	}
	
	def beforeInsert = {
		estatus.id = 1
	}
	
	static mapping = {
		sort nombreCorto: "asc"
	}
	
}
