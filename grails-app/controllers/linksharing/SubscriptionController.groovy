package linksharing

import grails.converters.JSON

class SubscriptionController {

    def index() {}

    def delete(int id) {
        Subscription subscription = Subscription.findByUserAndTopic(session.user,Topic.read(id))
        if (subscription) {
            subscription.delete(flush:true)
            [message:"Unsubscribed"] as JSON
        } else {
           [error:"Subscription not Found"] as JSON
        }
        //redirect(controller:"user",action:"index")

    }

    def save(int id) {
        User subscriber = session.user
        Subscription newSubscription = new Subscription(user: subscriber, topic: Topic.get(id),seriousness:Seriousness.SERIOUS)
        if (newSubscription.validate()) {
            newSubscription.save()
            [message:"Subscribed"] as JSON
        } else {
            [error:"Could not Subscribe"] as JSON
        }
        //redirect(controller:"user",action:"index")

    }

    def update(int id, String seriousness) {
        Subscription subscription = Subscription.read(id)
        if (subscription) {
            subscription.seriousness = Seriousness.getSeriousness(seriousness)
            if (subscription.save()) {
                [message:"Success"] as JSON
            } else {
                println subscription.errors.allErrors
                [error:"Could not Subscribe"] as JSON
            }
        }
        else {
                [error:"Subscription not found"] as JSON
        }
    }
}
