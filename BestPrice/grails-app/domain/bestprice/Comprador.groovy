package bestprice

class Comprador {
	Poblacion poblacion
	Estado estado
	Pais pais
	
	String usuario
	String password
	String nombre
	String appPaterno
	String appMaterno
	String email
	String direccion
	String cp
	String telefono
	String comentarios
	Date fechaNacimiento
	Boolean estatus
	Date fechaCreacion
	
	static constraints = {
		usuario(size:6..15, unique:true)
		password(size:6..20, password:true)
		nombre(size:4..40)
		appPaterno(size:4..30)
		appMaterno(size:4..30)
		email(email:true)
		direccion(size:4..100)
		cp(size:4..10)
		telefono(size:4..15)
		comentarios(size:1..100)
	}
	
	def beforeInsert = {
		estatus = true
		fechaCreacion = new Date()
	}
	
	def beforeUpdate = {
		estatus = false
	}
	
}
