package bestprice

class FormaPago {

	String nombre
	String valorPago
	Boolean estatus

    static constraints = {
		nombre(size:4..40)
		valorPago(size:4..40)
    }
	
	def beforeInsert = {
		estatus = true
	}
	
	def beforeUpdate = {
		estatus = false
	}
	
}
