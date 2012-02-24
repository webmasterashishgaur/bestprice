package bestprice

import java.util.Date;

class Estado extends Comun{
	Pais pais
	String nombre
	String nombreCorto
	
	static constraints = {
		nombre(blank:false, size:4..40, unique:true)
		nombreCorto(blank:false, size:4..20)
	}
	
	def beforeInsert = {
		estatus.id = 1
	}
	
}
