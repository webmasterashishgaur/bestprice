package bestprice

import org.springframework.dao.DataIntegrityViolationException

class EstatusController {
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	static navigation = [
		[group:'admon',
		order:10,
		title:'Estatus',
		action:'create'],
	]
	

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [estatusInstanceList: Estatus.list(params), estatusInstanceTotal: Estatus.count()]
    }

    def create() {
        [estatusInstance: new Estatus(params)]
    }

    def save() {
        def estatusInstance = new Estatus(params)
        if (!estatusInstance.save(flush: true)) {
            render(view: "create", model: [estatusInstance: estatusInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'estatus.label', default: 'Estatus'), estatusInstance.id])
        redirect(action: "show", id: estatusInstance.id)
    }

    def show() {
        def estatusInstance = Estatus.get(params.id)
        if (!estatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'estatus.label', default: 'Estatus'), params.id])
            redirect(action: "list")
            return
        }

        [estatusInstance: estatusInstance]
    }

    def edit() {
        def estatusInstance = Estatus.get(params.id)
        if (!estatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estatus.label', default: 'Estatus'), params.id])
            redirect(action: "list")
            return
        }

        [estatusInstance: estatusInstance]
    }

    def update() {
        def estatusInstance = Estatus.get(params.id)
        if (!estatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estatus.label', default: 'Estatus'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (estatusInstance.version > version) {
                estatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'estatus.label', default: 'Estatus')] as Object[],
                          "Another user has updated this Estatus while you were editing")
                render(view: "edit", model: [estatusInstance: estatusInstance])
                return
            }
        }

        estatusInstance.properties = params

        if (!estatusInstance.save(flush: true)) {
            render(view: "edit", model: [estatusInstance: estatusInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'estatus.label', default: 'Estatus'), estatusInstance.id])
        redirect(action: "show", id: estatusInstance.id)
    }

    def delete() {
        def estatusInstance = Estatus.get(params.id)
        if (!estatusInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'estatus.label', default: 'Estatus'), params.id])
            redirect(action: "list")
            return
        }

        try {
            estatusInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'estatus.label', default: 'Estatus'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estatus.label', default: 'Estatus'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
