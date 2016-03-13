package linksharing

import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile

class LoginController {
def photoUploaderService
    def index() {
        if(session.user)
        {
            forward(controller:"user",action:"index")
        }
        else {
            List topPosts = Resource.topPosts()
            List recentPosts = recentPosts()
            render(view:"login",model:[topPosts:topPosts, recentPosts:recentPosts])
        }
        }
    def loginHandler(String username,int password)
    {
        println "called"
       def message;
        User user = User.findByUsernameAndPassword(username,password)
        if(user) {
            if (user.active) {
                session.user = user
                message = ["message":"Success"]
            }
            else {
                message = ["message":"Your account is not active"]
            }
        }
        else {
            message = ["message":"Invalid Username or Password"]
        }
        //render view:"/login/login"
        render message as JSON
    }
    def logout()
    {
        session.invalidate()
        redirect(controller:"login")
    }

    private recentPosts()
    {
        List <Resource> recentPosts = Resource.createCriteria().list(sort:"dateCreated",order:"asc",max:2){
            'topic'
                    {
                        eq("visibility",Visibility.PUBLIC)
                    }
        }
        return recentPosts
    }
    def register() {
        String imagePath  = photoUploaderService.uploadPicture(params.photo)
        params.imagePath = imagePath
        User registerUser = new User(params)
        if (registerUser.validate()) {
            registerUser.save()
            render("Success")
        } else {
            render("Could not register user field ${registerUser.errors.fieldError} cannot have value ${registerUser.errors.fieldError.rejectedValue}")
        }
    }
    def loadLoginPanel()
    {
        render(template:"login")
    }
}
