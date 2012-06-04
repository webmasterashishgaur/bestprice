package bestprice

import java.util.Date;

class BitacoraPrecio{

	static belongsTo = NegociacionEnc
	Double precio
	Estatus estatus
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		precio(min:0d, scale:2)
	}
	
}
