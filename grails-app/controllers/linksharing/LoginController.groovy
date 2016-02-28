package linksharing

class LoginController {

    def index() {
        if(session.user)
        {
            forward(controller:"user",action:"index")
        }
        else {
            render("User not logged in")
            List resources = topPosts()
            render("</br>")
            resources.each {
                render(it)
                render("<br/>")
            }
        }
        }
    def loginHandler(String username,int password)
    {
        User user = User.findByUsernameAndPassword(username,password)
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
        render(flash.error)
    }
    def logout()
    {
        session.invalidate()
        render("User logged out")
    }
    def topPosts()
    {
        List<ResourceRating>resources=ResourceRating.createCriteria().list(max:5){
            projections{
                groupProperty('resource')
                avg('score','avgScore')
            }
            'resource'{
                property('id')
            }
            order('avgScore','desc')
        }
        return resources
    }
}
