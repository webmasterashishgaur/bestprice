package bestprice

class NegociacionEnc extends Comun{

	static belongsTo = [necesidadEnc: NecesidadEnc]
	Vendedor vendedor
	Double precio
	String imagen2
	String imagen3
	String imagen4
	String imagen5

    static constraints = {
    }
	
	def beforeInsert = {
		estatus = 1
	}
	
}
