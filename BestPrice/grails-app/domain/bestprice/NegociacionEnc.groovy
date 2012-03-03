package bestprice

class NegociacionEnc extends Comun{

	static hasMany = [negociacionDets:NegociacionDet]
	static belongsTo = [necesidadEnc: NecesidadEnc]
	Vendedor vendedor
	Double precio
	String imagen1
	String imagen2
	String imagen3
	String imagen4
	String comentarios

    static constraints = {
		comentarios(blank:false, size:4..1000)
    }
}
