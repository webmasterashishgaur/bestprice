import com.testapp.Role
import com.testapp.User
import com.testapp.UserRole

class BootStrap {

	def emailConfirmationService
	
    def init = { servletContext ->
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
		def testUser = new User(username: 'admon', enabled: true, password: 'admon')
		testUser.save(flush: true)
		UserRole.create testUser, adminRole, true
		
		emailConfirmationService.onConfirmation = { email, uid -> log.info("User with id $uid has confirmed their email address $email")
		    // now do something…
		    // Then return a map which will redirect the user to this destination
		    //return [controller:'comprador', action:'edit', params:'[id:'+uid+']']
			User user = User.findByUsername(uid)
			user.enabled = true
			if (!user.save()) {
			}
		}
		emailConfirmationService.onInvalid = { uid -> 
			log.warn("User with id $uid failed to confirm email address after 30 days")
		}
		emailConfirmationService.onTimeout = { email, uid -> 
			log.warn("User with id $uid failed to confirm email address after 30 days")
		}
	}
	
    def destroy = {
    }
}
