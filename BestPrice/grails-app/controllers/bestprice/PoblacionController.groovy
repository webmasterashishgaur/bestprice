package bestprice

import org.springframework.dao.DataIntegrityViolationException

class PoblacionController {

	static navigation =[
		[group:'admon', order:3, title:'Poblaciones', action:'list']
	]
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [poblacionInstanceList: Poblacion.list(params), poblacionInstanceTotal: Poblacion.count()]
    }

    def create() {
        [poblacionInstance: new Poblacion(params)]
    }

    def save() {
        def poblacionInstance = new Poblacion(params)
        if (!poblacionInstance.save(flush: true)) {
            render(view: "create", model: [poblacionInstance: poblacionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'poblacion.label', default: 'Poblacion'), poblacionInstance.id])
        redirect(action: "show", id: poblacionInstance.id)
    }

    def show() {
        def poblacionInstance = Poblacion.get(params.id)
        if (!poblacionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'poblacion.label', default: 'Poblacion'), params.id])
            redirect(action: "list")
            return
        }

        [poblacionInstance: poblacionInstance]
    }

    def edit() {
        def poblacionInstance = Poblacion.get(params.id)
        if (!poblacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'poblacion.label', default: 'Poblacion'), params.id])
            redirect(action: "list")
            return
        }

        [poblacionInstance: poblacionInstance]
    }

    def update() {
        def poblacionInstance = Poblacion.get(params.id)
        if (!poblacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'poblacion.label', default: 'Poblacion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (poblacionInstance.version > version) {
                poblacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'poblacion.label', default: 'Poblacion')] as Object[],
                          "Another user has updated this Poblacion while you were editing")
                render(view: "edit", model: [poblacionInstance: poblacionInstance])
                return
            }
        }

        poblacionInstance.properties = params

        if (!poblacionInstance.save(flush: true)) {
            render(view: "edit", model: [poblacionInstance: poblacionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'poblacion.label', default: 'Poblacion'), poblacionInstance.id])
        redirect(action: "show", id: poblacionInstance.id)
    }

    def delete() {
        def poblacionInstance = Poblacion.get(params.id)
        if (!poblacionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'poblacion.label', default: 'Poblacion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            poblacionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'poblacion.label', default: 'Poblacion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'poblacion.label', default: 'Poblacion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
