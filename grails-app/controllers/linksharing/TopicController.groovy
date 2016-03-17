package linksharing

import com.intelligrape.linksharing.EmailDTO
import com.intelligrape.linksharing.TopicVO
import com.intelligrape.linksharing.Visibility
import grails.converters.JSON

class TopicController {
    def emailService

    def index() {}

    def show(long id, String q) {
        Topic topic = Topic.read(id)
        List<User> subscribedUsers = topic.subscribedUsers
        List<Resource> topicResources = Resource.findAllByTopic(topic)

        println topicResources
        TopicVO topicVO = new TopicVO(id: topic.id, name: topic.name, visibility: topic.visibility, count: Resource.countByTopic(topic), createdBy: topic.createdBy, subscribers: Subscription.countByTopic(topic))
        render(view: "show", model: [subscribedUsers: subscribedUsers, topicResources: topicResources, topic: topicVO])
    }

    def save(String topicName, String visibility) {
        User loggedInUser = session.user
        Topic topic = new Topic(name: topicName, visibility: Visibility.toEnum(visibility), createdBy: loggedInUser)
        if (topic.validate()) {
            topic.save()
            flash.message = "Success"
        } else {
            flash.error = "Cannot save topic"
        }
        redirect(controller: "user", action: "index")
    }

    def delete(long id) {
        def message
        Topic topic = Topic.load(id)
        if (topic) {
            topic.delete()
            message = ["message": "Deleted"]
        } else {
            message = ["message": "Topic not Found"]
        }
        render message as JSON
    }

    def update(long id, String visibility) {
        def message
        Topic topic = Topic.read(id)
        if (topic) {
            topic.visibility = Visibility.toEnum(visibility)
            topic.save()
            message = ["message": "Success"]
        } else {
            message = ["message": "Could not Update"]
        }
        render message as JSON
    }

    def updateTopicName(long id, String topic) {
        def message
        Topic updateTopic = Topic.read(id)
        if (updateTopic) {
            updateTopic.name = topic
            if (updateTopic.validate()) {
                updateTopic.save()
                message = ["message": "Topic Updated"]
            } else {
                message = ["message": "Could not be Updated"]
            }
        } else {
            message = ["message": "Cannot find topic"]
        }
        render message as JSON
    }

    def invite(String email) {
        Topic topic = Topic.findByName(params.topic)
        EmailDTO emailDTO = new EmailDTO(to: [email], subject: "${session.user} invited you to like a topic.", view: "/email/_invite", model: [topic: topic, user: session.user, serverUrl: grailsApplication.config.grails.serverURL])
        emailService.sendMail(emailDTO)
        redirect(url:"/")
    }

    def join(long id) {
        User invitedUser = session.user
        Topic invitedTopic = Topic.read(id)
        if (Subscription.countByTopicAndUser(invitedTopic, invitedUser)) {
            Subscription newSubscription = new Subscription(topic: invitedTopic, user: invitedUser)
            if (newSubscription.validate()) {
                newSubscription.save()
                flash.message = "Subscribed"
            } else {
                flash.error = "Could'nt save Subscription"
            }
        } else {
            flash.message = "Already Subscribed"
        }
        redirect(controller: "user", action: "index")
    }

    def postSearch(long id, String q) {
        Topic topic = Topic.read(id)
        List<Resource> topicResources = Resource.findAllByTopic(topic)
        if (q && !q.equals("")) {
            topicResources = Resource.createCriteria().list {
                ilike("description", "%${q}%")
                createAlias('topic','top');
                    eq("top.id", id)
            }
        }
        render(template:"/topic/resourcepanelbody",model:[resources:topicResources])
    }
}
