package bestprice

import java.util.Date;

class FormaPago {

	String nombre
	String valorPago

	Estatus estatus
	Date dateCreated
	Date lastUpdated

    static constraints = {
		nombre(size:4..40)
		valorPago(size:4..40)
    }
	
	def beforeInsert = {
		estatus.id = 1
	}
	
}
