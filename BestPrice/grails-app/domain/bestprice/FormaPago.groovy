package bestprice

import java.util.Date;

class FormaPago{

	String nombre
	String valorPago
	Estatus estatus
	Date dateCreated
	Date lastUpdated

    static constraints = {
		nombre(blank:false, size:4..40)
		valorPago(blank:false, size:4..40)
    }
	
	def beforeInsert = {
		estatus.id = 3
	}
	
}
