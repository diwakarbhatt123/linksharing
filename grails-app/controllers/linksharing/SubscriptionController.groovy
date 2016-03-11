package linksharing

import grails.converters.JSON

class SubscriptionController {

    def index() {}

    def delete(int id) {
        Subscription subscription = Subscription.findByUserAndTopic(session.user, Topic.read(id))
        if (subscription) {
            subscription.delete(flush: true)
            flash.message = "Subscription Deleted Successfully"
        } else {
            flash.error = "Subscription Not Found"
        }
        redirect(controller: "user", action: "index")

    }

    def save(int id) {
        User subscriber = session.user
        Subscription newSubscription = new Subscription(user: subscriber, topic: Topic.get(id), seriousness: Seriousness.SERIOUS)
        if (newSubscription.validate()) {
            newSubscription.save()
            flash.message = "Subscribed"
        } else {
            flash.error = "Cannot Create Subscription"
        }
        redirect(controller: "user", action: "index")

    }

    def update(long id, String seriousness) {
        def message
        Subscription subscription = Subscription.findByUserAndTopic(session.user, Topic.read(id))
        if (subscription) {
            subscription.seriousness = Seriousness.getSeriousness(seriousness)
            subscription.save()
            message = ["message": "Success"]
        } else {
            message = ["message": "Could not Update"]
        }
        render message as JSON
    }
}
