package bestprice

import org.springframework.dao.DataIntegrityViolationException

class NegociacionEncController {

	def springSecurityService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def beforeInterceptor = [
		action:this.&auth,
		except:['index', 'list', 'show']
	]
	
	private auth(){
		if(!springSecurityService.currentUser){
			redirect(controller:'vendedor',action:'create')
			return false;
		}else if(!Vendedor.findByUsuario(springSecurityService.currentUser.username)){
			redirect(controller:'vendedor',action:'create')
			return false;
		}
	}
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		if(springSecurityService.currentUser){
			def vendedor = Vendedor.findByUsuario(springSecurityService.currentUser.username)
			def comprador = Comprador.findByUsuario(springSecurityService.currentUser.username)
			//def necesidadEnc = NecesidadEnc.get(params.necesidadEnc)
			def necId = params.necesidadEnc
			if(vendedor){
				[negociacionEncInstanceList: NegociacionEnc.findAllByVendedor(vendedor), negociacionEncInstanceTotal: NegociacionEnc.count()]
			}else{ 
				[negociacionEncInstanceList: NegociacionEnc.where {(NegociacionEnc.necesidadEnc == 5 )}.list(), negociacionEncInstanceTotal: NegociacionEnc.count()]
			
				//def query = NegociacionEnc.where {(NegociacionEnc.necesidadEnc == 6 && NegociacionEnc.necesidadEnc.comprador == comprador)}
				//def negociacionEncInstanceList = query.list()
				//def negociacionEncInstanceTotal = 0
				//negociacionEncInstanceList: results, negociacionEncInstanceTotal: NegociacionEnc.count()
				/*
				if(comprador == necesidadEnc.comprador){
					[negociacionEncInstanceList: NegociacionEnc.findAllByNecesidadEnc(params.necesidadEnc), negociacionEncInstanceTotal: NegociacionEnc.count()]
				}else{
					[negociacionEncInstanceList: NegociacionEnc.findAllByNecesidadEnc.findAllByComprador(comprador), negociacionEncInstanceTotal: NegociacionEnc.count()]
				}*/
			}
		}
    }

    def create() {
        [negociacionEncInstance: new NegociacionEnc(), necesidadEnc : params.necesidadEnc]
    }

    def save() {
        def negociacionEncInstance = new NegociacionEnc(params)
		negociacionEncInstance.vendedor = Vendedor.findByUsuario(springSecurityService.currentUser.username)
		
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
