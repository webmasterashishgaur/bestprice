package bestprice

import java.util.Date;

class NecesidadEnc {
 
	Comprador comprador
	
	String titulo
	String descripcion
	String imagen1
	String imagen2
	String imagen3
	String imagen4
	String imagen5
	
	Estatus estatus
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		titulo(size:10..100)
		descripcion(size:10..300)
    }
	
	def beforeInsert = {
		estatus.id = 1
	}
	
}