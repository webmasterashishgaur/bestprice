package bestprice

import java.util.Date;

class Vendedor extends Comun{
	transient springSecurityService
	transient password2

	FormaPago formaPago
	String usuario
	String password
	String nombre = ""
	String email
	String telefono
	String comentarios
	Boolean admiteDevolucion = true
	Boolean recibirEmail = true
	
	static constraints = {
		usuario(blank:false, size:4..15, unique:true)
		nombre(blank:true, size:0..100)
		email(blank:false, email:true, size:0..30)
		telefono(blank:true, size:0..15)
		estatus(nullable:true)
		
		password(blank: false, password:true, nullable: false, size:5..20, validator: {password, obj ->
			def password2 = obj.properties['password2']
			if(password2 == null) return true // skip matching password validation (only important when setting/resetting pass)
			password2 == password ? true : ['invalid.matchingpasswords']
		})
	}
	
	def beforeInsert = {
		estatus.id = 1 
	}
	
	
}
