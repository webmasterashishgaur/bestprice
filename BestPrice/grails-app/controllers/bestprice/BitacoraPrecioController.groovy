package bestprice

import org.springframework.dao.DataIntegrityViolationException

class BitacoraPrecioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bitacoraPrecioInstanceList: BitacoraPrecio.list(params), bitacoraPrecioInstanceTotal: BitacoraPrecio.count()]
    }

    def create() {
        [bitacoraPrecioInstance: new BitacoraPrecio(params)]
    }

    def save() {
        def bitacoraPrecioInstance = new BitacoraPrecio(params)
        if (!bitacoraPrecioInstance.save(flush: true)) {
            render(view: "create", model: [bitacoraPrecioInstance: bitacoraPrecioInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio'), bitacoraPrecioInstance.id])
        redirect(action: "show", id: bitacoraPrecioInstance.id)
    }

    def show() {
        def bitacoraPrecioInstance = BitacoraPrecio.get(params.id)
        if (!bitacoraPrecioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio'), params.id])
            redirect(action: "list")
            return
        }

        [bitacoraPrecioInstance: bitacoraPrecioInstance]
    }

    def edit() {
        def bitacoraPrecioInstance = BitacoraPrecio.get(params.id)
        if (!bitacoraPrecioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio'), params.id])
            redirect(action: "list")
            return
        }

        [bitacoraPrecioInstance: bitacoraPrecioInstance]
    }

    def update() {
        def bitacoraPrecioInstance = BitacoraPrecio.get(params.id)
        if (!bitacoraPrecioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (bitacoraPrecioInstance.version > version) {
                bitacoraPrecioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio')] as Object[],
                          "Another user has updated this BitacoraPrecio while you were editing")
                render(view: "edit", model: [bitacoraPrecioInstance: bitacoraPrecioInstance])
                return
            }
        }

        bitacoraPrecioInstance.properties = params

        if (!bitacoraPrecioInstance.save(flush: true)) {
            render(view: "edit", model: [bitacoraPrecioInstance: bitacoraPrecioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio'), bitacoraPrecioInstance.id])
        redirect(action: "show", id: bitacoraPrecioInstance.id)
    }

    def delete() {
        def bitacoraPrecioInstance = BitacoraPrecio.get(params.id)
        if (!bitacoraPrecioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio'), params.id])
            redirect(action: "list")
            return
        }

        try {
            bitacoraPrecioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bitacoraPrecio.label', default: 'BitacoraPrecio'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
