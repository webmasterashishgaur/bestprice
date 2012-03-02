package bestprice

import java.util.Date;

class NegociacionDet {
	
	static belongsTo = [negociacionEnc:NegociacionEnc]
	
	String comentarios
	Date dateCreated
	
    static constraints = {
    }
	
}
