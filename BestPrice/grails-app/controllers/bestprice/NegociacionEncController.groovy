package bestprice

import org.springframework.dao.DataIntegrityViolationException

class NegociacionEncController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [negociacionEncInstanceList: NegociacionEnc.findAllByNecesidadEnc(params.necesidadEnc), negociacionEncInstanceTotal: NegociacionEnc.count()]
    }

    def create() {
        [negociacionEncInstance: new NegociacionEnc(), necesidadEnc : params.necesidadEnc]
    }

    def save() {
        def negociacionEncInstance = new NegociacionEnc(params)
        if (!negociacionEncInstance.save(flush: true)) {
            render(view: "create", model: [negociacionEncInstance: negociacionEncInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'negociacionEnc.label', default: 'NegociacionEnc'), negociacionEncInstance.id])
        redirect(action: "show", id: negociacionEncInstance.id)
    }

    def show() {
        def negociacionEncInstance = NegociacionEnc.get(params.id)
        if (!negociacionEncInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'negociacionEnc.label', default: 'NegociacionEnc'), params.id])
            redirect(action: "list")
            return
        }

        [negociacionEncInstance: negociacionEncInstance]
    }

    def edit() {
        def negociacionEncInstance = NegociacionEnc.get(params.id)
        if (!negociacionEncInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'negociacionEnc.label', default: 'NegociacionEnc'), params.id])
            redirect(action: "list")
            return
        }

        [negociacionEncInstance: negociacionEncInstance]
    }

    def update() {
        def negociacionEncInstance = NegociacionEnc.get(params.id)
        if (!negociacionEncInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'negociacionEnc.label', default: 'NegociacionEnc'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (negociacionEncInstance.version > version) {
                negociacionEncInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'negociacionEnc.label', default: 'NegociacionEnc')] as Object[],
                          "Another user has updated this NegociacionEnc while you were editing")
                render(view: "edit", model: [negociacionEncInstance: negociacionEncInstance])
                return
            }
        }

        negociacionEncInstance.properties = params

        if (!negociacionEncInstance.save(flush: true)) {
            render(view: "edit", model: [negociacionEncInstance: negociacionEncInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'negociacionEnc.label', default: 'NegociacionEnc'), negociacionEncInstance.id])
        redirect(action: "show", id: negociacionEncInstance.id)
    }

    def delete() {
        def negociacionEncInstance = NegociacionEnc.get(params.id)
        if (!negociacionEncInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'negociacionEnc.label', default: 'NegociacionEnc'), params.id])
            redirect(action: "list")
            return
        }

        try {
            negociacionEncInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'negociacionEnc.label', default: 'NegociacionEnc'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'negociacionEnc.label', default: 'NegociacionEnc'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
