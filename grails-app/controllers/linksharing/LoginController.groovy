package linksharing

import com.intelligrape.linksharing.Visibility
import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile

class LoginController {
    def photoUploaderService

    def index() {
        if (session.user) {
            forward(controller: "user", action: "index")
        } else {
            List topPosts = Resource.topPosts()
            List recentPosts = recentPosts()
            render(view: "/login/index", model: [topPosts: topPosts, recentPosts: recentPosts])
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

    def logout() {
        session.invalidate()
        redirect(controller: "login")
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

    def register() {
        println params
        if(!params.regPhoto.empty) {
            String imagePath = photoUploaderService.uploadPicture(params.regPhoto)
            params.imagePath = imagePath
        }
        params.active = true;
        User registerUser = new User(params)
        if (registerUser.validate()) {
            registerUser.save()
            session.user = registerUser
            redirect(action:"index")
        } else {
            println registerUser.errors.allErrors
            flash.error = "Could not register"
        }
    }

    def loadLoginPanel() {
        render(template: "login")
   }
}
