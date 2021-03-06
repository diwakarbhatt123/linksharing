package linksharing

import com.intelligrape.linksharing.EmailDTO
import com.intelligrape.linksharing.RandomPasswordGenerator
import com.intelligrape.linksharing.TopicVO
import com.intelligrape.linksharing.UserCO
import grails.converters.JSON

class UserController {
    def emailService
    def photoUploaderService

    def index() {
        List<TopicVO> trendingTopics = Topic.trendingTopic
        render(view: "index", model: [trendingTopics: trendingTopics])
    }

    def showProfile() {
        render(view: "/user/profile")
    }

    def loadCreatedTopics() {
        render(template: "/user/createdTopics", model: [createdTopics: session.user.getCreatedTopics()])
    }
    def loadCreatedPosts(long id){

        List<Resource> posts = Resource.findAllByCreatedBy(User.get(id));
        render(template:"/user/createdPosts",model:[createdPosts:posts])
    }

    def usershow() {
        render(view: "usershow", model: [userCount: User.count])
    }

    def userProfile(String username)
    {
        User user = User.findByUsername(username);
        List<Topic> topics = Topic.findAllByCreatedBy(user);
        List<Resource> posts = Resource.findAllByCreatedBy(user,[max:5]);
        println topics
        render(view: "userProfile",model:[user:user,userPosts:posts,topic:topics])
    }

    def loadUserTable(String q, String sortBy) {
        params.max = (params.max)?params.max:10;
        List<User> userList = User.list(params);
        if (q && !q.equals("")) {
            println "here"
            userList = User.createCriteria().list(params) {
                or {
                    ilike("username", "%${q}%")
                    ilike("firstname", "%${q}%")
                }
            }
        } else if (sortBy) {
            if (sortBy.equalsIgnoreCase("activated")) {
                userList = User.findAllByActive(true);
            } else if (sortBy.equalsIgnoreCase("deactivated")) {
                userList = User.findAllByActive(false);
            }
        }
        render(template: "/user/userTable", model: [users: userList])
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
        List<Resource> unreadPosts = ReadingItem.createCriteria().list() {
            projections {
                property("resource")
            }
            eq("user", session.user)
            order("isRead", "asc")
        }
        render(template: "/user/inbox", model: [unreadPosts: unreadPosts])
    }

    def loadSubscription() {
        render(template: "/user/subscription", model: [subscribedTopics: session.user.subscribedTopics])
    }

    def updatePassword(String password, String confirmPassword) {
        def message
        if (password.equals(confirmPassword)) {

            User loggedInUser = User.read(session.user.id)
            if (!loggedInUser.password.equals(password)) {
                loggedInUser.password = password
                loggedInUser.confirmPassword = confirmPassword
                if (loggedInUser.validate()) {
                    loggedInUser.save()
                    message = ["message": "Successfully Updated"]
                } else {
                    message = ["message": "Could not Update"]
                }
            } else {
                message = ["message": "Successfully Updated"]
            }
        } else {
            message = ["message": "Password do not Match"]
        }
        render message as JSON
    }

    def updateProfile(UserCO userCO) {
        println userCO
        User loggedInUser = User.read(session.user.id)
        if (!params.photo.empty) {
            String imagePath = photoUploaderService.uploadPicture(params.photo)
            loggedInUser.imagePath = imagePath
        }
        loggedInUser.firstname = userCO.firstname
        loggedInUser.lastname = userCO.lastname
        loggedInUser.username = userCO.username
        loggedInUser.city = userCO.city
        loggedInUser.country = userCO.country
        loggedInUser.bio = userCO.bio
        if (loggedInUser.validate()) {
            loggedInUser.save()
            session.user = loggedInUser
            flash.message = "Successfully updated"
            redirect(url:request.getHeader('referer'))
        } else {
            flash.error = "Could not Update"
        }
        println loggedInUser.errors.allErrors
        println flash.message
    }

    def activateUser(long userId, boolean activate) {
        def message
        User user = User.read(userId)
        if (user) {
            user.active = activate
            if (user.validate()) {
                user.save()
                message = (activate) ? ["message": "User activated"] : ["message": "User Deactivated"]
            } else {
                message = ["message": "Could not Activate"]
            }
        } else {
            message = ["message": "Could not Find User"]
        }
        render message as JSON
    }

    def uniqueEmail(String email) {
        render(User.countByEmail(email) == 0) as JSON
    }

    def uniqueUsername(String username) {
        render(User.countByUsername(username) == 0) as JSON
    }
    def userProfileShow(long id)
    {
        User user = User.read(id)
        List <Topic> userTopics = Topic.findByCreatedBy(user);
        println userTopics
        List <Resource> userResource = Resource.findByCreatedBy(user);
        render(view:"profilepage",model:[userTopics:userTopics,subscribedTopics:user.subscribedTopics,userPosts:userResource])
    }
}
