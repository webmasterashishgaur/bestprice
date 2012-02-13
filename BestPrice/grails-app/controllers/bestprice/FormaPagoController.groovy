package bestprice

import org.springframework.dao.DataIntegrityViolationException

class FormaPagoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	static navigation =[
		[group:'admon', order:4, title:'Crear FormaPago', action:'create']
	]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [formaPagoInstanceList: FormaPago.list(params), formaPagoInstanceTotal: FormaPago.count()]
    }

    def create() {
        [formaPagoInstance: new FormaPago(params)]
    }

    def save() {
        def formaPagoInstance = new FormaPago(params)
        if (!formaPagoInstance.save(flush: true)) {
            render(view: "create", model: [formaPagoInstance: formaPagoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), formaPagoInstance.id])
        redirect(action: "show", id: formaPagoInstance.id)
    }

    def show() {
        def formaPagoInstance = FormaPago.get(params.id)
        if (!formaPagoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), params.id])
            redirect(action: "list")
            return
        }

        [formaPagoInstance: formaPagoInstance]
    }

    def edit() {
        def formaPagoInstance = FormaPago.get(params.id)
        if (!formaPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), params.id])
            redirect(action: "list")
            return
        }

        [formaPagoInstance: formaPagoInstance]
    }

    def update() {
        def formaPagoInstance = FormaPago.get(params.id)
        if (!formaPagoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (formaPagoInstance.version > version) {
                formaPagoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'formaPago.label', default: 'FormaPago')] as Object[],
                          "Another user has updated this FormaPago while you were editing")
                render(view: "edit", model: [formaPagoInstance: formaPagoInstance])
                return
            }
        }

        formaPagoInstance.properties = params

        if (!formaPagoInstance.save(flush: true)) {
            render(view: "edit", model: [formaPagoInstance: formaPagoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), formaPagoInstance.id])
        redirect(action: "show", id: formaPagoInstance.id)
    }

    def delete() {
        def formaPagoInstance = FormaPago.get(params.id)
        if (!formaPagoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), params.id])
            redirect(action: "list")
            return
        }

        try {
            formaPagoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'formaPago.label', default: 'FormaPago'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
