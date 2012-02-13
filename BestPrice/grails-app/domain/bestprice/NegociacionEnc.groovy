package bestprice

class NegociacionEnc {

	static belongsTo = [necesidadEnc: NecesidadEnc]
	
	Vendedor vendedor
	
	Double precio
	String imagen2
	String imagen3
	String imagen4
	String imagen5
	int estatus = 1
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		estatus(nullable:true)
    }
	
	def beforeInsert = {
		estatus = 1
	}
	
	def beforeUpdate = {
		estatus = 0
	}
	
}
