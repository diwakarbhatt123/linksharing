package linksharing

import org.springframework.web.multipart.MultipartFile

class LoginController {

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

        User user = User.findByUsernameAndPassword(username,password)
        println "<<<<<<<<<<<<<<<<<<<<${params}<<<<<<<<<<<<<<<<<<<<<<<"
        if(user) {
            if (user.active) {
                session.user = user
                redirect(action:"index")
            }
            else {
                flash.error = "Your Account is not active"
            }
        }
        else {
            flash.error = "Cannot Find User"
        }
        render view:"/login/login"
    }
    def logout()
    {
        session.invalidate()
        redirect(controller:"login")
    }

    private recentPosts()
    {
        List recentPosts = Resource.list(sort:"dateCreated",order:"asc",max:2);
        return recentPosts
    }
    def register() {
        MultipartFile inputImage = params.photo
        String extention = inputImage.originalFilename.tokenize(".")?.last()
        String filePath = "${grailsApplication.config.userImageFolder}/${UUID.randomUUID().toString()}${extention?".${extention}":""}"
        File userImage = new File(filePath)
        inputImage.transferTo(userImage)
        params.imagePath = userImage.absolutePath
        User registerUser = new User(params)
        if (registerUser.validate()) {
            registerUser.save()
            render("Success")
        } else {
            render("Could not register user field ${registerUser.errors.fieldError} cannot have value ${registerUser.errors.fieldError.rejectedValue}")
        }
    }
}
