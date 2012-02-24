package bestprice

import java.util.Date;

class Vendedor extends Comun{
	Poblacion poblacion 
	Estado estado 
	Pais pais
	FormaPago formaPago
	
	String usuario
	String password
	String nombre
	String appPaterno
	String appMaterno
	String email
	String url
	String direccion
	String cp
	String telefono
	String comentarios
	boolean admiteDevolucion
	
	static constraints = {
		usuario(blank:false, size:6..15, unique:true)
		password(blank:false,size:6..20, password:true)
		nombre(blank:false,size:4..40)
		appPaterno(size:4..30)
		appMaterno(size:4..30)
		email(blank:false,email:true)
		direccion(size:4..100)
		cp(size:4..10)
		telefono(size:4..15)
		comentarios(size:1..100)
	}
	
	def beforeInsert = {
		estatus.id = 1
	}
	
}
