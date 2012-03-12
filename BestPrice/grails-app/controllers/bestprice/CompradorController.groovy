package bestprice

import org.springframework.dao.DataIntegrityViolationException

class CompradorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	static navigation = [
		[group:'tabs',
		order:2,
		title:'Soy Comprador',
		action:'create'],
		[group:'admon',
		order:10,
		title:'Soy Comprador',
		action:'create'],
	]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [compradorInstanceList: Comprador.list(params), compradorInstanceTotal: Comprador.count()]
    }

    def create() {
        [compradorInstance: new Comprador(params)]
    }

    def save() {
        def compradorInstance = new Comprador(params)
        if (!compradorInstance.save(flush: true)) {
			compradorInstance.password = ""
			compradorInstance.password2 = ""
            render(view: "create", model: [compradorInstance: compradorInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'comprador.label', default: 'Comprador'), compradorInstance.id])
        redirect(action: "show", id: compradorInstance.id)
    }

    def show() {
        def compradorInstance = Comprador.get(params.id)
        if (!compradorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'comprador.label', default: 'Comprador'), params.id])
            redirect(action: "list")
            return
        }

        [compradorInstance: compradorInstance]
    }

    def edit() {
        def compradorInstance = Comprador.get(params.id)
        if (!compradorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comprador.label', default: 'Comprador'), params.id])
            redirect(action: "list")
            return
        }

        [compradorInstance: compradorInstance]
    }

    def update() {
        def compradorInstance = Comprador.get(params.id)
        if (!compradorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comprador.label', default: 'Comprador'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (compradorInstance.version > version) {
                compradorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'comprador.label', default: 'Comprador')] as Object[],
                          "Another user has updated this Comprador while you were editing")
                render(view: "edit", model: [compradorInstance: compradorInstance])
                return
            }
        }

        compradorInstance.properties = params

        if (!compradorInstance.save(flush: true)) {
            render(view: "edit", model: [compradorInstance: compradorInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'comprador.label', default: 'Comprador'), compradorInstance.id])
        redirect(action: "show", id: compradorInstance.id)
    }

    def delete() {
        def compradorInstance = Comprador.get(params.id)
        if (!compradorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'comprador.label', default: 'Comprador'), params.id])
            redirect(action: "list")
            return
        }

        try {
            compradorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'comprador.label', default: 'Comprador'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'comprador.label', default: 'Comprador'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
