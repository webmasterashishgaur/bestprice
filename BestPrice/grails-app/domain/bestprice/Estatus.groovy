package bestprice

import java.util.Date;

class Estatus {

	String descripcion	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		descripcion(size:4..15, unique:true)
    }
}
