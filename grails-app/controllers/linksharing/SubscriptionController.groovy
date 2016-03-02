package linksharing

class SubscriptionController {

    def index() {}

    def delete(int id) {
        Subscription subscription = Subscription.read(id)
        if (subscription) {
            subscription.delete(flush:true)
            render("Success")
        } else {
            render("Subscription not found")
        }
    }

    def save(int topicId) {
        User subscriber = session.user
        Subscription newSubscription = new Subscription(user: subscriber, topic: Topic.get(topicId),seriousness:Seriousness.SERIOUS)
        if (newSubscription.validate()) {
            newSubscription.save()
            render("Success")
        } else {
            println newSubscription.errors.allErrors
            render("Cannot make subscription")
        }
    }

    def update(int id, String seriousness) {
        Subscription subscription = Subscription.read(id)
        if (subscription) {
            subscription.seriousness = Seriousness.getSeriousness(seriousness)
            if (subscription.save()) {
                render("Success")
            } else {
                println subscription.errors.allErrors
                render("Subscription cannot be updated")
            }
        }
        else {
            render("No subscription found")
        }
    }
}
