package bestprice

import java.util.Date;

class BitacoraPrecio {

	static belongsTo = NegociacionEnc
	Date fechaCreacion
	Double precio
	
	def beforeInsert = {
		fechaCreacion = new Date()
	}
	
	
}
