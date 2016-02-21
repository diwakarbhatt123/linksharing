package linksharing

import jline.internal.Log
import org.hibernate.Hibernate
import spock.util.mop.Use

class Topic {

    String name
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    static hasMany = [subscriptions:Subscription,resources:Resource]
    static belongsTo = [createdBy:User]
    static constraints = {
        name(nullable: false, blank: false, unique: true)
        visibility(nullable: false)
        createdBy(nullable: false)
        resources(nullable: true)
        subscriptions(nullable: true)
    }

    def afterInsert(){
        Subscription.withNewSession {
        Subscription subscription = new Subscription(topic: this,user: createdBy,seriousness: Seriousness.VERYSERIOUS)
        Log.info(subscription.validate())
        if(subscription.validate())
        {
            subscription.save()
        }
        else
        {
            Log.error("Validation failed")
        }
        }
        }

    @Override
    String toString() {
      "Topic Name: ${name},Created By : ${createdBy}"
    }
}