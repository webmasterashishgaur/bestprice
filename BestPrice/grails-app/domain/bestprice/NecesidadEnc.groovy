package bestprice

class NecesidadEnc {
 
	Comprador comprador
	
	String titulo
	String descripcion
	int estatus
	Date fechaCreacion
	
	String imagen1
	String imagen2
	String imagen3
	String imagen4
	String imagen5
	
    static constraints = {
		titulo(size:10..100)
		descripcion(size:10..300)
		fechaCreacion(nullable:true)
    }
	
	def beforeInsert = {
		fechaCreacion = new Date()
		estatus = 1
	}
	
	def beforeUpdate = {
		estatus = 0
	}
	
}
