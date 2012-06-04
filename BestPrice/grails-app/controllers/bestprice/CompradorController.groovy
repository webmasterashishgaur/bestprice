package bestprice

import org.springframework.dao.DataIntegrityViolationException
import com.testapp.User
import com.testapp.UserRole;
import com.testapp.Role


class CompradorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	static navigation = [
		[group:'tabs',
		order:2,
		title:'Soy Comprador',
		action:'create'],
		[group:'admon',
		order:5,
		title:'Compradores',
		action:'list'],
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
        }else{
			def testUser = new User(username: compradorInstance.usuario, enabled: false, password: compradorInstance.password)
			testUser.save(flush: true)
			
			def userRole = Role.get(2)
			UserRole.create testUser, userRole, true
        }

		checkEmail(compradorInstance)
		redirect(action: 'registersuccess')
    }
	
	def registersuccess = {
		render(view: 'registrado')
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
	
	def emailConfirmationService
	def checkEmail(Comprador comprador){
		// Only do this if not confirmed already!
		emailConfirmationService.sendConfirmation(comprador.email, "Favor de Confirmar el usuario de BestPrice", [from:"bestprice@gmail.com", compradorId:comprador.id], comprador.usuario.toString())
	}
}
