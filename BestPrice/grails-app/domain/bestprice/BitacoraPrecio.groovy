package bestprice

import java.util.Date;

class BitacoraPrecio extends Comun{

	static belongsTo = NegociacionEnc
	Double precio
	
	static constraints = {
		precio(min:0d, scale:2)
	}
	
}
