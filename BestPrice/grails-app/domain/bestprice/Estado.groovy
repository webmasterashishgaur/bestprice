package bestprice

import java.util.Date;

class Estado{
	static belongsTo = [pais:Pais]
	static hasMany = [poblaciones:Poblacion]
	
	String nombre
	String nombreCorto
	Estatus estatus
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		nombre(blank:false, size:4..40, unique:true)
		nombreCorto(blank:false, size:4..20)
	}
	
	def beforeInsert = {
		estatus.id = 1
	}
	
}
