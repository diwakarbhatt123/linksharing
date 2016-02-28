package linksharing

import com.intelligrape.linksharing.ResourceSearchCO

class TopicController {

    def index() {}
    def show(int id)
    {
        Topic topic = Topic.read(id)
        if(topic)
        {
            if(topic.visibility==Visibility.PUBLIC)
                render("Success")
            else {
                if(Subscription.countByUserAndTopic(session.getAt("user"),topic)>0)
                {
                    render("Success")
                }
                else {
                    flash.error = "User not Subscribed"
                    redirect(controller:"login",action:"index")
                }
            }
        }
        else {
            flash.error = "Topic not found in database"
            redirect(controller:"login",action:"index")
        }
    }
    def save(String topicName,String visibility)
    {
        User loggedInUser = User.findByFirstname(session.user)
        Topic topic = new Topic(name:topicName,visibility:Visibility.toEnum(visibility),createdBy:loggedInUser)
        if(topic.validate())
        {
            topic.save()
            flash.message = "Success"
            render(flash.message)
        }
        else {
            flash.error = "Cannot save topic"
            render(flash.error)
        }

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
