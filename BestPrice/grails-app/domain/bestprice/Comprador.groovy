package bestprice

import java.util.Date;

class Comprador{

	transient springSecurityService
	String usuario
	String password
	//String password2
	String nombre = ""
	String email
	String telefono
	Boolean recibirEmail = true
	Estatus estatus
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		usuario(blank:false, size:4..15, unique:true)
		nombre(blank:true, size:0..100)
		email(blank:false, email:true, size:0..30)
		telefono(blank:true, size:0..15)
		estatus(nullable:true)
		password(blank: false, password:true, nullable: false, size:5..20)
	}
	
	def beforeInsert = {
	}
	
}
