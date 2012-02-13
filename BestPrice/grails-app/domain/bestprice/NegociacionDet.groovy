package bestprice

class NegociacionDet {
	
	static belongsTo = NegociacionEnc
	
	String comentarioVendedor
	String comentarioComprador
	Date fecha
	
    static constraints = {
    }
	
	def beforeInsert = {
		fecha = new Date()
	}
	
}
