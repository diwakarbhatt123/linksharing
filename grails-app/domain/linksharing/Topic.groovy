package linksharing

import com.intelligrape.linksharing.TopicVO
import jline.internal.Log
import org.hibernate.Hibernate

class Topic {

    String name
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static hasMany = [subscriptions: Subscription, resources: Resource]
    static belongsTo = [createdBy: User]
    static constraints = {
        name(nullable: false, blank: false, unique: true)
        visibility(nullable: false)
        createdBy(nullable: false)
        resources(nullable: true)
        subscriptions(nullable: true)
    }
    static mapping = {
        sort("name")
    }

    def afterInsert() {
        Subscription.withNewSession {
            Subscription subscription = new Subscription(topic: this, user: createdBy, seriousness: Seriousness.VERYSERIOUS)
            Log.info(subscription.validate())
            if (subscription.validate()) {
                subscription.save()
            } else {
                Log.error("Validation failed")
            }
        }
    }

    static List<TopicVO> getTrendingTopic() {
       List list =  Resource.createCriteria().list(max : 5){
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

            trendingTopics.add(new TopicVO(count:val.getAt(1),id:val.getAt(2),name:val.getAt(3),visibility:val.getAt(4),createdBy:val.getAt(5)))
        }
        return trendingTopics
    }

    @Override
    String toString() {
        "${name}"
    }
}