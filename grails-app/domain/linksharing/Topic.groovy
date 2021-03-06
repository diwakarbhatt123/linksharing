package linksharing

import com.intelligrape.linksharing.ResourceSearchCO
import com.intelligrape.linksharing.Seriousness
import com.intelligrape.linksharing.TopicVO
import com.intelligrape.linksharing.Visibility
import jline.internal.Log

class Topic {

    String name
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static transients = ['subscribedUsers']
    static hasMany = [subscriptions: Subscription, resources: Resource]
    static belongsTo = [createdBy: User]
    static constraints = {
        name(nullable: false, blank: false, unique: 'createdBy')
        visibility(nullable: false)
        createdBy(nullable: false)
        resources(nullable: true)
        subscriptions(nullable: true)
    }

    List<User> getSubscribedUsers() {
        List<User> subUsers = Subscription.createCriteria().list {
            projections {
                property("user")
            }
            eq("topic", Topic.findByName("Grails"))
        }
        return subUsers
    }
    static mapping = {
        sort("name")
    }
    static namedQueries = {
        search { ResourceSearchCO co ->
            if (co.q) {
                ilike("name", "%${co.q}%")
            }
        }
    }

    def afterInsert() {
        Subscription.withNewSession {
            Subscription subscription = new Subscription(topic: this, user: this.createdBy, seriousness: Seriousness.VERYSERIOUS)
            Log.info(subscription.validate())
            if (subscription.validate()) {
                subscription.save()
            } else {
                Log.error("Validation failed")
            }
        }
    }

    static List<TopicVO> getTrendingTopic() {
<<<<<<< HEAD
       List list =  Resource.createCriteria().list(max : 6){
           projections
                   {
                       groupProperty("topic")
                       count("id","topiccount")
                       createAlias("topic","top")
                       property("top.id")
                       property("top.name")
                       property("top.visibility")
                       property("top.createdBy")
                   }
           eq("top.visibility",Visibility.PUBLIC)
           order("topiccount","desc")
       }
        List <TopicVO> trendingTopics =  new ArrayList();
        list.eachWithIndex{val,index->
=======
        List list = Resource.createCriteria().list(max: 5) {
            projections
                    {
                        groupProperty("topic")
                        count("id", "topiccount")
                        createAlias("topic", "top")
                        property("top.id")
                        property("top.name")
                        property("top.visibility")
                        property("top.createdBy")
                    }
            eq("top.visibility", Visibility.PUBLIC)
            order("topiccount", "desc")
        }
        List<TopicVO> trendingTopics = new ArrayList();
        list.eachWithIndex { val, index ->
>>>>>>> bd373b2f550e42a7ecaf10cc8e86241ba9b8d157

            trendingTopics.add(new TopicVO(count: val.getAt(1), id: val.getAt(2), name: val.getAt(3), visibility: val.getAt(4), createdBy: val.getAt(5)))
        }
        return trendingTopics
    }

    boolean isPublic() {
        return this.visibility == Visibility.PUBLIC
    }

    boolean canViewedBy(User user) {
        return (user?.admin || this.isPublic() || Subscription.countByUserAndTopic(user, this))
    }

    @Override
    String toString() {
        "${name}"
    }
}