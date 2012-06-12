package bestprice

import java.util.Date;

class NecesidadEnc{
 
	static belongsTo = [categoria:Categoria, comprador:Comprador]
	
	String titulo
	String descripcion
	String imagen1
	String imagen2
	String imagen3
	String imagen4
	String imagen5
	String imagen6
	Estatus estatus
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		titulo(blank:false, size:10..100)
		descripcion(blank:false, size:10..300)
		estatus(nullable:true)
    }
	
	def beforeInsert = {
		estatus.id = 3
	}
	
	static mapping = {
		sort dateCreated: "desc"
	}
	
	static searchable = true
	
}