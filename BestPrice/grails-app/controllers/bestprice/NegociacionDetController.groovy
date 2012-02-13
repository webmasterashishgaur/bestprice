package bestprice

import org.springframework.dao.DataIntegrityViolationException

class NegociacionDetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [negociacionDetInstanceList: NegociacionDet.list(params), negociacionDetInstanceTotal: NegociacionDet.count()]
    }

    def create() {
        [negociacionDetInstance: new NegociacionDet(params)]
    }

    def save() {
        def negociacionDetInstance = new NegociacionDet(params)
        if (!negociacionDetInstance.save(flush: true)) {
            render(view: "create", model: [negociacionDetInstance: negociacionDetInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'negociacionDet.label', default: 'NegociacionDet'), negociacionDetInstance.id])
        redirect(action: "show", id: negociacionDetInstance.id)
    }

    def show() {
        def negociacionDetInstance = NegociacionDet.get(params.id)
        if (!negociacionDetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'negociacionDet.label', default: 'NegociacionDet'), params.id])
            redirect(action: "list")
            return
        }

        [negociacionDetInstance: negociacionDetInstance]
    }

    def edit() {
        def negociacionDetInstance = NegociacionDet.get(params.id)
        if (!negociacionDetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'negociacionDet.label', default: 'NegociacionDet'), params.id])
            redirect(action: "list")
            return
        }

        [negociacionDetInstance: negociacionDetInstance]
    }

    def update() {
        def negociacionDetInstance = NegociacionDet.get(params.id)
        if (!negociacionDetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'negociacionDet.label', default: 'NegociacionDet'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (negociacionDetInstance.version > version) {
                negociacionDetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'negociacionDet.label', default: 'NegociacionDet')] as Object[],
                          "Another user has updated this NegociacionDet while you were editing")
                render(view: "edit", model: [negociacionDetInstance: negociacionDetInstance])
                return
            }
        }

        negociacionDetInstance.properties = params

        if (!negociacionDetInstance.save(flush: true)) {
            render(view: "edit", model: [negociacionDetInstance: negociacionDetInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'negociacionDet.label', default: 'NegociacionDet'), negociacionDetInstance.id])
        redirect(action: "show", id: negociacionDetInstance.id)
    }

    def delete() {
        def negociacionDetInstance = NegociacionDet.get(params.id)
        if (!negociacionDetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'negociacionDet.label', default: 'NegociacionDet'), params.id])
            redirect(action: "list")
            return
        }

        try {
            negociacionDetInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'negociacionDet.label', default: 'NegociacionDet'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'negociacionDet.label', default: 'NegociacionDet'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
