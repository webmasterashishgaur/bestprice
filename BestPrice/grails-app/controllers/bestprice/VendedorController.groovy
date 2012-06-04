package bestprice

import org.springframework.dao.DataIntegrityViolationException

import com.testapp.Role;
import com.testapp.User
import com.testapp.UserRole;

class VendedorController {
	
	static navigation = [
		[group:'tabs',
		order:3,
		title:'Soy Vendedor',
		action:'create'],
	
		[group:'admon',
		order:4,
		title:'Vendedores',
		action:'list'],
	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [vendedorInstanceList: Vendedor.list(params), vendedorInstanceTotal: Vendedor.count()]
    }

    def create() {
        [vendedorInstance: new Vendedor(params)]
    }

    def save() {
        def vendedorInstance = new Vendedor(params)
        if (!vendedorInstance.save(flush: true)) {
            render(view: "create", model: [vendedorInstance: vendedorInstance])
            return
        }else{
			def testUser = new User(username: vendedorInstance.usuario, enabled: false, password: vendedorInstance.password)
			testUser.save(flush: true)
			
			def userRole = Role.get(2)
			UserRole.create testUser, userRole, true
			
        }
		checkEmail(vendedorInstance)


		//flash.message = message(code: 'default.created.message', args: [message(code: 'vendedor.label', default: 'Vendedor'), vendedorInstance.id])
        //redirect(action: "show", id: vendedorInstance.id)
		redirect(action: 'registersuccess')
    }
	
	def registersuccess = {
		render(view: 'registrado')
	}

    def show() {
        def vendedorInstance = Vendedor.get(params.id)
        if (!vendedorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendedor.label', default: 'Vendedor'), params.id])
            redirect(action: "list")
            return
        }

        [vendedorInstance: vendedorInstance]
    }

    def edit() {
        def vendedorInstance = Vendedor.get(params.id)
        if (!vendedorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendedor.label', default: 'Vendedor'), params.id])
            redirect(action: "list")
            return
        }

        [vendedorInstance: vendedorInstance]
    }

    def update() {
        def vendedorInstance = Vendedor.get(params.id)
        if (!vendedorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendedor.label', default: 'Vendedor'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (vendedorInstance.version > version) {
                vendedorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'vendedor.label', default: 'Vendedor')] as Object[],
                          "Another user has updated this Vendedor while you were editing")
                render(view: "edit", model: [vendedorInstance: vendedorInstance])
                return
            }
        }

        vendedorInstance.properties = params

        if (!vendedorInstance.save(flush: true)) {
            render(view: "edit", model: [vendedorInstance: vendedorInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'vendedor.label', default: 'Vendedor'), vendedorInstance.id])
        redirect(action: "show", id: vendedorInstance.id)
    }

    def delete() {
        def vendedorInstance = Vendedor.get(params.id)
        if (!vendedorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendedor.label', default: 'Vendedor'), params.id])
            redirect(action: "list")
            return
        }

        try {
			//def userRole = UserRole.get()
            vendedorInstance.delete(flush: true)
			
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'vendedor.label', default: 'Vendedor'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'vendedor.label', default: 'Vendedor'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def emailConfirmationService
	def checkEmail(Vendedor vendedor){
		// Only do this if not confirmed already!
		emailConfirmationService.sendConfirmation(vendedor.email, "Favor de Confirmar el usuario de BestPrice", [from:"bestprice@gmail.com", compradorId:vendedor.id], vendedor.usuario.toString())
	}
}
