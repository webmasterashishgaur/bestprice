package bestprice

import java.util.Date;

class FormaPago extends Comun{

	String nombre
	String valorPago

    static constraints = {
		nombre(blank:false, size:4..40)
		valorPago(blank:false, size:4..40)
    }
	
	def beforeInsert = {
		estatus.id = 1
	}
	
}
