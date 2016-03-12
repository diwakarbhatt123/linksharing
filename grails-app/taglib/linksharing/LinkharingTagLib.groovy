package linksharing

import com.intelligrape.linksharing.TopicVO

class LinkharingTagLib {
    //static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"
    def isRead = { attr, body ->
        if (session.user) {
            ReadingItem readingItem = ReadingItem.findByUserAndResource(session.user, Resource.read(attr.resourceId))
            if (readingItem) {
                if (readingItem.isRead) {
                    out << g.link(controller: "readingItem", action: "changeIsRead", params: [isRead: false], id: "${readingItem.id}", "Mark as Unread")
                } else {
                    out << g.link(controller: "readingItem", action: "changeIsRead", params: [isRead: true], id: "${readingItem.id}", "Mark as Read")
                }
            } else {
                out << g.link(controller: "readingItem", action: "addToReadingItem", id: "${attr.resourceId}", "Add to Reading List")
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
        (loggedInUser && loggedInUser.canDeleteResource(resource)) ? out << link(controller: "resource", action: "delete", id: resource.id, "Delete") : out << ""

    }
    def canEditResouce = { attr, body ->
        User loggedInUser = session.user
        Resource resource = attr.resource
        (loggedInUser && loggedInUser.canDeleteResource(resource)) ? out << link(controller: "resource", action: "delete", id: resource.id, "Edit") : out << ""

    }
   def showSeriousness = {attr,body->

   }
    def canUpdateTopic = {attr,body->

    }
    def showSubscribe = { attr, body ->
        User loggedInUser = session.user
        if (loggedInUser) {
            (loggedInUser.isSubscribed(attr.topicId)) ? out << g.link(controller: "subscription", action: "delete", id: "${attr.topicId}", "Unsubscribe") : out << g.link(controller: "subscription", action: "save", id: "${attr.topicId}", "Subscribe")
        } else {
            out << ""
        }
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
    def userImage = { attr, body ->
        out << "<img src='${createLink(controller: "user", action: "renderFromDirectory", id: "${attr.userId}")}' width=64 height=64 >"
    }
    def documentOrLink = { attr, body ->
        Resource resource = Resource.read(attr.resourceId)
        if (resource?.isLinkResource()) {
            out << "<div class=\"col-xs-3\">${g.link(url: "${resource?.url}", target: "_blank", "View Full Site")}</div>"
        } else {
            out << "<div class=\"col-xs-2\">${g.link(controller: "documentResource", action: "downloadDocument", id: "${attr.resourceId}", "Download")}</div>"
        }
    }

}