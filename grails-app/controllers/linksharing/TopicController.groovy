package linksharing

import com.intelligrape.linksharing.ResourceSearchCO
import jline.internal.Log

class TopicController {

    def index() {}
    def show(int id)
    {

        Topic topic = Topic.read(id)
        List<User> subscribedUsers = topic.subscribedUsers
        render(view:"show",model:[subscribedUsers:subscribedUsers])
    }
    def save(String topicName,String visibility)
    {
        User loggedInUser = session.user
        Topic topic = new Topic(name:topicName,visibility:Visibility.toEnum(visibility),createdBy:loggedInUser)
        if(topic.validate())
        {
            topic.save()
            flash.message = "Success"
        }
        else {
            flash.error = "Cannot save topic"
        }
        redirect(controller: "user",action:"index")
    }
    def delete(int id) {
        Topic topic = Topic.load(id)
        if (topic) {
            topic.delete()
            render("Success")
        } else {
            render("Topic not found")
        }
    }
}
