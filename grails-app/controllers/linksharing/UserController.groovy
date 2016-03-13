package linksharing

import com.intelligrape.linksharing.EmailDTO
import com.intelligrape.linksharing.RandomPasswordGenerator
import com.intelligrape.linksharing.TopicVO
import grails.converters.JSON
import jline.internal.Log
import org.springframework.web.multipart.MultipartFile


class UserController {
    def emailService
    def photoUploaderService
    def index() {
        List<TopicVO> trendingTopics = Topic.trendingTopic
        render(view: "user", model: [trendingTopics: trendingTopics])
    }

    def showProfile() {
        render(view:"/user/profile")
    }
    def loadCreatedTopics(){
        render(template:"/user/createdTopics",model:[createdTopics:session.user.getCreatedTopics()])
    }
    def usershow() {
        List<User> userList = User.list()
        render(view: "usershow", model: [users: userList])
    }
def loadUserTable(String q,String sortBy)
{
    List <User> userList = User.list();
    if(q && !q.equals(""))
    {
        println "here"
        userList = User.createCriteria().list(){
            or {
                ilike("username","%${q}%")
                ilike("firstname","%${q}%")
            }
        }
    }
    else if(sortBy)
    {
        if(sortBy.equalsIgnoreCase("activated")){
            userList = User.findAllByActive(true);
        }
        else if(sortBy.equalsIgnoreCase("deactivated")){
            userList = User.findAllByActive(false);
        }
    }
    render(template:"/user/userTable",model:[users:userList])
}
    def renderFromDirectory(long id) {
        User user = User.read(id)
        String filePath = user.imagePath
        File file = new File(filePath)
        byte[] imageBytes = file.bytes
        response.setHeader("Content-length", imageBytes.length.toString())
        response.outputStream << imageBytes
        response.outputStream.flush()
    }

    def forgotPassword(String recoveryemail) {
        User user = User.findByEmail(recoveryemail)
        if (user && user.active) {
            int newPassword = RandomPasswordGenerator.generateRandomPassword()
            EmailDTO emailDTO = new EmailDTO(to: [recoveryemail], subject: "Account Recovery", view: "/email/_password", model: [userName: user.fullName, newPassword: newPassword, serverUrl: grailsApplication.config.grails.serverURL])
            emailService.sendMail(emailDTO)
            user.password = newPassword
            user.confirmPassword = newPassword
            user.save()
            flash.message = "Success"
        } else {
            flash.error = "Email not for a valid user"
        }
        redirect(controller: "login", action: "index")
    }

    def loadTrendingTopics() {
        render(template: "/user/trendingtopics", model: [trendingTopics: Topic.getTrendingTopic()])
    }

    def loadInbox() {
        List<Resource> unreadPosts = ReadingItem.createCriteria().list([max: 3]) {
            projections {
                property("resource")
            }
            eq("user", session.user)
            eq("isRead", false)
            order("dateCreated", "desc")
        }
        render(template: "/user/inbox", model: [unreadPosts: unreadPosts])
    }
   def loadSubscription(){
       render(template:"/user/subscription",model:[subscribedTopics:session.user.subscribedTopics])
   }
    def updatePassword(String password, String confirmPassword) {
        def message
        if (password.equals(confirmPassword)) {

            User loggedInUser = User.read(session.user.id)
            if(!loggedInUser.password.equals(password)) {
                loggedInUser.password = password
                loggedInUser.confirmPassword = confirmPassword
                if (loggedInUser.validate()) {
                    loggedInUser.save()
                    message = ["message": "Successfully Updated"]
                } else {
                    message = ["message": "Could not Update"]
                }
            }
            else{
                message = ["message": "Successfully Updated"]
            }
        } else {
            message = ["message": "Password do not Match"]
        }
        render message as JSON
    }
    def updateProfile(String firstname, String lastname, String username)
    {
         User loggedInUser = User.read(session.user.id)
         String imagePath = photoUploaderService.uploadPicture(params.photo)
         loggedInUser.firstname = firstname
         loggedInUser.lastname =lastname
        loggedInUser.username =username
        loggedInUser.imagePath = imagePath
        if(loggedInUser.validate())
        {
            loggedInUser.save()
            flash.message = "Successfully updated"
        }
        else {
            flash.error = "Could not Update"
        }
    }
    def activateUser(long userId,boolean activate){
        def message
        User user = User.read(userId)
        if(user)
        {
            user.active = activate
            if(user.validate())
            {
                user.save()
                message = (activate)?["message":"User activated"]:["message":"User Deactivated"]
            }
            else {
                message = ["message":"Could not Activate"]
            }
        }
        else {
            message = ["message":"Could not Find User"]
        }
        render message as JSON
    }
    def uniqueEmail(String email)
    {
        render (User.countByEmail(email)==0) as JSON
    }
    def uniqueUsername(String username)
    {
        render (User.countByUsername(username)==0) as JSON
    }
}
