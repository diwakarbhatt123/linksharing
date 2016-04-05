package linksharing

import com.intelligrape.linksharing.Visibility
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.ProviderManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService

class LoginController extends grails.plugin.springsecurity.LoginController {
    def photoUploaderService

    def index() {
        def user = springSecurityService.currentUser
        session.user = user
        if (session.user) {
            forward(controller: "user", action: "index")
        } else {
            List topPosts = Resource.topPosts()
            List recentPosts = recentPosts()
            render(view: "login", model: [topPosts: topPosts, recentPosts: recentPosts])
        }
    }

    def loginHandler(String username, int password) {
        println "called"
        def message;
        User user = User.findByUsernameAndPassword(username, password)
        if (user) {
            if (user.active) {
                session.user = user
                message = ["message": "Success"]
            } else {
                message = ["message": "Your account is not active"]
            }
        } else {
            message = ["message": "Invalid Username or Password"]
        }
        //render view:"/login/login"
        render message as JSON
    }

    def auth() {

        def config = SpringSecurityUtils.securityConfig
        if (springSecurityService.isLoggedIn()) {
            redirect controller: "login", action: "index"
            return
        }

        List topPosts = Resource.topPosts()
        List recentPosts = recentPosts()
        render(view: "login", model: [topPosts: topPosts, recentPosts: recentPosts])
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def logout() {
        redirect(url: "/j_spring_security_logout");
    }

    private recentPosts() {
        List<Resource> recentPosts = Resource.createCriteria().list(sort: "dateCreated", order: "asc", max: 2) {
            'topic'
                    {
                        eq("visibility", Visibility.PUBLIC)
                    }
        }
        return recentPosts
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def register() {
        if (!params.photo.empty) {
            String imagePath = photoUploaderService.uploadPicture(params.photo)
            params.imagePath = imagePath
        }
        params.active = true;
        User registerUser = new User(params)
        if (registerUser.validate()) {
            registerUser.save()
            springSecurityService.reauthenticate(registerUser.username,registerUser.password)
            redirect(action: "index")
        } else {
            flash.error = "Could not register"
            redirect(url: "/")
        }
    }

    def loadLoginPanel() {
        render(template: "login")
    }
}
