import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole

class BootStrap {

    def init = { servletContext ->
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
  
		def testUser = new User(username: 'pruebas2', enabled: true, password: 'pruebas2')
		testUser.save(flush: true)
  
		UserRole.create testUser, userRole, true
  
		//assert User.count() == 1
		//assert Role.count() == 2
		//assert UserRole.count() == 1
    }
    def destroy = {
    }
}
