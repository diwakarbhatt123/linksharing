package linksharing

import com.intelligrape.linksharing.EmailDTO
import com.intelligrape.linksharing.RandomPasswordGenerator
import com.intelligrape.linksharing.TopicVO
import jline.internal.Log


class UserController {
    def emailService

    def index() {
        List<TopicVO> trendingTopics = Topic.trendingTopic
        render(view: "user", model: [trendingTopics: trendingTopics])
    }

    def usershow() {
        List<User> userList = User.list([max: 10])
        render(view: "usershow", model: [userList: userList])
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
        List<Resource> unreadPosts = ReadingItem.createCriteria().list([max:3]) {
            projections {
                property("resource")
            }
            eq("user", session.user)
            eq("isRead", false)
            order("dateCreated","desc")
        }
        render(template: "/user/inbox", model: [unreadPosts: unreadPosts])
    }
}
