package bestprice

class NegociacionEnc extends Comun{

	static belongsTo = [necesidadEnc: NecesidadEnc]
	Vendedor vendedor
	Double precio
	String imagen2
	String imagen3
	String imagen4
	String imagen5
	String comentarios

    static constraints = {
		comentarios(blank:false, size:4..200)
    }
	
	def beforeInsert = {
		estatus.id = 1
	}
	
}
