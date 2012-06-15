package bestprice

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser;
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils;
import org.springframework.dao.DataIntegrityViolationException


class NecesidadEncController {

	def springSecurityService
	def necesidadEncService
	
	static navigation = [
							//[group:'tabs',order:1,title:'Publicar Compra',action:'create'],
							[group:'admon',order:4,title:'Publicar Compra',action:'list'],
						]
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def beforeInterceptor = [
		action:this.&auth,
		except:['index','list', 'search', 'searchCategorias', 'show']
	]
	
	private auth(){
		if(!springSecurityService.currentUser){
			redirect(controller:'comprador',action:'create')
			return false;
		}else{
			if(!SpringSecurityUtils.ifAllGranted("ROLE_ADMIN") & !Comprador.findByUsuario(springSecurityService.currentUser.username)){
				redirect(controller:'comprador',action:'create')
				return false;
			}
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
		  
		  def nomb0 = uploadedFile1.originalFilename.trim()
		  nomb0 = nomb0.replaceAll(" ", "")
		  uploadedFile1.transferTo( new File( userDir, nomb0))
		  necesidadEncInstance.imagen1 = nomb0;
		}
		
		def uploadedFile2 = request.getFile('imagen2')
		if(!uploadedFile2.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  
		  def nomb1 = uploadedFile2.originalFilename.trim()
		  nomb1 = nomb1.replaceAll(" ", "")
		  uploadedFile2.transferTo( new File( userDir, nomb1))
		  necesidadEncInstance.imagen2 = nomb1;
		}
		
		def uploadedFile3 = request.getFile('imagen3')
		if(!uploadedFile3.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  
		  def nomb2 = uploadedFile3.originalFilename.trim()
		  nomb2 = nomb2.replaceAll(" ", "")
		  uploadedFile3.transferTo( new File( userDir, nomb2))
		  necesidadEncInstance.imagen3 = nomb2;
		}
		
		def uploadedFile4 = request.getFile('imagen4')
		if(!uploadedFile4.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  
		  def nomb3 = uploadedFile4.originalFilename.trim()
		  nomb3 = nomb3.replaceAll(" ", "")
		  uploadedFile4.transferTo( new File( userDir, nomb3))
		  necesidadEncInstance.imagen4 = nomb3;
		}
		
		def uploadedFile5 = request.getFile('imagen5')
		if(!uploadedFile5.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  
		  def nomb4 = uploadedFile5.originalFilename.trim()
		  nomb4 = nomb3.replaceAll(" ", "")
		  uploadedFile5.transferTo( new File( userDir, nomb4))
		  necesidadEncInstance.imagen5 = nomb4;
		}
		
		def uploadedFile6 = request.getFile('imagen6')
		if(!uploadedFile6.empty){
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, ruta)
		  userDir.mkdirs()
		  
		  def nomb5 = uploadedFile6.originalFilename.trim()
		  nomb5 = nomb5.replaceAll(" ", "")
		  uploadedFile6.transferTo( new File( userDir, nomb5))
		  necesidadEncInstance.imagen6 = nomb5;
		}
		
        if (!necesidadEncInstance.save(flush: true)) {
            render(view: "create", model: [necesidadEncInstance: necesidadEncInstance])
            return
        }
		
		necesidadEncService.enviaCorreoPosiblesCompradores(necesidadEncInstance.titulo)
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc'), necesidadEncInstance.id])
		redirect(action: "list")
    }

    def show() {
        def necesidadEncInstance = NecesidadEnc.get(params.id)
        if (!necesidadEncInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'necesidadEnc.label', default: 'NecesidadEnc'), params.id])
            redirect(action: "list")
            return
        }
		
		def puedeEditar = false 
		if(springSecurityService.currentUser){
			if(SpringSecurityUtils.ifAllGranted("ROLE_ADMIN") || (necesidadEncInstance.comprador.usuario ==  springSecurityService.currentUser.username)){
				puedeEditar = true
			}
		}

        [necesidadEncInstance: necesidadEncInstance, puedeEditar:puedeEditar]
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
	
	def searchableService //inject the service (make sure the name is correct)
    def search = {
	   def query = params.query
	   if(query.compareTo("") != 0){
		   def srchResults = NecesidadEnc.search(query)
		   //System.out.println(srchResults.results)
		   render(view: "list", model: [necesidadEncInstanceList: srchResults.results, necesidadEncInstanceTotal:srchResults.total])
	   }else{
		   redirect(action: "list")
	   }
    }
	
	def searchCategorias = {
		def query = params.query
		if(query){
			render(view: "list", model: [necesidadEncInstanceList: NecesidadEnc.findAllByCategoria(Categoria.get(query)), necesidadEncInstanceTotal: NecesidadEnc.count()])
		}
	 }
	
}
