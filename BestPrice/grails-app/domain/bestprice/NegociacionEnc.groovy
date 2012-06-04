package bestprice

import java.util.Date;

class NegociacionEnc{

	static hasMany = [negociacionDets:NegociacionDet]
	static belongsTo = [necesidadEnc: NecesidadEnc]
	Vendedor vendedor
	Double precio
	String imagen1
	String imagen2
	String imagen3
	String imagen4
	String comentarios
	Estatus estatus
	Date dateCreated
	Date lastUpdated

    static constraints = {
		comentarios(blank:false, size:4..1000)
    }
	
	static mapping = {
		sort dateCreated: "desc"
	}
}
