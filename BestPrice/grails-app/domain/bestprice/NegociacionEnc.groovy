package bestprice

class NegociacionEnc {

	static belongsTo = [necesidadEnc: NecesidadEnc]
	Vendedor vendedor
	Double precio
	String imagen2
	String imagen3
	String imagen4
	String imagen5

	Estatus estatus
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
    }
	
	def beforeInsert = {
		estatus = 1
	}
	
}
