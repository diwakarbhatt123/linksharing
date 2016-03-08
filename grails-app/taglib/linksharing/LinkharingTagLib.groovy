package linksharing

import com.intelligrape.linksharing.TopicVO

class LinkharingTagLib {
    //static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"
    def isRead = { attr, body ->
        if (session.user) {
            ReadingItem readingItem = ReadingItem.findByUserAndResource(session.user, attr.resource)
            if (readingItem) {
                if (readingItem.isRead) {
                    out << g.link(controller: "readingItem", action: "changeIsRead", params: [isRead: false], id: "${readingItem.id}", "Mark as Unread")
                } else {
                    out << g.link(controller: "readingItem", action: "changeIsRead", params: [isRead: true], id: "${readingItem.id}", "Mark as Read")
                }
            } else {
                out << ""
            }
        } else {
            out << ""
        }
    }
    def trendingTopics = { body ->
        List<TopicVO> trendingTopics = Topic.trendingTopic
        out << render(template: "/user/trendingtopics", model: [trendingTopics: trendingTopics])
    }
    def topPosts = { body ->
        List topPosts = Resource.topPosts()
        out << render(template: "/login/toppost", model: [topPosts: topPosts])

    }
    def canDeleteResouce = { attr, body ->
        User loggedInUser = session.user
        Resource resource = attr.resource
        (loggedInUser.canDeleteResource(resource)) ? out << link(controller: "resource", action: "delete", id: resource.id, "Delete") : out << ""

    }
    def showSubscribe = { attr, body ->
        User loggedInUser = session.user
        (loggedInUser.isSubscribed(attr.topicId)) ? out << g.link(controller: "subscription", action: "delete", id: "${attr.topicId}", "Unsubscribe") : out << g.link(controller: "subscription", action: "save", id: "${attr.topicId}", "Subscribe")
    }
    def subscriptionCount = { attr, body ->
        int subscription;
        if (attr.topicId) {
            subscription = Subscription.countByTopic(Topic.read(attr.topicId))
        } else if (attr.user) {
            subscription = Subscription.countByUser(session.user)
        } else if (attr.topicId && attr.user) {
            subscription = Subscription.countByUserAndTopic(session.user, Topic.read(attr.topicId))
        }
        out << subscription
    }
    def resourceCount = { attr, body ->
        out << Resource.countByTopic(Topic.read(attr.topicId))
    }
    def topicCount = { attr, body ->
        out << Topic.countByCreatedBy(attr.user)
    }

}