package bestprice

import java.util.Date;

class NegociacionDet {
	
	static belongsTo = NegociacionEnc
	
	String comentarioVendedor
	String comentarioComprador
	Date dateCreated
	
    static constraints = {
    }
	
}
