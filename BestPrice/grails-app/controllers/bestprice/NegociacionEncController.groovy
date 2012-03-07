package bestprice

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.stereotype.Controller;

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
			params.max = Math.min(params.max ? params.int('max') : 10, 100)
			[negociacionEncInstanceList: NegociacionEnc.findAllByNecesidadEnc(params.necesidadEnc), negociacionEncInstanceTotal: NegociacionEnc.count(), necesidadEncInstance: params.necesidadEnc.id]
		}
    }

    def create() {
        [negociacionEncInstance: new NegociacionEnc(), necesidadEnc : params.necesidadEnc]
    }

    def save() {
        def negociacionEncInstance = new NegociacionEnc(params)
		def user = springSecurityService.currentUser
		negociacionEncInstance.vendedor = Vendedor.findByUsuario(user.username)
		def ruta =  "/images/compras/"+user.username
		
		def uploadedFile2 = request.getFile('imagen1')
		if(!uploadedFile2.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  uploadedFile2.transferTo( new File( userDir, uploadedFile2.originalFilename))
		  negociacionEncInstance.imagen2 = uploadedFile2.originalFilename;
		}
		
		def uploadedFile3 = request.getFile('imagen2')
		if(!uploadedFile3.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  uploadedFile3.transferTo( new File( userDir, uploadedFile3.originalFilename))
		  negociacionEncInstance.imagen3 = uploadedFile3.originalFilename;
		}
		
		def uploadedFile4 = request.getFile('imagen3')
		if(!uploadedFile4.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  uploadedFile4.transferTo( new File( userDir, uploadedFile4.originalFilename))
		  negociacionEncInstance.imagen4 = uploadedFile4.originalFilename;
		}
		
		def uploadedFile5 = request.getFile('imagen4')
		if(!uploadedFile5.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  uploadedFile5.transferTo( new File( userDir, uploadedFile5.originalFilename))
		  negociacionEncInstance.imagen5 = uploadedFile5.originalFilename;
		}
		
        if (!negociacionEncInstance.save(flush: true)) {
            render(view: "create", model: [negociacionEncInstance: negociacionEncInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'negociacionEnc.label', default: 'NegociacionEnc'), negociacionEncInstance.id])
        redirect(controller:'necesidadEnc', action: "show", id: negociacionEncInstance.necesidadEnc.id)
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
