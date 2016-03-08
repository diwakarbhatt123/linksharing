package linksharing

class SubscriptionController {

    def index() {}

    def delete(int id) {
        Subscription subscription = Subscription.findByUserAndTopic(session.user,Topic.read(id))
        if (subscription) {
            subscription.delete(flush:true)
      flash.message = "Subscription Deleted Successfully"
        } else {
          flash.error = "Subscription Not Found"
        }
        redirect(controller:"user",action:"index")
    }

    def save(int id) {
        User subscriber = session.user
        Subscription newSubscription = new Subscription(user: subscriber, topic: Topic.get(id),seriousness:Seriousness.SERIOUS)
        if (newSubscription.validate()) {
            newSubscription.save()
            flash.message = "Subscribed"
        } else {
            flash.error = "Cannot Create Subscription"
        }
        redirect(controller:"user",action:"index")

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
