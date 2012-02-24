package bestprice

import org.springframework.dao.DataIntegrityViolationException

class NecesidadEncController {

	def springSecurityService
	
	static navigation = [
		group:'tabs',
		order:1,
		title:'Publicar Compra',
		action:'create'
	]
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def beforeInterceptor = [
		action:this.&auth,
		except:['index','list', 'show']
	]
	
	private auth(){
		if(!springSecurityService.currentUser){
			redirect(controller:'comprador',action:'create')
			return false;
		}
	}

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [necesidadEncInstanceList: NecesidadEnc.list(params), necesidadEncInstanceTotal: NecesidadEnc.count()]
    }

    def create() {
        [necesidadEncInstance: new NecesidadEnc(params)]
    }

    def save() {
        def necesidadEncInstance = new NecesidadEnc(params)
		
		def user = springSecurityService.currentUser
		def p = Comprador.findByUsuario(user.username)
		necesidadEncInstance.comprador = p 
		def ruta =  "/images/compras/"+user.username
		
		def uploadedFile1 = request.getFile('imagen1')
		if(!uploadedFile1.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  uploadedFile1.transferTo( new File( userDir, uploadedFile1.originalFilename))
		  necesidadEncInstance.imagen1 = uploadedFile1.originalFilename;
		}
		
		def uploadedFile2 = request.getFile('imagen2')
		if(!uploadedFile2.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  uploadedFile2.transferTo( new File( userDir, uploadedFile2.originalFilename))
		  necesidadEncInstance.imagen2 = uploadedFile2.originalFilename;
		}
		
		def uploadedFile3 = request.getFile('imagen3')
		if(!uploadedFile3.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  uploadedFile3.transferTo( new File( userDir, uploadedFile3.originalFilename))
		  necesidadEncInstance.imagen3 = uploadedFile3.originalFilename;
		}
		
		def uploadedFile4 = request.getFile('imagen4')
		if(!uploadedFile4.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  uploadedFile4.transferTo( new File( userDir, uploadedFile4.originalFilename))
		  necesidadEncInstance.imagen4 = uploadedFile4.originalFilename;
		}
		
		def uploadedFile5 = request.getFile('imagen5')
		if(!uploadedFile5.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  uploadedFile5.transferTo( new File( userDir, uploadedFile5.originalFilename))
		  necesidadEncInstance.imagen5 = uploadedFile5.originalFilename;
		}
		
        if (!necesidadEncInstance.save(flush: true)) {
            render(view: "create", model: [necesidadEncInstance: necesidadEncInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc'), necesidadEncInstance.id])
        redirect(action: "show", id: necesidadEncInstance.id)
    }

    def show() {
        def necesidadEncInstance = NecesidadEnc.get(params.id)
        if (!necesidadEncInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc'), params.id])
            redirect(action: "list")
            return
        }

        [necesidadEncInstance: necesidadEncInstance]
    }

    def edit() {
        def necesidadEncInstance = NecesidadEnc.get(params.id)
        if (!necesidadEncInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc'), params.id])
            redirect(action: "list")
            return
        }

        [necesidadEncInstance: necesidadEncInstance]
    }

    def update() {
        def necesidadEncInstance = NecesidadEnc.get(params.id)
        if (!necesidadEncInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (necesidadEncInstance.version > version) {
                necesidadEncInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'necesidadEnc.label', default: 'NecesidadEnc')] as Object[],
                          "Another user has updated this NecesidadEnc while you were editing")
                render(view: "edit", model: [necesidadEncInstance: necesidadEncInstance])
                return
            }
        }

        necesidadEncInstance.properties = params

        if (!necesidadEncInstance.save(flush: true)) {
            render(view: "edit", model: [necesidadEncInstance: necesidadEncInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc'), necesidadEncInstance.id])
        redirect(action: "show", id: necesidadEncInstance.id)
    }

    def delete() {
        def necesidadEncInstance = NecesidadEnc.get(params.id)
        if (!necesidadEncInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc'), params.id])
            redirect(action: "list")
            return
        }

        try {
            necesidadEncInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
